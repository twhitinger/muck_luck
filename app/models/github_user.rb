class GithubUser


  def self.service(user)
    @@service ||= MuckLuckService.new(user)
  end

  def self.all(user)
    service(user).get_users
  end

  def self.find_github_user(user)
    service(user).get_user
  end

  def self.starred_repos(user)
    service(user).get_starred_repos
  end

  def self.feeds(user)
    service(user).get_feeds
  end

  def self.orgs(user)
    service(user).get_orgs
  end

  def self.repos(user)
    service(user).get_repos
  end

  def self.follower_feeds(user)
    service(user).get_recent_following_feeds
  end

  def self.top_ten_followers
    all.sort_by do |user|
      find(user.login).followers
    end.reverse.take(10)
  end

end




# {
#   "current_user_url": "https://api.github.com/user",
#   "current_user_authorizations_html_url": "https://github.com/settings/connections/applications{/client_id}",
#   "authorizations_url": "https://api.github.com/authorizations",
#   "code_search_url": "https://api.github.com/search/code?q={query}{&page,per_page,sort,order}",
#   "emails_url": "https://api.github.com/user/emails",
#   "emojis_url": "https://api.github.com/emojis",
#   "events_url": "https://api.github.com/events",
#   "feeds_url": "https://api.github.com/feeds",
#   "followers_url": "https://api.github.com/user/followers",
#   "following_url": "https://api.github.com/user/following{/target}",
#   "gists_url": "https://api.github.com/gists{/gist_id}",
#   "hub_url": "https://api.github.com/hub",
#   "issue_search_url": "https://api.github.com/search/issues?q={query}{&page,per_page,sort,order}",
#   "issues_url": "https://api.github.com/issues",
#   "keys_url": "https://api.github.com/user/keys",
#   "notifications_url": "https://api.github.com/notifications",
#   "organization_repositories_url": "https://api.github.com/orgs/{org}/repos{?type,page,per_page,sort}",
#   "organization_url": "https://api.github.com/orgs/{org}",
#   "public_gists_url": "https://api.github.com/gists/public",
#   "rate_limit_url": "https://api.github.com/rate_limit",
#   "repository_url": "https://api.github.com/repos/{owner}/{repo}",
#   "repository_search_url": "https://api.github.com/search/repositories?q={query}{&page,per_page,sort,order}",
#   "current_user_repositories_url": "https://api.github.com/user/repos{?type,page,per_page,sort}",
#   "starred_url": "https://api.github.com/user/starred{/owner}{/repo}",
#   "starred_gists_url": "https://api.github.com/gists/starred",
#   "team_url": "https://api.github.com/teams",
#   "user_url": "https://api.github.com/users/{user}",
#   "user_organizations_url": "https://api.github.com/user/orgs",
#   "user_repositories_url": "https://api.github.com/users/{user}/repos{?type,page,per_page,sort}",
#   "user_search_url": "https://api.github.com/search/users?q={query}{&page,per_page,sort,order}"
