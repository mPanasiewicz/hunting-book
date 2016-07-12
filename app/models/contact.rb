class Contact < ApplicationRecord
  validates :name, :email, :phone, :address, presence: true
end
