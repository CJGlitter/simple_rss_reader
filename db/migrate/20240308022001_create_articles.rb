class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.datetime :publish_date
      t.string :link
      t.string :author
      t.boolean :read_status

      t.timestamps
    end
  end
end
