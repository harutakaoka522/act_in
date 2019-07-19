FactoryBot.define do
  factory :picture do
    image_title { 'Otis Redding' }
    image { File.open("#{Rails.root}/spec/factories/test.jpg") }
    image_content {'image_content'}
  end
end
