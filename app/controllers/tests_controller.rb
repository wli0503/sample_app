class TestsController < ApplicationController
  attr_acccessor :name, :subject
  
  def initialize(attributes = {})
    @name = attributes[:name]
    @subject = attributes[:subject]
  end
  
  def new
  end
end
