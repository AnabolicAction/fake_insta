### post

- posts 컨트롤러 `rails g controller posts index new create show edit update destroy`
- post 모델 `rails g model post title:string content:text`

### Comment

- comments 컨트롤러
  - CRUD-C
- comment 모델
  - `rails g model comment content:string`
  - `post_id:integer` 저장..

### Devise

1. ##### `devise`gem 설치

   ```ruby
   #Gemfile
   gem 'devise'
   ```

   ```erb
   $bundle install
   ```

2. ##### devise 설치

   ```erb
   $rails generate devise:install
   ```

   `config/initialize/devise.rb` 만들어짐.

   

3. ##### user 모델만들기

   ```erb
   $rails generate devise user
   ```

   

- db/migrate/20180625_devise_create_user.rb
- model/user.rb
- config/routes.rb :devise_for:users

1. ##### migration

   | new_user_session_path         | GET    | /users/sign_in(.:format)       | devise/sessions#new          |
   | ----------------------------- | ------ | ------------------------------ | ---------------------------- |
   | user_session_path             | POST   | /users/sign_in(.:format)       | devise/sessions#create       |
   | destroy_user_session_path     | DELETE | /users/sign_out(.:format)      | devise/sessions#destroy      |
   | user_password_path            | POST   | /users/password(.:format)      | devise/passwords#create      |
   | new_user_password_path        | GET    | /users/password/new(.:format)  | devise/passwords#new         |
   | edit_user_password_path       | GET    | /users/password/edit(.:format) | devise/passwords#edit        |
   |                               | PATCH  | /users/password(.:format)      | devise/passwords#update      |
   |                               | PUT    | /users/password(.:format)      | devise/passwords#update      |
   | cancel_user_registration_path | GET    | /users/cancel(.:format)        | devise/registrations#cancel  |
   | user_registration_path        | POST   | /users(.:format)               | devise/registrations#create  |
   | new_user_registration_path    | GET    | /users/sign_up(.:format)       | devise/registrations#new     |
   | edit_user_registration_path   | GET    | /users/edit(.:format)          | devise/registrations#edit    |
   |                               | PATCH  | /users(.:format)               | devise/registrations#update  |
   |                               | PUT    | /users(.:format)               | devise/registrations#update  |
   |                               | DELETE | /users(.:format)               | devise/registrations#destroy |

   ```erb
   $rake db:migrate
   ```

   

- 회원가입 : `get users/sign_up`
- 로그인 : `get users/sign_in`
- 로그아웃 : `get users/sign_out`

1. ##### helper method

- `user_sign_in?` :유저가 로그인 했는지 안했는 지를 true/false 리턴
- `current_user` : 로그인 되어있는 user오브젝트를 가지고 있음
- `before_action :authenticate_user!` : 로그인되어있는 유저검증(필터)

1. ##### View 파일 수정하기

   ```erb
   $rails generate devise:views users
   ```

   