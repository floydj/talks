class Congregation < ActiveRecord::Base
  include FriendlyId
  has_many :brothers
  validates_presence_of :name, :meeting_day, :meeting_time

  friendly_id :name, use: :slugged

  scope :home_congregations, -> { where(my_congregation: true) }
  def self.my_home_congregation
    return home_congregations.first if home_congregations.any?
  end

  def self.my_congregation_selected?
    Congregation.where(my_congregation: true).any?
  end

  def time_and_day
    "#{meeting_day} #{meeting_time}"
  end

  def full_address
    result = [address || '']
    result.push city_state_zip unless city_state_zip.blank?
    result = result.join ', '
    result
  end

  def city_state_zip
    result = [city || '']
    result.push(state) unless state.blank?
    result = result.join ', '
    result += " #{zip}" unless zip.blank?
    result
  end
end
