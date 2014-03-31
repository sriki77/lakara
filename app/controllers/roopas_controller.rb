class RoopasController < ApplicationController
  before_filter :load_ref_data

  def show
    roopa_params
    name=params[:r]
    unless name.blank?
      @roopa = Roopa.where(:name => name.strip)
    end
    respond_to do |f|
      f.json
      f.any { render :text => "Only JSON format supported" }
    end
  end

  def roopa_params
    params.permit(:r)
  end
end