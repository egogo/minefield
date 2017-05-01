class Result
  include Comparable
  attr_reader :mine
  attr_accessor :iterations, :explosions

  def initialize(mine, iterations: 0, explosions: 0)
     @mine, @iterations, @explosions = mine, iterations, explosions
  end

  def <=>(other)
    if explosions == other.explosions
      -iterations <=> -other.iterations
    else
      explosions <=> other.explosions
    end
  end

  def to_s
    mine.to_s + " Explosions: #{explosions}, Time: #{iterations}"
  end
end
