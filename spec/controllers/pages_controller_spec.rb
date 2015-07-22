require 'rails_helper'

RSpec.describe PagesController, type: :controller do
#test
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
    
    it "should return the right title" do
      get :home
      expect(response.body).to have_title(
        "Ruby on Rails Tutorial Sample App | Home")
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end
  
  #RED TEST
  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end
  
  

end
