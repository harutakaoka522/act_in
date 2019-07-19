require "rails_helper"

RSpec.describe Comment, type: :model do
  context 'comment登録のテスト' do
    it 'commentを作成する' do
      user_c = FactoryBot.create(:three_user)
      picture = FactoryBot.create(:picture, user: user_c)
      comment = Comment.create(content:"test", picture: picture, user:user_c)
      expect(comment).to be_valid
    end

    it 'contentが空ならバリデーションが通らない' do
      user_c = FactoryBot.create(:three_user)
      picture = FactoryBot.create(:picture, user: user_c)
      comment = Comment.create(content:"", picture: picture, user:user_c)
      expect(comment).not_to be_valid
    end


  end
end