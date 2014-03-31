class Roopa < ActiveRecord::Base
  strip_attributes

  belongs_to :purusha, -> { readonly }
  belongs_to :vachanam, -> { readonly }
  belongs_to :lakaras, -> { readonly }
  belongs_to :dhatu

  def lakaras_id=(id)
    self.lakaras=Lakaras.find(id)
  end

end
