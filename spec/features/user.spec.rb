require 'rails_helper.rb'

RSpec.feature "ユーザー管理機能", type: :feature do

  before do
    visit root_path
  end

  scenario "新規登録できること" do
    
    click_on "サインイン"
    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password'
    click_on "アカウント登録"
    expect(page).to have_content 'あなたの写真を投稿しよう！' 
  end

  scenario "ログアウト出来ること" do
    click_on "サインイン"
    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "アカウント登録"
    click_on "ログアウト"
    expect(page).to have_content 'ログアウトしました'
  end

  scenario "ユーザー情報が編集できること" do
    click_on "サインイン"
    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: 'password' 
    fill_in 'user[password_confirmation]', with: 'password' 
    click_on "アカウント登録"
    
    click_on "編集"
    
    fill_in 'user[name]', with: 'test' 
    fill_in 'user[email]', with: 'test@gmail.com' 
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    
    
    click_on "更新する"
    save_and_open_page
    expect(page).to have_content '更新しました' 
  end
end