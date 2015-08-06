class Test < ActiveRecord::Base
	attr_accessible :name, :subject
	
	validate :name, :length => {:within => 1..20},
					:presence => true
	
	validate :subject, :length => {:within => 1..20},
				 	   :presence => true
					 
	before_save :mark_gen
	
	private
	
	def mark_gen
		self.mark = "#{name} #{subject}"
	end
	
end
