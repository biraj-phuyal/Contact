class Contact < ApplicationRecord
    validates :name, uniqueness: true
    validates :phone, uniqueness: true
end
