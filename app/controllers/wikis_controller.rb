class WikisController < ApplicationController
  before_action :set_wiki, only: %i[ show update destroy ]

  # GET /wikis
  def index
    @wikis = Wiki.all

    render json: @wikis
  end

  # GET /wikis/1
  def show
    render json: @wiki
  end

  # POST /wikis
  def create
    @wiki = Wiki.new(wiki_params)

    if @wiki.save
      render json: @wiki, status: :created, location: @wiki
    else
      render json: @wiki.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wikis/1
  def update
    if @wiki.update(wiki_params)
      render json: @wiki
    else
      render json: @wiki.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wikis/1
  def destroy
    @wiki.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wiki_params
      params.require(:wiki).permit(:title, :content)
    end
end
