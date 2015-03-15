class DisruptionsController < ApplicationController
  before_action :set_disruption, only: [:show]



  def index
    respond_to do |format|
      format.html
      format.json { render json: Disruption.all }
    end
  end

  def show
  end


  private

    def set_disruption
      @disruption = Disruption.find(params[:id]).get
      @cordinats = Disruption.convert(@disruption)
      # lat @disruption['CauseArea']['DisplayPoint']['Point']['coordinatesLL']
    end


    def disruption_params
      params[:disruption]
    end



end
