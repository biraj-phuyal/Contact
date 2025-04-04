class CreateContacts < ActiveRecord::Migration[8.0]
  def up
    create_table :contacts do |t|
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
  
  def down
    drop_table :contact_managers
  end
end
