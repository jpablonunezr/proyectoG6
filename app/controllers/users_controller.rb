class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def index
  	if params[:search].present?
      @users = User.includes(:subject, :level).where("lower(first_name) like ? OR lower(last_name) like ? OR lower(email) like ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%").order(:last_name)
    else
      @users = User.all.includes(:subject, :level)
    end 
  end

  def show
  end

  def collaborate
    #@user_materials = UserMaterial.where(user_id: current_user.id)
    if params[:filter].present?
      @users = User.includes(:subject, :level).where("lower(first_name) like ? OR lower(last_name) like ? OR lower(email) like ?", "%#{params[:filter].downcase}%", "%#{params[:filter].downcase}%", "%#{params[:filter].downcase}%").order(:last_name)
    else
      @users = User.includes(:subject, :level).all
    end 
  end

  def add_collaborate
      UserMaterial.create(material_id: params[:title_id], user_id: params[:id], role: "collaborator")
      redirect_to collaborate_users_path, notice: 'Collaborator was successfully updated.'
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :subject_id, :level_id, :title_id, :id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end