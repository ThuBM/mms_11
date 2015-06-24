class Activity < ActiveRecord::Base
  before_save :set_default_value

  belongs_to :user

  private
  def set_default_value
    self.time = Time.zone.now
  end
end
