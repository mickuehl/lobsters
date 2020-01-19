# frozen_string_literal: true

module Filter

  TAG_FILTER_COOKIE = :tag_filters
  
  def tags_filtered_by_cookie
    @_tags_filtered ||= Tag.where(
      :tag => cookies[TAG_FILTER_COOKIE].to_s.split(",")
    )
  end

  def agent_is_spider?
    ua = request.env["HTTP_USER_AGENT"].to_s
    (ua == "" || ua.match(/(Google|bing|Slack|Twitter)bot|Slurp|crawler|Feedly|FeedParser|RSS/))
  end

  def find_user_from_rss_token
    if !@user && request[:format] == "rss" && params[:token].to_s.present?
      @user = User.where(:rss_token => params[:token].to_s).first
    end
  end

  def prepare_exception_notifier
    exception_data = {}
    exception_data[:username] = @user.username unless @user.nil?

    request.env["exception_notifier.exception_data"] = exception_data
  end
  
end