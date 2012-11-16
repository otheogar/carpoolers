class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sub
      t.text :body
      t.integer :read

      t.timestamps
    end
  end
end
