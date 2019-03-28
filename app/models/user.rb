# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

	protected

  enum role: { registered: 0, subscriber: 1, journalist: 2, editor: 3 }

  def password_required?
    confirmed? ? super : false
	end
end