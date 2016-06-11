# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'factory_girl_rails'

role_admin=Role.create(name: 'admin')
role_user=Role.create(name: 'user')
create_admin=FactoryGirl.create(:user,email: 'admin@admin.com',password: 'qweqwe',role_id: 1,first_name: 'denis',last_name: 'Tq')


200.times {

  #-------create team with  users
  team = FactoryGirl.create(:team_with_users, users_count: 3)


  #-------create project  with  tasks
  project = FactoryGirl.create(:project_with_tasks, tasks_count: rand(2)+2)


  #----------Assign a random team the project
  max_team=Team.all.size
  random_team=Team.find(rand(max_team)+1)
  random_team.projects<<project

  #-----Field "task" is filled 

  project.tasks.each_index do |index|
    random_team.users[index].tasks<<project.tasks[index]
    @post = FactoryGirl.create(:post, :task=> project.tasks[index])
  end


  #-------- add posts & generate comments from random user
  3.times{
    comment = FactoryGirl.create(:comment)
    max_users = User.all.size
    comment.user=User.all[rand(max_users)]
    @post.comments<<comment
  }
}