class ChangeMembershipTableName < ActiveRecord::Migration[6.0]
  def change
  	rename_table :membership, :memberships
  end
end
