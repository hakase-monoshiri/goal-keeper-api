# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Goal.create( name: "Test Goals", description: "Work on codebase until you can see this model where you want it")
Goal.create( name: "Deal With Multiple Goals", description: "The goal here is to get a second goal model working")

Task.create(description: "First check that tasks can be added", completed: false, goal_id: 1)
Task.create(description: "Check to see if tasks also display notes", notes:"so you'll have to make a note like this to check",  completed: false, goal_id: 1)
Task.create(description: "Make a task to check associations are working", completed: false, goal_id: 1)