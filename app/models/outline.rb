class Outline < ActiveRecord::Base
  has_and_belongs_to_many :brother
  validates_presence_of :title, :number
  validates_numericality_of :number

  def title_with_number
    "#{number} - #{title}"
  end
end
