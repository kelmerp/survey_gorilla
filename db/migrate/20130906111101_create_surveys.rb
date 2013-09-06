class CreateSurveys < ActiveRecord::Migration
  def change 
    create_table :surveys do |t|
      t.string :title
      t.belongs_to :creator, class_name: "User"
      t.timestamps

    end
  end
end
