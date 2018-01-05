class CreateShortenUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shorten_urls do |t|
      t.string :url
      t.string :shorten

      t.timestamps
    end
  end
end
