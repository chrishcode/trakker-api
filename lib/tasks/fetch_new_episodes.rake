namespace :schedule do
	desc "Fetch todays scheduled episodes"
	task :fetch_new_episodes => :environment do
		include ActionView::Helpers::DateHelper

		@schedule = HTTP.get("http://api.tvmaze.com/schedule?country=US&date=" + Time.zone.now.strftime("%Y-%m-%d")).parse

		@schedule.each do |scheduled_episode|
      unless scheduled_episode['show']['image'].nil?
        if scheduled_episode['airdate'] == Time.zone.now.strftime("%Y-%m-%d")
          created_episode = Episode.create(
            episode_id: scheduled_episode['id'],
            episode_url: scheduled_episode['url'],
            episode_name: scheduled_episode['name'],
            episode_season: scheduled_episode['season'],
            episode_number: scheduled_episode['number'],
            episode_airdate: scheduled_episode['airdate'],
            episode_airtime: scheduled_episode['airtime'],
            episode_airstamp: scheduled_episode['airstamp'],
            episode_runtime: scheduled_episode['runtime'],
            episode_image: nil,
            episode_summary: scheduled_episode['summary'],
            show_id: scheduled_episode['show']['id'],
            show_url: scheduled_episode['show']['url'],
            show_name: scheduled_episode['show']['name'],
            show_type: scheduled_episode['show']['type'],
            show_language: scheduled_episode['show']['language'],
            show_genres: scheduled_episode['show']['genres'][0],
            show_status: scheduled_episode['show']['status'],
            show_runtime: scheduled_episode['show']['runtime'],
            show_premiered: scheduled_episode['show']['premiered'],
            show_rating: scheduled_episode['show']['rating']['average'],
            show_network: scheduled_episode['show']['network']['name'],
            show_tvrage: scheduled_episode['show']['externals']['tvrage'],
            show_thetvdb: scheduled_episode['show']['externals']['thetvdb'],
            show_imdb: scheduled_episode['show']['externals']['imdb'],
            show_image: scheduled_episode['show']['image']['original'],
            show_summary: scheduled_episode['show']['summary']
          )
        end
      end
    end
    # aired_episodes = []

    # @schedule.each do |scheduled_episode|
    #   if (Time.zone.now.strftime("%FT%T%:z").to_time - 15.minutes..Time.zone.now.strftime("%FT%T%:z")).cover?(scheduled_episode['airstamp'])
    #     aired_episodes.push(scheduled_episode)
    #   end
    # end

    # aired_episodes.each do |aired_episode|
    # 	unless aired_episode['show']['image'].nil?
	   #    created_episode = Episode.create(
				# 	episode_id: aired_episode['id'],
				# 	episode_url: aired_episode['url'],
				# 	episode_name: aired_episode['name'],
				# 	episode_season: aired_episode['season'],
				# 	episode_number: aired_episode['number'],
				# 	episode_airdate: aired_episode['airdate'],
				# 	episode_airtime: aired_episode['airtime'],
				# 	episode_airstamp: aired_episode['airstamp'],
				# 	episode_runtime: aired_episode['runtime'],
				# 	episode_image: aired_episode['image'],
				# 	episode_summary: aired_episode['summary'],
				# 	show_id: aired_episode['show']['id'],
				# 	show_url: aired_episode['show']['url'],
				# 	show_name: aired_episode['show']['name'],
				# 	show_type: aired_episode['show']['type'],
				# 	show_language: aired_episode['show']['language'],
				# 	show_genres: aired_episode['show']['genres'][0],
				# 	show_status: aired_episode['show']['status'],
				# 	show_runtime: aired_episode['show']['runtime'],
				# 	show_premiered: aired_episode['show']['premiered'],
				# 	show_rating: aired_episode['show']['rating']['average'],
				# 	show_network: aired_episode['show']['network']['name'],
				# 	show_tvrage: aired_episode['show']['externals']['tvrage'],
				# 	show_thetvdb: aired_episode['show']['externals']['thetvdb'],
				# 	show_imdb: aired_episode['show']['externals']['imdb'],
				# 	show_image: aired_episode['show']['image']['original'],
				# 	show_summary: aired_episode['show']['summary']
	   #    )
    # 	end
    # end
	end
end
