# spec/models/string_calculator_spec.rb
require 'rails_helper'

RSpec.describe StringCalculator, type: :service do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'with empty string' do
      it 'returns 0' do
        expect(calculator.add("")).to eq(0)
      end
    end

    context 'with single number' do
      it 'returns the number' do
        expect(calculator.add("1")).to eq(1)
      end
    end

    context 'with two numbers separated by comma' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("1,5")).to eq(6)
      end
    end

    context 'with numbers separated by newlines and commas' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'with custom delimiter' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'with negative numbers' do
      it 'raises an error with negative numbers listed' do
        expect { calculator.add("1,-2,3") }.to raise_error("Negative numbers not allowed: -2")
      end

      it 'raises an error with all negative numbers listed' do
        expect { calculator.add("//;\n1;-2;-3") }.to raise_error("Negative numbers not allowed: -2, -3")
      end
    end
  end
end
