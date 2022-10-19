FactoryBot.define do
  factory :user do
    first_name { 'first_name' }
    last_name { 'last_name' }
    email {'sample@example.com' }
    password { 'testpassword' }
    password_confirmation { 'testpassword' }
  end

  factory :user_duplicate_email, class: User do
    first_name { 'hoge' }
    last_name { 'fuga' }
    email {'sample@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
