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
    @collaborations = User.includes(:user_materials).where(:user_materials => {role: "collaborator", material_id: params[:id]})
    #@user_materials = UserMaterial.where(user_id: current_user.id)
    if params[:filter].present?
      @users = User.includes(:subject, :level).where("lower(first_name) like ? OR lower(last_name) like ? OR lower(email) like ?", "%#{params[:filter].downcase}%", "%#{params[:filter].downcase}%", "%#{params[:filter].downcase}%").order(:last_name)
    else
      @users = User.includes(:subject, :level).all
    end 
  end

  def add_collaborate
    @user_material = UserMaterial.where(user_id: params[:user_id], material_id: params[:id], role: "collaborator")
    if @user_material.empty?
      UserMaterial.create(material_id: params[:id], user_id: params[:user_id], role: "collaborator")
      redirect_to collaborate_users_path, notice: 'Collaborator was successfully updated.'
    else
      redirect_to collaborate_users_path, notice: 'User is already collaborator.'
    end
  end

  def del_collaborate
    @user_material = UserMaterial.where(user_id: params[:user_id], material_id: params[:id], role: "collaborator")
    unless @user_material.empty?
      UserMaterial.find_by(material_id: params[:id], user_id: params[:user_id], role: "collaborator").destroy
      redirect_to collaborate_users_path, notice: 'Collaboration was successfully destroyed.'
    else
      redirect_to collaborate_users_path, notice: 'User is not a collaborator.'
    end
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