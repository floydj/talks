class Outline < ActiveRecord::Base

  validates_presence_of :title, :number
  validates_numericality_of :number
end
