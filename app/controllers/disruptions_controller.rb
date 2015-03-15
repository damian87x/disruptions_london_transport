class DisruptionsController < ApplicationController


  def index
    respond_to do |format|
      format.html
      format.json { render json: Disruption.find_all }
    end
  end

  def home

  end

  private

  def disruption_params
    params[:disruption]
  end


end
