class RoopasController < ApplicationController

  def show
    roopa_params
    name=params[:r]
    unless name.blank?
      @roopa = Roopa.find_by_name(name.strip)
      p @roopa
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