class CreateSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :solutions do |t|
      t.references :user, foreign_key: true
      t.references :contest, foreign_key: true
      t.references :challenge, foreign_key: true
      t.string :answer
      t.string :status

      t.timestamps
    end
  end
end
