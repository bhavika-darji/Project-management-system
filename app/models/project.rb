class DateValidator < ActiveModel::EachValidator
  def validate_each(project,start_date,value)
    unless value >= Date.today
    project.errors[start_date] << (options[:message] || "is invalid, please enter coming Date")
    end
  end
end

class Project < ApplicationRecord
  serialize :employee, Array
  belongs_to :client
  belongs_to :technology

  def projectPM(em)
		@data = Employee.find(em)
	end	
	def projectEMP(em)
		em.to_a
		@data = []
		0..len(em).each do |i|
			@data.push Employee.find(i).name
		end
		@data.name
	end	
	validates :name,:start_date,:end_date,:pm,:budget,:client_id,:technology_id,:employee, presence: true
	validates :budget, numericality: true
	validates :start_date, date: true
	validates :end_date, date: true
end
