class CreateLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :leaves do |t|
      t.datetime :start_date, index: true
      t.datetime :end_date, index: true
      t.integer :user_id, index: true
      t.text :notes

      t.timestamps
    end
  end
end
