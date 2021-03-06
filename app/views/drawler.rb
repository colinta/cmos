# @provides GM::Drawler
module GM

  if false
    # declaring these functions here will make them available in the REPL.
    CATransform3DMakeRotation(0, 0, 0, 0)
    CATransform3DMakeTranslation(0, 0, 0)
    CATransform3DMakeScale(1.0, 1.0, 1.0)
    CATransform3DRotate(t, 0, 0, 0, 0)
    CATransform3DScale(t, 0, 0, 0)
    CATransform3DTranslate(t, 0, 0, 0)
  end


  # This class is meant to be created using the `Drawler` method, passing in a
  # frame and a block that is executed in the `drawRect` method.  You can either
  # accept the context as an argument to the block, or use the `@context`
  # instance variable.
  class Drawler < UIView
    class << self
      attr_accessor :draw_code
    end

    def drawRect(rect)
      @context = UIGraphicsGetCurrentContext()
      CGContextSaveGState(@context)
      draw_code = self.class.draw_code
      if draw_code
        if draw_code.arity == 0
          instance_exec(&draw_code)
        else
          instance_exec(@context, &draw_code)
        end
      end
      CGContextRestoreGState(@context)
    end

  end


  def Drawler(frame=nil, &draw_code)
    klass = Class.new(Drawler)
    klass.draw_code = draw_code
    return frame ? klass.alloc.initWithFrame(frame) : klass
  end


  class Drawing < UIView
    attr_accessor :draw

    def self.new(frame=nil, drawings=nil)
      if frame
        instance = self.alloc.initWithFrame(frame)
      else
        instance = self.alloc.init
      end

      if drawings
        instance.draw = drawings
        unless frame
          self.frame = [[0, 0], intrinsicContentSize]
        end
      end

      return instance
    end

    def initWithFrame(frame)
      super.tap do
        self.backgroundColor = :clear.uicolor
        self.opaque = false
      end
    end

    def draw=(drawings)
      if drawings.is_a? Enumerable
        draw.concat(drawings)
      else
        draw << drawings
      end
      setNeedsDisplay
    end

    def draw
      @draw ||= []
    end

    def <<(view_or_drawing)
      if view_or_drawing.is_a?(UIView)
        super
      else
        draw << view_or_drawing
        setNeedsDisplay
      end
    end

    def drawRect(rect)
      context = UIGraphicsGetCurrentContext()
      @draw.each do |drawing|
        CGContextSaveGState(context)
        drawing.draw
        CGContextRestoreGState(context)
      end
    end

    def intrinsicContentSize
      rect = nil
      @draw.each do |drawing|
        next unless drawing.respond_to?(:frame)

        if rect
          rect = CGRectUnion(rect, drawing.frame)
        else
          rect = drawing.frame
        end
      end

      rect and rect.size or [0, 0]
    end

  end

  module D

    class Draw
      def self.attr_assigner(name, default=nil, &converter)
        # writer calls the setter
        define_method("#{name}=") do |value|
          self.send(name, value)
        end
        # combined getter/setter
        define_method(name) do |*args|
          if args.length == 1
            value = args[0]
            if converter
              value = instance_exec(value, &converter)
            end
            instance_variable_set("@#{name}", value)
            return self
          elsif args.length > 1
            raise "Too many args on the dance floor"
          else
            return instance_variable_get("@#{name}") || default
          end
        end
      end

      def rotate(angle)
        transform [:rotate, angle]
        self
      end

      def scale(scale)
        if scale.is_a?(Numeric)
          transform [:scale, scale]
        elsif scale
          transform [:scale, SugarCube::CoreGraphics::Point(scale)]
        end
        self
      end

      def translate(pt)
        transform [:translate, SugarCube::CoreGraphics::Point(pt)]
        self
      end

      private def transform(op)
        @transform ||= []
        @transform << op
      end

      def draw
        raise 'Implement the `draw` method'
      end

      def frame
        CGRect.new([0, 0], [0, 0])
      end

      def defaults(context=nil)
        context ||= UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        if @transform
          @transform.each do |op, value|
            case op
            when :translate
              CGContextTranslateCTM(context, value.x, value.y)
            when :scale
              if value.is_a?(Numeric)
                CGContextScaleCTM(context, value, value)
              else
                CGContextScaleCTM(context, value.x, value.y)
              end
            when :rotate
              CGContextRotateCTM(context, value)
            end
          end
        end
        yield
        CGContextRestoreGState(context)
      end

    end

    class Primitive < Draw
      attr_assigner(:line_width, 1)
      attr_assigner(:line_dash)
      attr_assigner(:stroke, UIColor.clearColor) { |val| val ? val.uicolor : UIColor.clearColor }
      attr_assigner(:fill, UIColor.clearColor) { |val| val ? val.uicolor : UIColor.clearColor }
      attr_assigner(:fill_phase) { |val| val && SugarCube::CoreGraphics::Size(val) }

      # setup the default drawing context, and perform your drawing in the block
      # you pass to this function
      def defaults(context=nil)
        context ||= UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        stroke.setStroke
        fill.setFill
        if fill_phase
          CGContextSetPatternPhase(context, fill_phase)
        end
        CGContextSetLineWidth(context, self.line_width)
        if line_dash
          CGContextSetLineDash(context, 0, line_dash.to_pointer(:float), line_dash.length)
        end
        super
        CGContextRestoreGState(context)
      end

    end

    class Line < Primitive
      attr_assigner(:p1) { |pt| SugarCube::CoreGraphics::Point(pt) }
      attr_assigner(:p2) { |pt| SugarCube::CoreGraphics::Point(pt) }

      def initialize(p1, p2)
        self.p1(p1)
        self.p2(p2)
      end

      def draw
        context = UIGraphicsGetCurrentContext()
        defaults(context) do
          CGContextMoveToPoint(context, p1.x, p1.y)
          CGContextAddLineToPoint(context, p2.x, p2.y)
          CGContextStrokePath(context)
        end
      end

      def frame
        frame = CGRectStandardize(CGRectMake(p1.x, p1.y,  p2.x - p1.x, p2.y - p1.y))
        if frame.size.width == 0
          frame.size.width = self.line_width
        end
        if frame.size.height == 0
          frame.size.height = self.line_width
        end
        frame
      end

      # convert the current line to a rect
      def rect()
        Rect.new(p1, p2)
          .stroke(stroke)
          .fill(fill)
          .fill_phase(fill_phase)
          .line_width(line_width)
          .line_dash(line_dash)
      end

    end

    class Rect < Primitive
      attr_assigner(:rect) { |rect| SugarCube::CoreGraphics::Rect(rect) }
      attr_assigner(:corner)  # corner radius/radii can be a numeric or CGSize
      attr_assigner(:corners)  # UIRectCorner indicating which corners

      def initialize(*rect_args)
        if CGRect === rect_args[0]
          @rect = rect_args[0]
        else
          @rect = SugarCube::CoreGraphics::Rect(*rect_args)
        end
      end

      def path
        if self.corner && self.corners
          if self.corner.is_a?(Numeric)
            self.corner = CGSize.new(self.corner, self.corner)
          end
          return UIBezierPath.bezierPathWithRoundedRect(CGRectStandardize(self.rect), byRoundingCorners:self.corners, cornerRadii:self.corner)
        elsif self.corner
          if self.corner.is_a?(Numeric)
            return UIBezierPath.bezierPathWithRoundedRect(CGRectStandardize(self.rect), cornerRadius:self.corner)
          else
            return UIBezierPath.bezierPathWithRoundedRect(CGRectStandardize(self.rect), byRoundingCorners:UIRectCornerAllCorners, cornerRadii:self.corner)
          end
        else
          return UIBezierPath.bezierPathWithRect(self.rect)
        end
      end

      def draw
        context = UIGraphicsGetCurrentContext()
        defaults(context) do
          CGContextAddPath(context, self.path.CGPath)
          CGContextDrawPath(context, KCGPathFillStroke)
        end
      end

    end

    class Circle < Primitive
      attr_assigner(:center) { |pt| SugarCube::CoreGraphics::Point(pt) }
      attr_assigner(:radius)

      def initialize(center, radius=nil, fill_color=nil)
        self.center(center)
        self.radius(radius)
        self.stroke(:clear)  # default to no border
        self.fill(fill_color) if fill_color
      end

      def path
        UIBezierPath.bezierPathWithOvalInRect(frame)
      end

      def draw
        context = UIGraphicsGetCurrentContext()
        defaults(context) do
          CGContextAddEllipseInRect(context, frame)
          CGContextDrawPath(context, KCGPathFillStroke)
        end
      end

      def frame
        CGRectStandardize(CGRectMake(center_x - radius, center_y - radius,  radius * 2, radius * 2))
      end

      def center_x ; @center[0] ; end
      def center_y ; @center[1] ; end

    end

    class Oval < Circle
      attr_assigner(:size) { |size| SugarCube::CoreGraphics::Size(size) }

      def radius=(value)
        self.size = [value * 2, value * 2]
      end

      def frame
        radius_x = self.size.width
        radius_y = self.size.height
        CGRectStandardize(CGRectMake(center_x - radius_x, center_y - radius_y,  radius_x * 2, radius_y * 2))
      end

    end

    class Path < Primitive
      attr_assigner(:path)

      def initialize(pt_or_path=nil, y=nil)
        if pt_or_path.is_a?(UIBezierPath)
          @path = pt_or_path
        else
          @path = UIBezierPath.bezierPath
          @path.usesEvenOddFillRule = true

          if pt_or_path
            move_to(pt_or_path, y)
          end
        end
      end

      def last
        @path.currentPoint
      end

      def frame
        @path.bounds
      end

      def move_to(pt_or_x, y=nil)
        if pt_or_x.is_a?(Numeric)
          pt = SugarCube::CoreGraphics::Point(pt_or_x, y)
        else
          pt = SugarCube::CoreGraphics::Point(pt_or_x)
        end

        @path.moveToPoint(pt)
        self
      end

      def delta_move(pt_or_x, y=nil)
        if pt_or_x.is_a?(Numeric)
          pt = SugarCube::CoreGraphics::Point(pt_or_x, y)
        else
          pt = SugarCube::CoreGraphics::Point(pt_or_x)
        end

        pt.x += last.x
        pt.y += last.y
        move_to(pt)
      end

      def delta(pt_or_x, y=nil)
        if pt_or_x.is_a?(Numeric)
          pt = SugarCube::CoreGraphics::Point(pt_or_x, y)
        else
          pt = SugarCube::CoreGraphics::Point(pt_or_x)
        end

        pt.x += last.x
        pt.y += last.y
        line(pt)
      end

      def line(pt_or_x, y=nil)
        if pt_or_x.is_a?(Numeric)
          pt = SugarCube::CoreGraphics::Point(pt_or_x, y)
        else
          pt = SugarCube::CoreGraphics::Point(pt_or_x)
        end

        @path.addLineToPoint(pt)
        self
      end

      def arc_delta(delta, angle:angle)
        delta = SugarCube::CoreGraphics::Point(delta)
        center = SugarCube::CoreGraphics::Point(last)
        center.x += delta.x
        center.y += delta.y
        arc(center, angle:angle)
      end

      def arc(center, angle:angle)
        center = SugarCube::CoreGraphics::Point(center)
        dx = last.x - center.x
        dy = last.y - center.y
        radius = Math.sqrt(dx**2 + dy**2)
        start_angle = Math.atan2(dy, dx)
        end_angle = start_angle + angle
        clockwise = angle > 0
        @path.addArcWithCenter(center, radius: radius, startAngle: start_angle, endAngle: end_angle, clockwise: clockwise)
        self
      end

      def curve(pt, control:control)
        curve(pt, control1:control, control2: control)
      end

      def curve(pt, control1:control1, control2:control2)
        pt = SugarCube::CoreGraphics::Point(pt)
        control1 = SugarCube::CoreGraphics::Point(control1)
        control2 = SugarCube::CoreGraphics::Point(control2)

        @path.addCurveToPoint(pt, controlPoint1:control1, controlPoint2:control2)
        self
      end

      def close
        @path.closePath
        self
      end

      def draw
        @path.lineWidth = self.line_width

        context = UIGraphicsGetCurrentContext()
        defaults(context) do
          CGContextAddPath(context, @path.CGPath)
          CGContextDrawPath(context, KCGPathFillStroke)
        end
      end

    end

    class LinearGradient < Line
      attr_assigner(:colors) { |colors| colors.map{ |c| c.uicolor }}
      attr_assigner(:points)
      attr_assigner(:extended, false)  # if true, gradient options are KCGGradientDrawsBeforeStartLocation | KCGGradientDrawsAfterEndLocation

      def initialize(p1, p2, colors, points=nil)
        super(p1, p2)
        if colors.is_a?(Hash)
          self.points(colors.keys)
          self.colors(colors.values)
        else
          self.colors(colors)
          self.points(points)
        end
      end

      def draw
        context = UIGraphicsGetCurrentContext()
        color_space = CGColorSpaceCreateDeviceRGB()
        cgcolors = self.colors.map { |color| color.CGColor }

        points = self.points
        unless points
          points = []
          colors.length.times do |index|
            points << (index / (colors.length - 1.0))
          end
        end

        gradient = CGGradientCreateWithColors(color_space, cgcolors, points.to_pointer(:float))
        options = 0
        if self.extended
          options |= KCGGradientDrawsBeforeStartLocation
          options |= KCGGradientDrawsAfterEndLocation
        end
        CGContextDrawLinearGradient(context, gradient, p1, p2, options)
      end

    end

    class RadialGradient < Primitive
      attr_assigner(:center) { |pt| SugarCube::CoreGraphics::Point(pt) }
      attr_assigner(:radius)
      attr_assigner(:colors) { |colors| colors.map{ |c| c.uicolor }}
      attr_assigner(:points)
      attr_assigner(:extended, false)  # if true, gradient options are KCGGradientDrawsBeforeStartLocation | KCGGradientDrawsAfterEndLocation

      def initialize(center, radius, colors, points=nil)
        self.center(center)
        self.radius(radius)
        if colors.is_a?(Hash)
          self.points(colors.keys)
          self.colors(colors.values)
        else
          self.colors(colors)
          self.points(points)
        end
      end

      def draw
        context = UIGraphicsGetCurrentContext()
        color_space = CGColorSpaceCreateDeviceRGB()
        cgcolors = self.colors.map { |color| color.CGColor }

        points = self.points
        unless points
          points = []
          colors.length.times do |index|
            points << (index / (colors.length - 1.0))
          end
        end

        gradient = CGGradientCreateWithColors(color_space, cgcolors, points.to_pointer(:float))
        CGContextDrawRadialGradient(context, gradient, center, 0, center, radius, self.extended ? KCGGradientDrawsBeforeStartLocation|KCGGradientDrawsAfterEndLocation : 0)
      end

      def frame
        CGRectStandardize(CGRectMake(center_x - radius, center_y - radius,  radius * 2, radius * 2))
      end

      def center_x ; @center[0] ; end
      def center_y ; @center[1] ; end

    end

    class Text < Draw
      attr_assigner(:stroke_width, 1)
      attr_assigner(:text) { |text| text.is_a?(NSAttributedString) ? text : text.to_s }
      attr_assigner(:font) { |font| font.uifont }
      attr_assigner(:color, UIColor.blackColor) { |val| val && val.uicolor }
      attr_assigner(:background) { |val| val && val.uicolor }
      attr_assigner(:border, nil) { |val| val && (val.is_a?(Enumerable) ? val : [val]) }
      attr_assigner(:halign, :center)  # :left :right
      attr_assigner(:valign, :center)  # :top :bottom

      def initialize(text=nil)
        self.text = text
      end

      def frame
        CGRect.new([0, 0], size)
      end

      def size
        if @text.is_a?(NSAttributedString)
          @text.size
        elsif @text
          @text.sizeWithAttributes(text_attrs)
        else
          CGSize.new(0, 0)
        end
      end

      def draw_border
        return unless border
        context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 0.5)
        l = draw_point_left
        r = l + size.width
        t = draw_point_top
        b = t + size.height
        border.each do |location|
          case location
          when :top
            CGContextMoveToPoint(context, l, t)
            CGContextAddLineToPoint(context, r, t)
            CGContextStrokePath(context)
          when :bottom
            CGContextMoveToPoint(context, l, b)
            CGContextAddLineToPoint(context, r, b)
            CGContextStrokePath(context)
          when :left
            CGContextMoveToPoint(context, l, t)
            CGContextAddLineToPoint(context, l, b)
            CGContextStrokePath(context)
          when :right
            CGContextMoveToPoint(context, r, t)
            CGContextAddLineToPoint(context, r, b)
            CGContextStrokePath(context)
          end
        end
      end

      def draw
        context = UIGraphicsGetCurrentContext()
        defaults do
          if @text.is_a?(NSAttributedString)
            draw_attributed
          elsif @text
            draw_string
          end
          draw_border
        end
      end

      private def draw_point_left
        case halign
        when :center
          -size.width / 2
        when :right
          -size.width
        else
          0
        end
      end

      private def draw_point_top
        case valign
        when :center
          -size.height / 2
        when :bottom
          -size.height
        else
          0
        end
      end

      private def draw_point
        CGPoint.new(draw_point_left, draw_point_top)
      end

      def text_attrs
        attrs = {}
        possibles = {
          NSFontAttributeName            => font,
          NSForegroundColorAttributeName => color,
          NSBackgroundColorAttributeName => background,
          NSStrokeWidthAttributeName     => stroke_width,
        }.each do |key, value|
          if value
            attrs[key] = value
          end
        end

        attrs
      end
      private :text_attrs

      private def draw_string
        @text.drawAtPoint(draw_point, withAttributes: text_attrs)
      end

      private def draw_attributed
        @text.drawAtPoint(draw_point)
      end

    end

    class Custom < Primitive

      def initialize(&block)
        @yield = block
      end

      def draw
        if @yield
          defaults do
            if @yield.arity == 1
              context = UIGraphicsGetCurrentContext()
              @yield.call(context)
            else
              @yield.call
            end
          end
        end
      end

    end

    class Mask < Custom
      # UIBezierPath
      attr_assigner(:path)

      # array of D::Draw objects
      attr_assigner(:inside) { |inside| inside.is_a?(Enumerable) ? inside : [inside] }

      def initialize(path, inside=nil, &block)
        self.path(path)
        self.inside = inside || []
        super &block
      end

      def draw
        context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)  # save before clipping
        if self.path.is_a?(Path)
          path = self.path.path
        else
          path = self.path
        end
        path.addClip

        @inside.each do |drawing|
          drawing.draw
        end

        super

        CGContextRestoreGState(context)  # restore after clipping
      end

    end

    module_function
    def line(*args)
      Line.new(*args)
    end

    def rect(*args)
      Rect.new(*args)
    end

    def circle(*args)
      Circle.new(*args)
    end

    def path(*args)
      Path.new(*args)
    end

    def linear_gradient(*args)
      LinearGradient.new(*args)
    end

    def radial_gradient(*args)
      RadialGradient.new(*args)
    end

    def custom(*args, &block)
      Custom.new(*args, &block)
    end

    def mask(*args, &block)
      Mask.new(*args, &block)
    end

  end

end
