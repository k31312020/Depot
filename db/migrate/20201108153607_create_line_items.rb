class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references :product, { null: true, foreign_key: true }
      t.belongs_to :cart, { nll: true, foreign_key: true }

      t.timestamps
    end
  end
end
