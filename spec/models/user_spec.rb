# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'
 
 
RSpec.describe PagesController, type: :controller do
	
	describe "User" do
		before(:each) do
			@attr = {:name => "Example", :email => "user@example.com"}
		end
		
		it "should require a name" do
			no_name_user = User.new(@attr.merge(:name => ""))
			no_name_user.should_not be_valid
		end
	end
end