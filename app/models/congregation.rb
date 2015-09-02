class Congregation < ActiveRecord::Base
  has_many :brothers

  validates_presence_of :name, :meeting_day, :meeting_time

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
