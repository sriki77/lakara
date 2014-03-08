class Dhatu < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :roopas, :dependent => :destroy

  def roopas_by_lakara(lakara)
    roopas.where(:lakaras => lakara)
  end
end
