class Developer < ActiveRecord::Base
    has_many :games,  dependent: :destroy
    validates :name, presence: true               
end
