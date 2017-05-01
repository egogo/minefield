require_relative './result'

class ExplosionSimulator
  attr_reader :mines

  def initialize(mines)
    @mines = mines
  end

  def simulate(detonator)
    armed = mines - [detonator]
    stats([detonator], armed,Result.new(detonator))
  end

  private

  def stats(detonators, armed, result)
    new_detonators, new_armed = armed.partition do |a|
      detonators.any? {|d| d.will_trigger?(a) ? (result.explosions += 1) : false }
    end

    if new_detonators.any?
      result.iterations += 1
      return stats(new_detonators, new_armed, result)
    end

    result
  end
end
