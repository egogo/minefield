class Mine
  attr_reader :x, :y, :blast_radius

  def initialize(x,y,blast_radius)
    @x, @y, @blast_radius = x, y, blast_radius
    raise ArgumentError.new("All arguments have to be integers or floats: #{to_s}") unless valid?
  end

  def distance_to(another)
    Math.sqrt((self.x - another.x)**2 + (self.y - another.y)**2)
  end

  def will_trigger?(another)
    distance_to(another) <= blast_radius
  end

  def to_s
    "Mine: #{x},#{y} (#{blast_radius})"
  end

  private

  def valid?
    [x,y,blast_radius].each do |arg|
      return false unless arg.is_a?(Numeric)
    end
    true
  end
end