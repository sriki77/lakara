class Roopa < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :purusha
  belongs_to :vachanam
  belongs_to :padam
  belongs_to :lakaras
  belongs_to :dhatu
end
