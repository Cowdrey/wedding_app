class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.text :email, null: false
      t.text :first_name
      t.text :last_name
      t.text :all_attendants
      t.integer :party_count
      t.boolean :rsvp
      t.boolean :is_attending
      t.integer :number_attending

      t.timestamps
    end
  end
end
