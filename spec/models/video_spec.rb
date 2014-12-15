require "rails_helper"

describe Video do
	#context for model validation
	context 'validate video model' do
		it "has many comments" do
			should have_many :comments
		end
		
		it "should validate a validate title" do
			video = Video.create(title:'debate');
			expect(video).to be_valid
		end
		
	end
	
	#context for class level methods example
	#context for instance methods example
end
