class CreateMyPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :my_posts do |t|

      t.timestamps
    end
  end
end
