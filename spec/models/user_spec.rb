require 'spec_helper'


describe User do
=begin
  it 'Count user tasks' do
    role_admin=Role.create(name: 'admin')
    role_user=Role.create(name: 'user')
    user1 = FactoryGirl.create(:user)
    user2=FactoryGirl.create(:user)
    users=Array.new
    users<<user1
    users<<user2
    users.count.should==2

  end

  it 'create & fill tables' do
    role_admin=Role.create(name: 'admin')
    role_user=Role.create(name: 'user')
    4.times {
      #-------create team with 3 users
      team = FactoryGirl.create(:team_with_users, users_count: 3)
      team.save
      #-------create project  with 2 tasks
      project = FactoryGirl.create(:project_with_tasks, tasks_count: 2)

      #----------Assign a random team the project
      max_team=Team.all.size
      random_team=Team.find(rand(max_team)+1)
      random_team.projects<<project

      #-----Field "task" is filled in 2 from 3 users
      project.tasks.each_index do |index|
        random_team.users[index].tasks<<project.tasks[index]
        post = FactoryGirl.create(:post, :task => project.tasks[index])
      end

      #-------- add posts & generate comments from random user
      Post.all.each do |post|
        comment = FactoryGirl.create(:comment)
        max_users = User.all.size
        comment.user=User.all[rand(max_users)]
        post.comments<<comment
      end
    }
  end
=end

end