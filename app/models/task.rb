class Task < ActiveRecord::Base
	belongs_to :list
	has_many :logs, as: :log, autosave: true
	validates :name, presence:  { message: "Story name required." }
	validates :description, presence:  { message: "Story name required." }
	accepts_nested_attributes_for :logs
	#before_save :save_move_task
	private 
		def save_move_task
			begin
				if task.task_id.eql?(user.task_id_was)
					 raise 'Task from equal task to' 
				end
			rescue Exception => e
					 errors.add(:task_id, e.message)
			end
		end
end