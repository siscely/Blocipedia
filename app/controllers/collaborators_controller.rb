class CollaboratorsController < ApplicationController
  def index
    @users = User.all
    @wiki = Wiki.find(params[:wiki_id])
    @wiki.collaborators.new(user_id: params[:user_id])
  end

end
