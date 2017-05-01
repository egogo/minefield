require 'test_helper'
require 'mine'

describe Minesweeper do
  let(:described_class) { Minesweeper }
  let(:mine_a) { Mine.new(1,2,3) }
  let(:mine_b) { Mine.new(2,2,1) }
  let(:mine_c) { Mine.new(1,3,5) }
  let(:mines) { [mine_a, mine_b, mine_c] }



  describe 'initialization' do
    it 'sets all properties' do
      inst = described_class.new(mines)
      inst.mines.must_equal mines
    end
  end

  describe '#sorted_results' do
    let(:instance) { described_class.new(mines) }
    let(:result_a) { Result.new(mine_a, iterations: 1, explosions: 3) }
    let(:result_b) { Result.new(mine_b, iterations: 2, explosions: 3) }
    let(:result_c) { Result.new(mine_c, iterations: 5, explosions: 10) }

    before do
      simulator = mock
      ExplosionSimulator.expects(:new).with(mines).returns(simulator)
      simulator.expects(:simulate).with(mine_a).returns(result_a)
      simulator.expects(:simulate).with(mine_b).returns(result_b)
      simulator.expects(:simulate).with(mine_c).returns(result_c)
    end

    it 'returns simulation results for each mine in reverse order' do
      instance.sorted_results.must_equal [result_c, result_a, result_b]
    end
  end
end