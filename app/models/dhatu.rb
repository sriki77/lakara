class Dhatu < ActiveRecord::Base
  strip_attributes
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :roopas, :dependent => :destroy, :include =>[:purusha,:vachanam,:lakaras]
  accepts_nested_attributes_for :roopas
  belongs_to :padam

  def roopas_by_lakara(lakara)
    roopas.where(:lakaras => lakara)
  end

  def new_roopas=(roopa_attributes)
    roopa_attributes.each do |attributes|
      roopas.build(attributes)
    end
  end

  def edit_roopas=(roopa_attributes)
    roopas.reject(&:new_record?).each do |roopa|
      attributes = roopa_attributes[roopa.id.to_s]
      roopa.attributes = attributes
    end
  end
end
