require 'rails_helper.rb'

RSpec.feature "スケジュール管理機能", type: :feature do

  before do
    visit root_path
    click_on "サインイン"
    fill_in 'user[name]', with: 'test1234' 
    fill_in 'user[email]', with: 'test1234@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "アカウント登録"

    visit pictures_path
  
    click_on "写真を投稿する"
    fill_in 'タイトル', with: 'test_title' 
    fill_in '内容', with: 'test_content' 
    attach_file "picture[image]", "#{Rails.root}/spec/features/test.jpg"
    click_on "登録"
    click_on "マイページ"
    click_on "ログアウト"
    
  end

  scenario "お気に入りの新規登録と解除ができること" do
    click_on "サインイン"
    fill_in 'user[name]', with: 'test2' 
    fill_in 'user[email]', with: 'test2@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "アカウント登録"

    visit pictures_path
    
    click_on "確認"
    
    click_on "お気に入りする"
    expect(page).to have_content 'ブログをお気に入り登録しました'
    click_on "お気に入り解除する"
    
    expect(page).to have_content 'お気に入り解除しました'
    click_on "お気に入りする"
    click_on "マイページ"
    expect(page).to have_content 'test_title'
  end
end

#save_and_open_page