class CreateJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :journeys do |t|
      t.string :title
      t.string :date
      t.integer :miles
      t.string :location
      t.text :description
      t.integer :user_id
    end
  end
end
