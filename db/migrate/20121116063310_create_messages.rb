class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sub
      t.text :body
      t.integer :read_msg

      t.timestamps
    end
  end
end
