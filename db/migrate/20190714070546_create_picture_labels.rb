class CreatePictureLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_labels do |t|
      t.references :picture, foreign_key: true
      t.references :label, foreign_key: true
      t.timestamps
    end
  end
end
