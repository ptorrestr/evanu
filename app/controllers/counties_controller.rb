class CountiesController < ApplicationController

  def cities
    county = County.find(params[:county_id])
    respond_to do |format|
      format.json { render :json => county.cities }
    end
  end

end
