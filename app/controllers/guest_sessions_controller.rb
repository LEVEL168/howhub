class GuestSessionsController < ApplicationController
    def create
        user = User.find_or_create_by(mail: "guest@example.com") do |user|
          user.name = "ゲストユーザー"
          user.password = SecureRandom.urlsafe_base64
        end
        session[:user_id] = user.id
        flash[:notice] = "ゲストユーザーとしてログインしました"
        redirect_to root_path
    end
end
