class CreateActivities < ActiveRecord::Migration
  def up
    create_table :activities do |t|
      t.string :title
      t.string :act_type
      t.text :description
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :activities
  end
end