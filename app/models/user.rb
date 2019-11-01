class User < ApplicationRecord
	has_secure_password
	belongs_to :city
	has_many :gossips

  	has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  	has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
    
   
    validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }   	



end # class
