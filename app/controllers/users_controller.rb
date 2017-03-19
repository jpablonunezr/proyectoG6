class UsersController < ApplicationController
  def index
  	if params[:search].present?
      @users = User.where("lower(first_name) like ? OR lower(last_name) like ? OR lower(email) like ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
    end
    if @users.empty?
      @subject = Subject.find_by("lower(name) like ? ", "%#{params[:search].downcase}%")
      unless @subject.nil?
        @user_subject = UserSubject.find_by(subject_id: @subject.id)
        @users = User.where(id: @user_subject.user_id)
      end
    end
    if @users.empty?
      @users = User.all
    end 
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:user).permit(:email, :first_name, :last_name, :subject_id, :level_id)
  end
end