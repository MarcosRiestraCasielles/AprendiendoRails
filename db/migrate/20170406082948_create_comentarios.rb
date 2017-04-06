class CreateComentarios < ActiveRecord::Migration[5.0]
  def change
    create_table :comentarios do |t|
      t.references :comentarista, foreign_key: true
      t.text :comentario

      t.timestamps
    end
  end
end
