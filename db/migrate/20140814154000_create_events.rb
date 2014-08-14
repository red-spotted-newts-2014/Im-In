class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :venue
      t.string :location
      t.boolean :notification?
      t.integer :notify_time
      t.references :user, index: true

      t.timestamps
    end
  end
end
