class Income < ApplicationRecord
    belongs_to :user

    validates :income_type, :value, presence: :true
end
