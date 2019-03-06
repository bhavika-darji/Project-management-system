class Client < ApplicationRecord
	has_many :projects
	LIST=Client.all.collect {|c| [ c.name, c.id ]}

	validates :name, :country, presence: true
end
