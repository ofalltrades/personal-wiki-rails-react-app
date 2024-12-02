class WikisController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wiki, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /wikis
  def index
    @wikis = Wiki.all
    render json: @wikis
  end

  # GET /wikis/1
  def show
    @wiki = Wiki.find(params[:id])
    render json: @wiki
  end

  # POST /wikis
  def create
    @wiki = current_user.wikis.build(wiki_params)

    if @wiki.save
      render json: @wiki, status: :created, location: @wiki
    else
      render json: @wiki.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wikis/1
  def update
    @wiki = Wiki.find(params[:id])

    if @wiki.update(wiki_params)
      render json: @wiki, status: :ok
    else
      render json: @wiki.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wikis/1
  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy
    head :no_content
  end

  private
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    def wiki_params
      params.require(:wiki).permit(:title, :content, :user_id)
    end
end
