require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET tasks action ' do
    def user_login
      @user=User.find_by_email('testmail@mail.mm')
      if @user.nil?
        @user=User.create!(email: "testmail@mail.mm", password: 'qweqwe', first_name: 'Aaa', last_name: 'Bb2bb', role_id: 2)
      end
      sign_in @user
    end

    it 'get show ' do
      user_login
      get :show, id: '1'
      expect(response).to render_template("show")
      expect(response).to have_http_status(200)
    end

    it 'get index' do
      user_login
      get :index
      expect(response).to render_template("index")
      expect(response).to have_http_status(200)
    end
   end
end
