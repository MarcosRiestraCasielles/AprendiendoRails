class CreateOpinions < ActiveRecord::Migration[5.0]
  def change
    create_table :opinions do |t|
      t.text :opinion
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
