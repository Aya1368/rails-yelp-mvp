class Restaurant < ApplicationRecord
 validates :name, :address, :category, :phone_number, presence: true
 CATEGORY = [ "chinese", "italian", "japanese", "french", "belgian"]
validates :category, inclusion: CATEGORY
has_many :reviews, dependent: :destroy
end
