# frozen_string_literal: true

RSpec.describe Calculator::Comission do
  describe 'VERSION' do
    it 'has a version number' do
      expect(Calculator::VERSION).not_to be nil
    end
  end

  describe '#call' do
    context 'when comission_amount not present' do
      subject { described_class.call(amount: 100, comission_percent: 20) }

      it 'calculates comission with fixed comission_amount' do
        expect(subject).to match_array([21.0, 79.0])
      end
    end

    context 'when comission_amount present' do
      subject { described_class.call(amount: 100, comission_percent: 20, comission_amount: 2.0) }

      it 'calculates comission with comission_amount' do
        expect(subject).to match_array([22.0, 78.0])
      end
    end

    context 'when comission_percent not present' do
      subject { described_class.call(amount: 100, comission_amount: 3.0) }

      it 'calculates comission with comission_amount' do
        expect(subject).to match_array([23.0, 77.0])
      end
    end

    context 'when comission_entity present' do
      let(:product) { double(:product, comission_amount: 0.4) }
      subject { described_class.call(amount: 100, comission_entity: product) }

      it 'calculates comission with comission_amount' do
        expect(subject).to match_array([20.4, 79.6])
      end
    end
  end
end
