class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates_format_of :subdomain, with: /^[a-z0-9_]+$/, message: "must be lowercase alphanumerics only"
  # validates_length_of :subdomain, maximum: 32, message: "exceeds maximum of 32 characters"
  # validates_exclusion_of :subdomain, in: ['www', 'mail', 'ftp'], message: "is not available"
end