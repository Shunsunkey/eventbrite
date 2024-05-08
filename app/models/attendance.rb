class Attendance < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :event
  after_create :send_participation_email
  # Attribut supplémentaire
  validates :stripe_customer_id, presence: true

  private
  
  def send_participation_email
    EventMailer.partiipation_email(self.user, self.event).deliver_now
  end
end
