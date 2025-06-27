class CreateGillContextFleshLatexAbundances < ActiveRecord::Migration[8.0]
  def change
    create_table :gill_context_flesh_latex_abundances do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.integer :source
      t.timestamps
    end
  end
end
