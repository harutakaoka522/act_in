require 'rails_helper'

RSpec.describe Label, type: :model do
  describe 'label登録' do
    it 'label欄が空白だと投稿出来ない' do
      @user = User.create(name:'test',email:'test@gmail.com',password: 'password',password_confirmation: 'password')
      label =  Label.create(label_title:"",user_id:@user.id)
      expect(label).not_to be_valid
    end
  end
end