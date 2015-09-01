class Congregation < ActiveRecord::Base
  has_many :brothers

  validates_presence_of :name, :meeting_day, :meeting_time

  def time_and_day
    "#{meeting_day} #{meeting_time}"
  end

end
