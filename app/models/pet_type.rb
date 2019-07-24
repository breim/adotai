# frozen_string_literal: true

class PetType < ApplicationRecord
	self.table_name  = 'pets'
	self.primary_key = 'id'

	has_many :pet_races, :dependent => :destroy
  belongs_to :user
end
