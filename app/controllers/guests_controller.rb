class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
    redirect_to edit_guest_path(@guest) unless@guest.viewed?
  end

  def edit
    @guest = Guest.find(params[:id])
    if @guest.plus
      @guest.plus.times {@guest.companions << Companion.new} unless @guest.companions.count == @guest.plus
    end
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(guest_params)
      flash[:notice] = 'Informacion Actualizada!'
      redirect_to guest_path(@guest)
    else
      flash[:alert] = "Ups, algo paso. Intenta de nuevo! #{@guest.errors.full_messages}"
      redirect_to :back
    end
  end

  private

  def guest_params
      params.require(:guest).permit(:email,:full_name,:attending, :viewed, companions_attributes: [:id,:full_name])
  end

end