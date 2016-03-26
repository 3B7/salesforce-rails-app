class CreateReleaseNotes < ActiveRecord::Migration
  def up
    create_table :release_notes do |t|
      t.string :version_number
      t.text :body
      t.integer :created_by_id
    end
  end

  def down
    drop_table :release_notes
  end
end
