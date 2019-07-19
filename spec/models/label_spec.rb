require 'rails_helper'

RSpec.describe Label, type: :model do
  describe 'label登録' do
    it 'labelを作成' do
      @user = User.create(name:'test1234',email:'test1234@gmail.com',password: 'password',password_confirmation: 'password')
      label =  Label.create(label_title:"123",user_id:@user.id)
      expect(label).to be_valid
    end

    it 'labelが空ならバリデーションが通らない' do
      @user = User.create(name:'test1234',email:'test1234@gmail.com',password: 'password',password_confirmation: 'password')
      label =  Label.create(label_title:"",user_id:@user.id)
      expect(label).not_to be_valid
    end
  end
end