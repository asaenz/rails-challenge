class AddWebsiteHeadersToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :website_headers, :text
  end
end
