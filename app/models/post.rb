class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :desc, presence: true
end
