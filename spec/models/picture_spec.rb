# require 'rails_helper'

# RSpec.describe Picture, type: :model do
#   describe 'image登録' do
#     it '写真欄が空白だと投稿出来ない' do
#       @user = User.create(name:'test1234',email:'test1234@gmail.com',password: 'password',password_confirmation: 'password')
#       picture = Picture.create(image_title:"test_image_title",image_content:'test_image_content',image:'',user_id:@user.id)
#       expect(picture).not_to be_valid
#     end

#     describe 'image登録' do
#       it '写真欄が空白だと投稿出来ない' do
#         @user = User.create(name:'test1234',email:'test1234@gmail.com',password: 'password',password_confirmation: 'password')
#         picture = Picture.create(image_title:"test_image_title",image_content:'test_image_content',image:'',user_id:@user.id)
#         expect(picture).not_to be_valid
#       end
#   end
# end

require "rails_helper"

RSpec.describe Picture, type: :model do
  context 'picture登録のテスト' do
    it 'pictureを作成する' do
      user_c = FactoryBot.create(:three_user)
      picture = FactoryBot.create(:picture, user: user_c)
      expect(picture).to be_valid
    end
    it 'image_titleが空ならバリデーションが通らない' do
      user_c = FactoryBot.create(:three_user)
      picture = FactoryBot.build(:picture, image_title: '', user: user_c)
      expect(picture).not_to be_valid
    end
    it 'image_contentが空ならバリデーションが通らない' do
      user_c = FactoryBot.create(:three_user)

      picture = FactoryBot.build(:picture, image_content: '', user: user_c)
      expect(picture).not_to be_valid
    end
    it 'imageが空ならバリデーションが通らない' do
      user_c = FactoryBot.create(:three_user)
      picture = FactoryBot.build(:picture, image: '', user: user_c)
      expect(picture).not_to be_valid
    end
  end
end