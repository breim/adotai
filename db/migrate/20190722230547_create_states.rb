# frozen_string_literal: true

class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table   :states do |t|
      t.string     :name
      t.string 		 :acronym
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
