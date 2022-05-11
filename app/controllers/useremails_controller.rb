class UseremailsController < ApplicationController
  before_action :set_useremail, only: %i[ show edit update destroy ]

  # GET /useremails or /useremails.json
  def index
    @useremails = Useremail.all
  end

  # GET /useremails/1 or /useremails/1.json
  def show
  end

  # GET /useremails/new
  def new
    @useremail = Useremail.new
  end

  # GET /useremails/1/edit
  def edit
  end

  # POST /useremails or /useremails.json
  def create
    @useremail = Useremail.new(useremail_params)

    respond_to do |format|
      if @useremail.save
        format.html { redirect_to useremail_url(@useremail), notice: "Useremail was successfully created." }
        format.json { render :show, status: :created, location: @useremail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @useremail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /useremails/1 or /useremails/1.json
  def update
    respond_to do |format|
      if @useremail.update(useremail_params)
        format.html { redirect_to useremail_url(@useremail), notice: "Useremail was successfully updated." }
        format.json { render :show, status: :ok, location: @useremail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @useremail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /useremails/1 or /useremails/1.json
  def destroy
    @useremail.destroy

    respond_to do |format|
      format.html { redirect_to useremails_url, notice: "Useremail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_useremail
      @useremail = Useremail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def useremail_params
      params.require(:useremail).permit(:first_name, :last_name, :email, :order_id)
    end
end
