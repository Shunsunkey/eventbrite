class AddFakeEmailToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :fake_email, :string
  end
end
