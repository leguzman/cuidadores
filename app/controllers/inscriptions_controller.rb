class InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:show, :edit, :update, :destroy]

  # GET /inscriptions
  # GET /inscriptions.json
  def index
    @inscriptions = Inscription.all
    @courses = Course.all
    @users = User.all
  end

  # GET /inscriptions/1
  # GET /inscriptions/1.json
  def show
  end

  # GET /inscriptions/new
  def new
    @date = Time.now
    @inscription = current_user.inscriptions.build
    @courses = Course.all
    
  end

  # GET /inscriptions/1/edit
  def edit
  end

  # POST /inscriptions
  # POST /inscriptions.json
  def create
    @inscription = current_user.inscriptions.build(inscription_params)

    respond_to do |format|
      if @inscription.save
        format.html { redirect_to @inscription, notice: 'Inscripción Exitosa' }
        format.json { render :show, status: :created, location: @inscription }
      else
        format.html { render :new }
        format.json { render json: @inscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscriptions/1
  # PATCH/PUT /inscriptions/1.json
  def update
    respond_to do |format|
      if @inscription.update(inscription_params)
        format.html { redirect_to @inscription, notice: 'Inscripción Actualizada.' }
        format.json { render :show, status: :ok, location: @inscription }
      else
        format.html { render :edit }
        format.json { render json: @inscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inscriptions/1
  # DELETE /inscriptions/1.json
  def destroy
    @inscription.destroy
    respond_to do |format|
      format.html { redirect_to inscriptions_url, notice: 'Inscripción Anulada.' }
      format.json { head :no_content }
    end
  end
  
  def inscribiruno
      @inscription = current_user.inscriptions.build
      @inscription.update_attribute(:course_id , 1)
      @inscription.update_attribute(:user_id , current_user.id)
      @inscription.update_attribute(:state , "En revisión")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscription
      @inscription = Inscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inscription_params
      params.require(:inscription).permit(:date, :course_id,  :user_id)
    end
end
