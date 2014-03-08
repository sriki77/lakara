class RoopasController < ApplicationController

  def show
    name=params[:r]
    unless name.blank?
      @roopa = Roopa.find_by_name(name.strip)
    end
    respond_to do |f|
      f.json
      f.any { render :text => "Only JSON format supported" }
    end
  end
end