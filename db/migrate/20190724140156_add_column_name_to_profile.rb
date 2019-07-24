# frozen_string_literal: true

class AddColumnNameToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :name, :string
  end
end
