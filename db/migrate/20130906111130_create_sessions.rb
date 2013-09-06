class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :survey
      t.belongs_to :taker
    end
  end
end
