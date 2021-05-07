class CreateChampionsAdquiridos < ActiveRecord::Migration[5.0]
  def change
    create_table :champions_adquiridos do |t|
      t.string :data_aquisicao
      t.references :champion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
