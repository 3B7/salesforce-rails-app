class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :refresh_token
      t.string :access_token
      t.string :salesforce_producer_id
      t.string :image
      t.timestamp :expires
      t.timestamp :last_request_at
      t.boolean :authorized
      t.string :ip_address

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
