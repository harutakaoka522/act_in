require 'rails_helper.rb'

RSpec.feature "写真機能", type: :feature do

  before do
    visit root_path
    click_on "サインイン"
    fill_in 'user[name]', with: 'test1234' 
    fill_in 'user[email]', with: 'test1234@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "アカウント登録"
  end

  scenario "写真の新規登録できること" do
    
    visit pictures_path
  
    click_on "写真を投稿する"

    fill_in 'タイトル', with: 'test_title' 
    fill_in '内容', with: 'test_content' 
    attach_file "picture[image]", "#{Rails.root}/spec/features/test.jpg"
  
    click_on "登録"
    expect(page).to have_content '写真を投稿しました！'
  end

  scenario "写真の確認および編集できること" do
    
    visit pictures_path
  
    click_on "写真を投稿する"
  
    fill_in 'タイトル', with: 'test_title' 
    fill_in '内容', with: 'test_content' 
    attach_file "picture[image]", "#{Rails.root}/spec/features/test.jpg"
    
    click_on "登録"
    click_on "編集"  
    fill_in 'タイトル', with: 'test_title2'
    click_on "編集する"
    
    expect(page).to have_content '写真の編集をしました！'
    expect(page).to have_content 'test_title2'
    save_and_open_page
  end

  scenario "写真が削除できること" do

    visit pictures_path
    click_on "写真を投稿する"
  
    fill_in 'タイトル', with: 'test_title' 
    fill_in '内容', with: 'test_content' 
    attach_file "picture[image]", "#{Rails.root}/spec/features/test.jpg"
    
    click_on "登録"
    click_on "一覧に戻る"
    click_on "削除"
 
    expect(page).not_to have_content 'test_title'
    expect(page).to have_content '写真を削除しました'
   
  end
end

#save_and_open_page