class StatesController < ApplicationController

  def counties
    state = State.find(params[:state_id])
    respond_to do |format|
      format.json { render :json => state.counties }
    end
  end

end
