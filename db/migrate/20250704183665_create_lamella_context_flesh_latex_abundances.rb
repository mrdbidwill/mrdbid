class CreateLamellaContextFleshLatexAbundances < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:lamella_context_flesh_latex_abundances)

    create_table :lamella_context_flesh_latex_abundances do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
