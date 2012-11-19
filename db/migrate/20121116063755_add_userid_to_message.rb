class AddUseridToMessage < ActiveRecord::Migration
  def change
  add_column :messages, :owner_id, :string
  add_index "messages", ["owner_id"], :name => "index_messages_on_owner_id"
  end
end
