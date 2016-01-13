# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
list = List.create(name:"Test1")
(0..100).each do |x|
	list.tasks.create( name:" task  #{x}", description: "desc #{x}", hidden: "#{(x % 2) ? 0 : 1}")
end
list.save