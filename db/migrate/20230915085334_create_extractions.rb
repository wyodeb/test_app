class CreateExtractions < ActiveRecord::Migration[7.0]
  def change
    create_table :extractions do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :native_lang
      t.string :target_lang
      t.string :source

      t.timestamps
    end
  end
end
