class GithubUsersController < ApplicationController

  def index
     @users = GithubUser.all(current_user)
     @user = GithubUser.find_github_user(current_user)
     @starred_repos_count =  GithubUser.starred_repos(current_user).count
     @feeds = GithubUser.feeds(current_user)
     @orgs = GithubUser.orgs(current_user)
     @repos = GithubUser.repos(current_user)
     @follower_feeds = GithubUser.follower_feeds(current_user)

    # @user = GithubUser.find_by([sessions[:id])
  end

end
