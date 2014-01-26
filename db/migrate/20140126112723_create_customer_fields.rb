class CreateCustomerFields < ActiveRecord::Migration
  def change
    create_table :customer_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :Customer_type, index: true

      t.timestamps
    end
  end
end
