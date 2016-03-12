class CountriesController < ApplicationController
  
  def states
    country = Country.find(params[:country_id])
    respond_to do |format|
      format.json { render :json => country.states }
    end
  end

end
