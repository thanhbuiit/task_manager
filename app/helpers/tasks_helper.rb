module TasksHelper
	def show_list_name_in_task(task)
		task.list.nil? ? raw("<span class='label label-danger'>List not found</span>") : raw("<span class='label label-primary'>##{task.list_id} - #{task.list.name}</span>")
	end
end
