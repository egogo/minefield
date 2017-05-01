require 'test_helper'
require 'mine'

describe Result do
  let(:described_class) { Result }
  let(:mine) { Mine.new(1,2,3) }

  describe 'initialization' do
    it 'sets all properties' do
      inst = described_class.new(mine)
      inst.mine.must_equal mine
      inst.iterations.must_equal 0
      inst.explosions.must_equal 0
    end
  end

  describe '#to_s' do
    let(:instance) { Result.new(mine) }

    it 'appends current state to mine information' do
      mine.stub(:to_s, "MineInfo") do
        instance.to_s.must_equal "MineInfo Explosions: 0, Time: 0"
        instance.explosions = 4
        instance.iterations = 2
        instance.to_s.must_equal "MineInfo Explosions: 4, Time: 2"
      end
    end
  end

  describe 'comparison' do
    let(:result_a) { Result.new(mine) }
    let(:result_b) { Result.new(mine) }

    describe 'when number of explosions is equal' do

      describe 'and iterations is equal' do
        it 'returns 0' do
          (result_a <=> result_b).must_equal 0
        end
      end

      describe 'and iterations is not equal' do
        let(:result_b) { Result.new(mine, iterations: 2) }

        it 'returns -1 for the one with greater iterations' do
          (result_a <=> result_b).must_equal 1
        end

        it 'returns 1 for the one with lesser iterations' do
          (result_b <=> result_a).must_equal(-1)
        end
      end
    end

    describe 'when number of explosions is not equal' do
      let(:result_a) { Result.new(mine, iterations: 3, explosions: 5) }
      let(:result_b) { Result.new(mine, iterations: 1, explosions: 4) }

      it 'returns 1 for the one with greater explosions' do
        (result_a <=> result_b).must_equal 1
      end

      it 'returns -1 for the one with lesser explosions' do
        (result_b <=> result_a).must_equal(-1)
      end
    end
  end
end