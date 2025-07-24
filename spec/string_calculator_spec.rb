require_relative "../string_calculator"

RSpec.describe StringCalculator do
	describe '.add' do
		it 'returns 0 if input is an empty string' do
			result = StringCalculator.add("")
			expect(result).to eq(0)
		end
	end
end