include ActionView::Helpers::DateHelper
class EpisodeController < ApplicationController
  def index
    @user_shows = [877053, 859341, 869934]
    @schedule = Episode.where('episode_airstamp < ? AND episode_id IN (?)', Time.zone.now.strftime("%FT%T%:z"), @user_shows)
                       .order(episode_airstamp: :desc)

    render :json => @schedule
  end
end
