class AddPinfirmablePinToResource < ActiveRecord::Migration[5.0]
  def change
    model = (ENV["MODEL"] || "user").downcase.pluralize.to_sym
    add_column model, :pinfirmable_pin, :string
  end
end
