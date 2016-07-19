class CreateSlackDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :slack_details do |t|
      t.string :user_name
      t.references :user
      t.timestamps
    end
  end
end
