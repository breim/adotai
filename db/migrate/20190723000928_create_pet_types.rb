# frozen_string_literal: true

class CreatePetTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_types do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
