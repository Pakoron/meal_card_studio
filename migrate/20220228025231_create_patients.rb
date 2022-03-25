class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :form
      t.string :disease
      t.string :staple
      t.string :allergy
      t.string :dislike
      t.text :comment

      t.timestamps
    end
  end
end
