class Movie < ApplicationRecord
    validates :genere, presence: true
    validates :releaseyear, presence: true
    validates :title, presence: true
    validates :director, presence: true
    validates :stock, presence: true

    def self.ransackable_attributes(_auth_object = nil)
        %w[title director genere releaseyear]
    end
    def self.ransackable_associations(_auth_object = nil)
        [ "stock" ]
    end
end
