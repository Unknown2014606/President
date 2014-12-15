require "rails_helper"

describe President do
	#context for model validation
	context 'validate president model' do
		it "should validate a validate name" do
			pre = President.create(name:'Mike');
			expect(pre).to be_valid
		end
		
	end
	
	#context for class level methods example
	#context for instance methods example
end
