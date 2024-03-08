class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    pull_articles if Article.all.empty?
    if params[:ur]
      to_mark = params[:ur]
      mark_unread(to_mark)
    end
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
    @article.read_status = true
    @article.save
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def pull_articles
    url = "https://rss.slashdot.org/Slashdot/slashdotMain"
    feed = RSS::Parser.parse(url)
    feed.items.each do |art|

      art_params = {
        title: art.title,
        description: art.description,
        author: art.dc_creator,
        read_status: false,
        link: art.link,
        publish_date: art.dc_date.to_date
      }

      @article = Article.new(art_params)
      @article.save
    end
    puts "#{Article.all.count} articles in db"
  end

  def mark_unread(id)
    if Article.exists?(id.to_i)
      @article = Article.find(id.to_i)
      @article.read_status = false
      @article.save
      puts "Article #{@article.id} marked as unread"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description, :publish_date, :link, :author, :read_status)
    end
end
