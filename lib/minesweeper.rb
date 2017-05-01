require_relative './explosion_simulator'

class Minesweeper
  attr_reader :mines
  
  def initialize(mines)
    @mines = mines
  end

  def sorted_results
    simulator = ExplosionSimulator.new(mines)
    mines.map do |mine|
      simulator.simulate(mine)
    end.sort.reverse
  end
end