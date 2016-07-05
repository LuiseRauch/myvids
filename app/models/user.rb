class User < ActiveRecord::Base
  has_many :favorites, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_admin_mail

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :email,
           presence: true,
           uniqueness: { case_sensitive: false },
           length: { minimum: 3, maximum: 100 },
           format: { with: EMAIL_REGEX }

  scope :find_all_by_approved, -> (approval_status) { where(approved: approval_status) }
  scope :admin, -> { where(admin: true) }

  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(self).deliver
  end

  def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   if login = conditions.delete(:login)
     where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
   else
     conditions[:email].downcase! if conditions[:email]
     where(conditions.to_hash).first
   end
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end

  def favorite(video)
    favorites.where(video_id: video.id).first
  end

  def series_favorite(series)
    favorites.where(series_id: series.id).first
  end
end
