class CreateJoinTableTagGossips < ActiveRecord::Migration[6.0]
  def change
    create_table :join_table_tag_gossips do |t|
      t.belongs_to :gossip
      t.belongs_to :tag

      t.timestamps
    end
  end
end
