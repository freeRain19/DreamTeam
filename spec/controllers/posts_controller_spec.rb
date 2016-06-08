require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe 'posts test ' do
    before do
      user_login
    end

    def user_login
      unless @user=User.find_by_email('testmail@mail.mm')
        @user=User.create!(email: "testmail@mail.mm", password: 'qweqwe', first_name: 'Aaa', last_name: 'Bb2bb', role_id: 2)
      end
      sign_in @user
    end

    it "renders show template if an tasks is found" do
      user_login
      get :index
      expect(response).to render_template("index")
    end

    it 'create a new post' do
      user_login
      post :create,task_id:1, post: {content: 'asdasqwedwa', task_id: 2}
      expect(assigns(:post)).to be_a_new(Post)
    end

    it 'redirect after a new post' do
      unless @user2=User.find_by_email('testmail1@mail.mm')
        @user2=User.create!(email: "testmail1@mail.mm", password: 'qweqwe', first_name: 'Aaqa', last_name: 'Bbq2bb', role_id: 1)
      end
      sign_in @user2
      post :create,task_id:1, post: {content: 'aasd11qweas2da'}
      expect(response).to redirect_to('/tasks/1')
    end
  end
end
