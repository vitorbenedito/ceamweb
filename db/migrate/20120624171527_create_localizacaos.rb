class CreateLocalizacaos < ActiveRecord::Migration
  def change
    create_table :localizacaos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
