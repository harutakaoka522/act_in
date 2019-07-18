require 'rails_helper'

RSpec.describe Picture, type: :model do
  describe 'title登録' do
    it 'nameが空だとバリデーションが通らない' do
      user = User.create(name:'',email:'test@gmail.com',password: 'password',password_confirmation: 'password')
      expect(user).not_to be_valid
    end

    it 'namewが空でなければバリデーションが通る' do
      user = User.create(name:'test',email:'test@gmail.com',password: 'password',password_confirmation: 'password')
      expect(user).to be_valid
    end
  end
end