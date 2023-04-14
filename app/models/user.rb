class User < ApplicationRecord
  has_many :send_requests, foreign_key: :sender_id, class_name: 'ConnectionRequest'
  has_many :recieve_requests, foreign_key: :reciever_id, class_name: 'ConnectionRequest'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  enum company_type: { supplier: 0, restaurant: 1 }

  def supplier?
    company_type == 'supplier'
  end

  def restaurant?
    company_type == 'restaurant'
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  company_type           :integer
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string
#  last_name              :string
#  locked_at              :datetime
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
