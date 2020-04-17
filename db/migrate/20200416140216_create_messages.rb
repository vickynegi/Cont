class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :description
      t.integer :visitor_id

      t.timestamps
    end
  end
end
