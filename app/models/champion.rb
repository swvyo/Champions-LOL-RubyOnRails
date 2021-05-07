class Champion < ApplicationRecord
    validates :name, presence: true
    
    def self.build_champion(name:, location:, masteries:, description:)
        Champion.new(name: name, location: location, masteries: masteries, description: description)
    end
end
