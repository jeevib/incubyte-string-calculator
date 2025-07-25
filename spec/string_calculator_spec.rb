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
			result = StringCalculator.add('2,3')
			expect(result).to eq(5)
		end

		it 'returns sum of numbers with support for new line delimiters' do
			result = StringCalculator.add("1\n2,3")
			expect(result).to eq(6)
		end

		it 'returns sum when using custom delimiter' do
			result = StringCalculator.add("//;\n1;2")
			expect(result).to eq(3)
		end

		it 'raises an exception for negative numbers' do
  			expect {
    			StringCalculator.add("1,-2,3,-5")
  			}.to raise_error("negative numbers not allowed -2, -5")
		end

		it 'rejects number greater than 1000' do
			result = StringCalculator.add("2,1001,6")
			expect(result).to eq(8)
		end

		it 'supports delimiters of any length' do
			result = StringCalculator.add("//[***]\n1***2***3")
			expect(result).to eq(6)
		end

		it 'supports multiple delimiters' do
			result = StringCalculator.add("//[*][%]\n1*2%3")
			expect(result).to eq(6)
		end
	end
end