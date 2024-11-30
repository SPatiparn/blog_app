class SessionsController < ApplicationController
  # action สำหรับแสดงหน้า login
  def new
    # ไม่จำเป็นต้องใส่อะไรในที่นี้
  end

  # action สำหรับเข้าสู่ระบบ
  def create
    user = User.find_by(username: params[:username])  # ใช้ username แทน email

    if user && user.authenticate(params[:password]) # ตรวจสอบ username และ password
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully."
      redirect_to new_post_path  # เปลี่ยนเส้นทางไปหน้า create post
    else
      flash[:alert] = "Invalid username or password"
      render :new
    end
  end

  # action สำหรับ logout
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully."
    redirect_to root_path
  end  
end
