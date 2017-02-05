class CreateRsvpsTable < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :dish, null: false
      t.integer :potluck_id, null: false
      t.integer :attendee_id, null: false
      
      t.timestamps(null: false)
    end
  end
end
