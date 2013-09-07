class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :choice
      t.belongs_to :taker, class_name: "User"
      t.timestamps
    end
  end
end
