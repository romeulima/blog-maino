class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    return redirect_to root_path, alert: t(".not_found") unless @user.present?

    @user
  end
end
