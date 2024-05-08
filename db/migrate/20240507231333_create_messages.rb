class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :subject
      t.text :body
      t.boolean :read

      t.timestamps
    end
  end
end
