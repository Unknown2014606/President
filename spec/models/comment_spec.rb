require "rails_helper"

describe Comment do
	#context for model validation
	context 'validate comment model' do
		it "belongs to a video" do
			should belong_to :video
		end
	end
	#context for class level methods example
	#context for instance methods example
end
