class MembershipTable < ActiveRecord::Migration[6.0]
  def change
  	create_table 'membership' do |t|
      t.integer 'member_id', :null => false
      t.integer 'admin_id', :null => false

      t.timestamps null: false
    end

    add_index :membership, :member_id
    add_index :membership, :admin_id
    add_index :membership, [:member_id, :admin_id], unique: true
  end
end
