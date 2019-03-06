class Technology < ApplicationRecord
	has_many :employees
	has_many :projects
	LIST=Technology.all.collect {|c| [ c.name, c.id ]}
	validates :name, presence: true
end