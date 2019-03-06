class Employee < ApplicationRecord
	belongs_to :technology
	LIST=Employee.all.collect {|e| [ e.name, e.id ]}
	def tech(em)
		@data = Employee.find_by("name=?", em)
		Technology.find_by("id=?", @data.technology).name
	end	
	
	def self.providePM
		Employee.where("role=?", "Project Manager").collect {|e| [e.name,e.id]}
	end
	validates :name,:email,:role,:experience,:technology_id, presence: true
	validates :status, inclusion: { in: [ true, false ] }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Enter Valid Email" }
	validates :experience, numericality: true
 	
end
