class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :title, presence: {message: "제목입력해줘"},
                    length: {maximum: 30,
                              too_long: "제목은 %{count}자 이내로 입력하소"}
  validates :content, presence: {message: "내용입력해줘"}
end
