class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :validate_permission, only: [:edit, :update]
  before_action :validate_public, only: [:show]
  before_action :validate_owner, only: [:destroy]
  # GET /materials
  # GET /materials.json
  def index
    @materials = current_user.user_materials.where(role: "owner").order('updated_at DESC')
    @collaborations = current_user.user_materials.where(role: "collaborator").order('updated_at DESC')
    # @materials= Material.order('created_at DESC')
    @material= Material.new
  end

  def all
    if params[:find].present?
      @materials = Material.where("lower(title) like ? OR lower(description) like ? AND public_level = 1", "%#{params[:find].downcase}%", "%#{params[:find].downcase}%").order('updated_at DESC').page(params[:page])
    else
      @materials = Material.where(public_level: 1).order('updated_at DESC').page(params[:page])
    end
  end



  # GET /materials/1
  # GET /materials/1.json
  def show

  end

  # GET /materials/new
  def new
    @material = Material.new
    @question = @material.questions.build()
  end

  # GET /materials/1/edit
  def edit
    unless @material.questions.any?
     @question = @material.questions.build()
     @question.alternatives.build
   end
  end

  

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)
    @material.user_materials.build(role: 3, user_id: current_user.id)
    respond_to do |format|
      if @material.save
        format.html { redirect_to root_path(@material), notice: 'Material was successfully created.' }
        format.json { render :show, status: :created, location: @material }
        format.js
      else
        format.html { redirect_to root_path, notice: 'vali hongo' }
        format.json { render json: @material.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      @material.updated_by = current_user.id
      if @material.update_attributes(material_params)
        format.html { redirect_to @material, notice: 'Material was successfully updated.' }
        format.json { render :show, status: :ok, location: @material }
        format.js
      else
        # format.html { render :edit }
        # format.json { render json: @material.errors, status: :unprocessable_entity }
        # format.js
        render :edit
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: 'Material was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    def validate_permission
      unless @material.user_materials.find_by(user_id: current_user.id)
        redirect_to root_path, notice: 'No tiene permiso.'
      end
    end

    def validate_owner
      unless @material.user_materials.find_by(user_id: current_user.id, role: "owner")
        redirect_to root_path, notice: 'No tiene permiso.'
      end
    end

    def validate_public
      if @material.public_level == 0 
        unless @material.user_materials.find_by(user_id: current_user.id)
          redirect_to root_path, notice: 'No tiene permiso.'
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:title, :description, :created_at, :updated_at, :updated_by, :public_level, :level_id, :subject_id, questions_attributes: [:id, :content, :_destroy, alternatives_attributes: [:id, :content, :_destroy] ])
    end
end
