class Roopa < ActiveRecord::Base
  strip_attributes

  belongs_to :purusha
  belongs_to :vachanam
  belongs_to :lakaras
  belongs_to :dhatu

  def lakaras_id=(id)
    self.lakaras=Lakaras.find(id)
  end

end
