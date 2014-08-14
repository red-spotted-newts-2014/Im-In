class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :venue
      t.string :location
      t.boolean :notify_user?
      t.integer :notify_hours_until_event
      t.references :user, index: true

      t.timestamps
    end
  end
end
