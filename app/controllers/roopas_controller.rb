class RoopasController < ApplicationController
  before_filter :load_ref_data

  def show
    roopa_params
    @roopa_name_map={}
    name=params[:r].strip
    unless name.blank?
      name_with_colon=name.tr("\u0903", ':')
      name_with_unicode =name.tr(':', "\u0903")

      @roopa = Roopa.includes(:dhatu, :purusha, :vachanam, :lakaras).where(
          :name => [name.strip, name_with_colon.strip, name_with_unicode.strip])

      if @roopa.empty?
        candidates = Roopa.includes(:dhatu, :purusha, :vachanam, :lakaras)
                         .where("name LIKE ? OR name LIKE ? OR name LIKE ?",
                                "%#{name}%", "%#{name_with_colon}%", "%#{name_with_unicode}%")
        unless candidates.empty?
          candidates.each do |r|
            r.name.split(/\//).each { |s|
              @roopa << r if s.strip == name.strip
            }
          end
        end
      end
      @roopa.each do |r|
        @roopa_name_map[r.name]=name unless r.name.include? "/"
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
