include ActionView::Helpers::DateHelper
class EpisodeController < ApplicationController
  def index
    @schedule = HTTP.get("http://api.tvmaze.com/schedule?country=US&date=" + Time.zone.now.strftime("%Y-%m-%d")).parse

    episodes = []

    @schedule.each do |episode|
      if (Time.zone.now.strftime("%FT%T%:z").to_time - 1.hours..Time.zone.now.strftime("%FT%T%:z")).cover?(episode['airstamp'])
        episodes.push(episode['airstamp'] => time_ago_in_words(episode['airstamp']) + ' ago')
      end
    end

    render :json => episodes
  end
end
