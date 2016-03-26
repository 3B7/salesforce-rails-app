class CreateApiCalls < ActiveRecord::Migration
  def up
    create_table :api_calls do |t|
      t.integer   :max_calls
      t.integer   :remaining_calls
      t.integer   :used_calls
      t.string    :type

      t.timestamps
    end
  end

  def down
    drop_table :api_calls
  end
end
