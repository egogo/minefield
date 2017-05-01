require 'test_helper'
require 'mine'

describe Mine do
  let(:described_class) { Mine }

  describe 'initialization' do
    it 'sets all properties' do
      x = -1
      y = 2
      blast_radius = 3
      inst = described_class.new(x, y, blast_radius)
      inst.x.must_equal x
      inst.y.must_equal y
      inst.blast_radius.must_equal blast_radius
    end

    it 'validates input' do
      x = 'z'
      y = 2
      blast_radius = 0.9
      err = -> { described_class.new(x, y, blast_radius) }.must_raise ArgumentError
      err.message.must_equal 'All arguments have to be integers or floats: Mine: z,2 (0.9)'
    end
  end

  describe '#distance_to' do
    let(:one) { described_class.new(0, 0, 1) }
    let(:other) { described_class.new(1, 0, 3) }
    let(:another) { described_class.new(1, 4, 2) }

    it 'returns euclidean distance' do
      one.distance_to(one).must_equal 0.0

      one.distance_to(other).must_equal 1.0
      other.distance_to(one).must_equal 1.0

      other.distance_to(another).must_equal 4.0
      another.distance_to(other).must_equal 4.0
    end
  end

  describe '#will_trigger?' do
    let(:one) { described_class.new(0,0,1) }
    let(:other) { described_class.new(1,0,2) }
    let(:another) { described_class.new(1,3,5) }

    it 'returns true when another one is within range' do
      one.will_trigger?(other).must_equal true
      other.will_trigger?(one).must_equal true
      another.will_trigger?(one).must_equal true
      another.will_trigger?(other).must_equal true
    end

    it 'returns false when another one is out of range' do
      one.will_trigger?(another).must_equal false
      other.will_trigger?(another).must_equal false
    end
  end

  describe '#to_s' do
    let(:instance) { Mine.new(-2, 4, 3) }

    it 'returns string representation of a mine' do
      instance.to_s.must_equal 'Mine: -2,4 (3)'
    end
  end
end