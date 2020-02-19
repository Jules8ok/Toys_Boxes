class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :orders


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  after_create :send_welcome_email


  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

end
