require_relative "../string_calculator"

RSpec.describe StringCalculator do
	describe '.add' do
		it 'returns 0 if input is an empty string' do
			result = StringCalculator.add("")
			expect(result).to eq(0)
		end

		it "retuns the same input if input is a single number" do
			result = StringCalculator.add("5")
			expect(result).to eq(5)
		end
	end
end