class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
    	t.integer :episode_id
    	t.string :episode_url
    	t.string :episode_name
    	t.string :episode_season
    	t.string :episode_number
    	t.string :episode_airdate
    	t.string :episode_airtime
    	t.string :episode_airstamp
    	t.string :episode_runtime
    	t.string :episode_image
    	t.string :episode_summary
    	t.integer :show_id
    	t.string :show_url
    	t.string :show_name
    	t.string :show_type
    	t.string :show_language
    	t.string :show_genres
    	t.string :show_status
    	t.string :show_runtime
    	t.string :show_premiered
    	t.string :show_rating
    	t.string :show_network
    	t.integer :show_tvrage
    	t.integer :show_thetvdb
    	t.string :show_imdb
    	t.string :show_image
    	t.string :show_summary
      t.timestamps
    end
  end
end
