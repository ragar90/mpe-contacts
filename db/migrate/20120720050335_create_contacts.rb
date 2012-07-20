class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :lastname
      t.string :phone
      t.string :cellphone
      t.string :comunity

      t.timestamps
    end
  end
end
