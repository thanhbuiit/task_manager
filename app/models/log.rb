class Log < ActiveRecord::Base
	belongs_to :log, polymorphic: true
end
