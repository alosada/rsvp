class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
  end

  def edit
    @guest = Guest.find(params[:id])
    @guest.plus.times {@guest.companions << Companion.new} unless @guest.companions.count == @guest.plus
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(guest_params)
      flash[:notice] = 'Informacion Actualizada!'
      redirect_to guest_path(@guest)
    else
      flash[:alert] = 'Ups, algo paso. Intenta de nuevo!'
      redirect_to :back
    end
  end

  private

  def guest_params
      params.require(:guest).permit(:email,:full_name,:attending, companions_attributes: [:id,:full_name])
  end

end