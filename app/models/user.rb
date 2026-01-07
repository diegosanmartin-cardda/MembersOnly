class User < ApplicationRecord
    has_secure_password

    has_many :posts, dependent: :destroy

    enum member: {normal:0, premium:1}, _default: :normal

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
end
