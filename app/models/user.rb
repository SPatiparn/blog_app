class User < ApplicationRecord
  has_secure_password  # ทำให้สามารถใช้ฟังก์ชันเช่น `authenticate` ในการตรวจสอบรหัสผ่าน
  validates :username, presence: true, uniqueness: true  # ตรวจสอบให้ username มีค่าและไม่ซ้ำ
  has_many :posts  # ความสัมพันธ์กับโพสต์ที่ผู้ใช้สร้าง
  has_many :comments  # ความสัมพันธ์กับคอมเมนต์ที่ผู้ใช้เขียน
  has_many :likes  # ความสัมพันธ์กับไลค์ที่ผู้ใช้กด
end
