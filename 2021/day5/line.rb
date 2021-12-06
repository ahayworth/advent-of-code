class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def to_s
    "#<Point: @x=#{x}, @y=#{y}>"
  end
end

class Line
  attr_reader :start_point, :end_point

  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point
  end

  def each_point(&block)
    return enum_for(:each_point) unless block_given?
    current_point = start_point

    loop do
      yield current_point
      break if current_point == end_point

      # It would be nice to Range over points instead
      # of doing a manual loop with new value calculations
      # here, but the necessary implementation of a custom
      # Range-able object makes that basically impossible...
      # A Point would need to know it's part of a Line up-front
      # in order to correctly calculate values for #succ...
      new_x, new_y = [:x, :y].map do |method|
        v = current_point.send(method)
        delta = v - end_point.send(method)

        if delta < 0
          v + 1
        elsif delta > 0
          v - 1
        else
          v
        end
      end

      current_point = Point.new(new_x, new_y)
    end
  end
end

