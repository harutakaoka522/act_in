require 'rails_helper.rb'

RSpec.feature "スケジュール管理機能", type: :feature do

  before do
    visit root_path
    click_on "サインイン"
    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "アカウント登録"
  end

  scenario "ラベルの新規登録できること" do
    visit new_label_path
    fill_in 'ラベル名', with: 'test_label'
    click_on "登録する" 
    expect(page).to have_content 'test_label'
    expect(page).to have_content 'ラベルを作成しました'
  
  end


  scenario "ラベルの削除ができること" do
    visit new_label_path
    fill_in 'ラベル名', with: 'test_label'
    click_on "登録する" 
    click_on "削除"
    expect(page).not_to have_content 'test_label'
    expect(page).to have_content 'ラベルを削除しました'
  end

  scenario "ラベル登録し、写真投稿画面に出力されていること" do
    visit new_label_path
    fill_in 'ラベル名', with: 'test_label'
    click_on "登録する" 
    fill_in 'ラベル名', with: 'test_label2'
    click_on "登録する" 

    visit pictures_path
    
    click_on "写真を投稿する"
   
    expect(page).to have_content 'test_label'
    expect(page).to have_content 'test_label2'
    save_and_open_page
  end
end

#save_and_open_page