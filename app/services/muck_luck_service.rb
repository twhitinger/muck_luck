class MuckLuckService
  attr_reader :connection

  def initialize(user)

     @user = user
     @connection = Faraday.new("https://api.github.com/")
     connection.headers["Authorization"] = "token #{@user.oauth_token}"
  end

  # def connection
  #   Faraday.new("https://api.github.com/")
  # end

  def get_users
    response = connection.get "users"
    parse(response)
  end
  # https://api.github.com/users?client_id=5d81bc1add4a10de7d55&client_secret=e25e547ad91d10ff7093daf12346f1cfdddbac7e
  def get_user
    response = connection.get "user"
    parse(response)
  end

  def get_starred_repos
    response = connection.get "user/starred"
    parse(response)
  end

  def get_feeds
    response = connection.get "users/#{@user.login}/events"
    parse(response)
  end

  def get_orgs
    response = connection.get "users/#{@user.login}/orgs"
    parse(response)
  end

  def get_repos
    response = connection.get "users/#{@user.login}/repos"
    parse(response)
    #  repos_url="https://api.github.com/users/twhitinger/repos",
  end

  def get_recent_following_feeds
    response = connection.get "users/#{@user.login}/received_events"
    parse(response)
  end


  # def starred_repos
  #   response = connection.get "gists/starred?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}"
  #   binding.pry
  #   "starred_gists_url": "https://api.github.com/gists/starred"
  # end


  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true, object_class: OpenStruct)
  end

  def client_auth
  end

end

# <OpenStruct login="twhitinger",
# id=7494284,
# avatar_url="https://avatars.githubusercontent.com/u/7494284?v=3",
# gravatar_id="", url="https://api.github.com/users/twhitinger",
# html_url="https://github.com/twhitinger",
# followers_url="https://api.github.com/users/twhitinger/followers",
# following_url="https://api.github.com/users/twhitinger/following{/other_user}",
# gists_url="https://api.github.com/users/twhitinger/gists{/gist_id}",
# starred_url="https://api.github.com/users/twhitinger/starred{/owner}{/repo}",
# subscriptions_url="https://api.github.com/users/twhitinger/subscriptions",
# organizations_url="https://api.github.com/users/twhitinger/orgs",
#  repos_url="https://api.github.com/users/twhitinger/repos",
#  events_url="https://api.github.com/users/twhitinger/events{/privacy}",
#  received_events_url="https://api.github.com/users/twhitinger/received_events",
#  type="User", site_admin=false, name="Trent W",
#  company=nil, blog=nil, location=nil, email=nil, hireable=true, bio=nil,
#  public_repos=47, public_gists=5, followers=3, following=7,
#  created_at="2014-05-05T23:16:37Z", updated_at="2016-08-24T20:39:16Z">


# MuckLuckService.new.get_users
