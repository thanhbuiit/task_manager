class List < ActiveRecord::Base
	has_many :tasks, -> {where hidden: true}, dependent: :destroy, autosave: true
	default_scope { where(hidden: true) }
	accepts_nested_attributes_for :tasks#, :allow_destroy => true
	validates :name,
		presence: true,
		length: {minimum: 5}

	def format_name_list
		"##{id} - #{name}"
	end
end
