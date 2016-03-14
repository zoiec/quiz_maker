class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  validates_presence_of :email, unless: :guest?
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i, unless: :guest?
  validates_presence_of :password, unless: :guest?
  validates_confirmation_of :password, unless: :guest?
  validates_length_of :password, within: 8..72, unless: :guest?
end
