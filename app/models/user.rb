class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :generate_fake_email
  after_update :generate_fake_email_if_needed

  # Associations
  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'

  after_create :send_welcome_email

  # Make first_name, last_name, age, and description optional during registration
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :age, presence: true, on: :update
  validates :description, presence: true, on: :update

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  def generate_fake_email_if_needed
    if first_name_changed? || last_name_changed?
      generate_fake_email
    end
  end

  def generate_fake_email
    if self.first_name.present? && self.last_name.present?
      first_name = self.first_name.downcase
      last_initial = self.last_name.downcase[0]
      self.fake_email = "#{first_name}.#{last_initial}@eventbrite.com"
      self.save
    else
      self.fake_email = "user@example.com"
    end
  end
end
