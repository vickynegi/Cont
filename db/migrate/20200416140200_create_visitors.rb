class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :first_name
    	t.string :last_name
      t.string :email
      t.string :phone
      t.timestamps
    end
  end
end
