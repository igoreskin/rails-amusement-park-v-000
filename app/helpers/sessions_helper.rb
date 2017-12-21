module SessionsHelper

  def admin?
    @user = User.find(params[:id])
    if @user.admin
      return "ADMIN"
    end
  end

end
