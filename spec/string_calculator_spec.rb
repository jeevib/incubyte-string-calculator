require_relative "../string_calculator"

RSpec.describe StringCalculator do
	describe '.add' do
		it 'returns 0 if input is an empty string' do
			result = StringCalculator.add("")
			expect(result).to eq(0)
		end

		it "returns the same input if input is a single number" do
			result = StringCalculator.add("5")
			expect(result).to eq(5)
		end

		it 'returns sum of two numbers if separated by a comma' do
			result = StringCalculator.add('2, 3')
			expect(result).to eq(5)
		end

		it 'returns sum of numbers with support for new line delimiters' do
			result = StringCalculator.add("1\n2,3")
			expect(result).to eq(6)
		end
	end
end