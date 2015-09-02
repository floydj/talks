class Congregation < ActiveRecord::Base
  include FriendlyId
  has_many :brothers
  validates_presence_of :name, :meeting_day, :meeting_time

  friendly_id :name, use: :slugged

  scope :home_congregation, -> { where(my_congregation: true) }

  def self.my_home_congregation
    if home_congregation.any?
      return home_congregation.first
    end
  end

  def self.my_congregation_selected?
    return Congregation.where(my_congregation: true).any?
  end

  def time_and_day
    "#{meeting_day} #{meeting_time}"
  end

  def full_address
    result = ""
    result += "#{address}" unless address.blank?
    result += ", #{city}" unless city.blank?
    result += ", #{state}" unless state.blank?
    result += " #{zip}" unless zip.blank?
    result
  end

end
