class ConnectionRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :reciever, class_name: 'User'

  enum status: { pending: 0, accepted: 1 }
  enum send_by: { supplier: 0, restaurant: 1 }
end

# == Schema Information
#
# Table name: connection_requests
#
#  id          :bigint           not null, primary key
#  send_by     :integer
#  status      :integer          default("pending")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  reciever_id :integer
#  sender_id   :integer
#
