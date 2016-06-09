require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'not allow duplicate'do
    task=FactoryGirl.create(:task)
    post = Post.create(content: 'text', task_id: 1)
    expect(Post.create(content: 'text', task_id: 1)).to_not be_valid
  end

end
