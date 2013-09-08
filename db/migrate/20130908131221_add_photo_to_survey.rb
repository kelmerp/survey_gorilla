class AddPhotoToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :photo_url, :string
  end
end
