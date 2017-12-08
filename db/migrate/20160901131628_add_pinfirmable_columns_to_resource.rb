class AddPinfirmableColumnsToResource < ActiveRecord::Migration[5.0]
  def change
    model = (ENV["MODEL"] || "user").downcase.pluralize.to_sym
    unless column_exists?(model, :pinfirmable_pin)
    	add_column model, :pinfirmable_pin, :string
    	add_column model, :pinfirmable_tries, :integer, default: 0
    	add_column model, :pinfirmable_lockout, :datetime, default: nil
		end
  end
end
