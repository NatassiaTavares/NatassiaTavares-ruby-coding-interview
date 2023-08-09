class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company, optional: true
  scope :by_company, -> (identifier) { where(company: identifier) if identifier.present? }
  scope :by_username, -> (username) { where('username LIKE ?', username) if username.present? }
end
