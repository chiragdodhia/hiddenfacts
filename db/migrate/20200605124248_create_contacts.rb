class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :sender_email
      t.string :receiver_email
      t.string :mobile_no
      t.text :message

      t.timestamps
    end
  end
end
