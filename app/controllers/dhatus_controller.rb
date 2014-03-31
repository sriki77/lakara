class DhatusController < ApplicationController
  before_filter :authorize, :load_ref_data

  def index
    @dhatus=Dhatu.all
  end

  def show
    @dhatu= Dhatu.includes(:roopas).find(params[:id])
  end

  def new
  end

  def edit
    @dhatu= Dhatu.includes(:roopas).find(params[:id])
  end

  def update
    dhatu_params
    @dhatu= Dhatu.includes(:roopas).find(params[:id])
    @dhatu.update!(dhatu_params)
    redirect_to @dhatu
  end

  def create
    @dhatu = Dhatu.new(dhatu_params)
    @dhatu.save!
    redirect_to @dhatu
  end

  def destroy
    @dhatu= Dhatu.find(params[:id])
    @dhatu.destroy!
    redirect_to @dhatu
  end

  private

  def dhatu_params
    params[:dhatu].permit(:name, :description, :padam_id,
                          :new_roopas => [:name, :lakaras_id, :purusha_id, :vachanam_id],
                          :edit_roopas => [:name])
  end
end
