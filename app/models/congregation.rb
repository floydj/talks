class Congregation < ActiveRecord::Base
  validates_presence_of :name, :meeting_day, :meeting_time

  def time_and_day
    "#{meeting_day} #{meeting_time}"
  end

end
