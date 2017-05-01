require 'test_helper'
require 'explosion_simulator'

describe ExplosionSimulator do
  let(:described_class) { ExplosionSimulator }
  let(:mine_a) { Mine.new(0,0, 2) }
  let(:mine_b) { Mine.new(1,1, 1) }
  let(:mine_c) { Mine.new(2,1, 1) }
  let(:mine_d) { Mine.new(3,3, 5) }

  let(:mines) { [mine_a, mine_b, mine_c, mine_d] }

  let(:instance) { described_class.new(mines) }

  describe '#simulate' do
    it 'returns correct result for each call' do
      wide_range_result = instance.simulate(mine_d)
      wide_range_result.explosions.must_equal 3
      wide_range_result.iterations.must_equal 1

      mid_range_result = instance.simulate(mine_a)
      mid_range_result.explosions.must_equal 2
      mid_range_result.iterations.must_equal 2

      narrow_range_result = instance.simulate(mine_c)
      narrow_range_result.explosions.must_equal 1
      narrow_range_result.iterations.must_equal 1
    end
  end
end



