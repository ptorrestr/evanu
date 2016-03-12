class KindergardensController < ApplicationController

  def index
    authorize Kindergarden
    @kindergardens = policy_scope(Kindergarden).paginate(page: params[:page])
  end

  def show
    @kindergarden = Kindergarde.find(params[:id])
  end
 
  def new
    @kindergarden = Kindergarden.new
  end

  def create
    authorize Kindergarden
    user = {'user' => current_user }
    @kindergarden = Kindergarden.new(kindergarden_params.merge(user))
    if @kindergarden.save
      flash[:success] = "Kindergarden created"
      redirect_to kindergardens_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @kindergarden.update_attributes(kindergarden_params)
      flash[:success] = "Kindergarden updated"
      redirect_to @kindergarden
    else
      render 'edit'
    end
  end

  def destroy
    Kindergarden.find(params[:id]).destroy
    flash[:success] = "Kindergarden deleted"
    redirect_to kindergardens_path
  end

  private

  def kindergarden_params
    params.require(:kindergarden).permit(:name, :phone, :city_id)
  end
end
