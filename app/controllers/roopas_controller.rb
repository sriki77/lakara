class RoopasController < ApplicationController

  def show
    return redirect_to root_path if params[:id].blank?
    name=params[:id];
    roopa = Roopa.find_by_name(name)
    return redirect_to root_path unless roopa
  end

end