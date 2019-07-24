# frozen_string_literal: true

class Category < ApplicationRecord
	self.table_name  = 'categories'
	self.primary_key = 'id'

  belongs_to :category, optional: true
  belongs_to :user
end
