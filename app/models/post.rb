class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true, length: { in: 4..25 }
  validates :body, presence: true, length: { minimum: 10 }
end
