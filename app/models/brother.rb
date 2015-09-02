class Brother < ActiveRecord::Base
  belongs_to :congregation
  has_and_belongs_to_many :outlines
  validates_presence_of :first_name, :last_name, :congregation_id

  def full_name(reverse: false)
    if reverse
      "#{last_name}, #{first_name}"
    else
      "#{first_name} #{last_name}"
    end
  end

end
