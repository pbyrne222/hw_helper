class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.text :description
      t.text :history
      t.references :user, index: true
      t.boolean :resolved

      t.timestamps
    end
  end
end
