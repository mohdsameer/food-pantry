class ConnectionRequestSerializer < ActiveModel::Serializer
  attributes :id, :send_by, :status, :reciever_id, :sender_id
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
