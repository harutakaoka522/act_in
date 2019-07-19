require 'rails_helper'

RSpec.describe Picture, type: :model do
  describe 'image登録' do
    it '写真欄が空白だと投稿出来ない' do
      @user = User.create(name:'test1234',email:'test1234@gmail.com',password: 'password',password_confirmation: 'password')
      picture = Picture.create(image_title:"test_image_title",image_content:'test_image_content',image:'',user_id:@user.id)
      expect(picture).not_to be_valid
    end
  end
end