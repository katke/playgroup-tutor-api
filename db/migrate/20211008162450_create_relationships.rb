class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :requester_id
      t.integer :responder_id
      t.string :status

      t.timestamps
    end
  end
end
