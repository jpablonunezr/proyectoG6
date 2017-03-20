class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def index
  	if params[:search].present?
      @users = User.where("lower(first_name) like ? OR lower(last_name) like ? OR lower(email) like ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").order(:last_name)
    else
      @users = User.all
    end 
  end

  def show
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :subject_id, :level_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end