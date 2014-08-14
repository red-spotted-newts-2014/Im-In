class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.references :event, index: true
      t.references :user, index: true
      t.string :status

      t.timestamps
    end
  end
end
