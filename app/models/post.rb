class Post < ApplicationRecord
  belongs_to :user  # เชื่อมโยงโพสต์กับผู้ใช้
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
