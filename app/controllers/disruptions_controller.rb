class DisruptionsController < ApplicationController
  before_action :set_disruption, only: [:show, :edit, :update, :destroy]

  # GET /disruptions
  # GET /disruptions.json
  def index
    # @disruptions = Disruption.all
  end

  # GET /disruptions/1
  # GET /disruptions/1.json
  def show
  end

  # GET /disruptions/new
  def new
    @disruption = Disruption.new
  end

  # GET /disruptions/1/edit
  def edit
  end

  # POST /disruptions
  # POST /disruptions.json
  def create
    @disruption = Disruption.new(disruption_params)

    respond_to do |format|
      if @disruption.save
        format.html { redirect_to @disruption, notice: 'Disruption was successfully created.' }
        format.json { render :show, status: :created, location: @disruption }
      else
        format.html { render :new }
        format.json { render json: @disruption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disruptions/1
  # PATCH/PUT /disruptions/1.json
  def update
    respond_to do |format|
      if @disruption.update(disruption_params)
        format.html { redirect_to @disruption, notice: 'Disruption was successfully updated.' }
        format.json { render :show, status: :ok, location: @disruption }
      else
        format.html { render :edit }
        format.json { render json: @disruption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disruptions/1
  # DELETE /disruptions/1.json
  def destroy
    @disruption.destroy
    respond_to do |format|
      format.html { redirect_to disruptions_url, notice: 'Disruption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disruption
      @disruption = Disruption.find(params[:id]).get
      @cordinats = Disruption.convert(@disruption)
      # lat @disruption['CauseArea']['DisplayPoint']['Point']['coordinatesLL']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disruption_params
      params[:disruption]
    end



end
