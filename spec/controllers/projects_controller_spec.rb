require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe 'project tests ' do
    before do
      unless @user=User.find_by_email('testmail@mail.mm')
        @user=User.create!(email: "testmail@mail.mm", password: 'qweqwe', first_name: 'Aaa', last_name: 'Bb2bb', role_id: 2)
      end
      sign_in @user
    end

    it 'http:status for search project' do
      project = Project.create!(name: 'strange project name', summary: 'very very strange',start_date: '12/12/2017', end_date: '11/11/2018')
      get :index,search_name: 'stran'
      expect(response).to have_http_status(200)
    end
  end
end
