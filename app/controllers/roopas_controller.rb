class RoopasController < ApplicationController
  before_filter :load_ref_data

  def show
    roopa_params
    name=params[:r]
    unless name.blank?
      @roopa = Roopa.includes(:dhatu,:purusha,:vachanam,:lakaras).where(:name => name.strip)
      if @roopa.empty?
        candidates = Roopa.includes(:dhatu,:purusha,:vachanam,:lakaras).where("name LIKE ?", "%#{name}%")

        unless candidates.empty?
          candidates.each do |r|
            r.name.split(/\//).each{ |s|
              @roopa << r if s.strip == name.strip
            }
          end
          end
      end
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
