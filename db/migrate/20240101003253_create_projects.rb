class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :code, index: { unique: true }
      t.text :details

      t.timestamps
    end
  end
end
