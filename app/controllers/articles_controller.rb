class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
   

    if query_param.present?

      query = params[:query]
      latest_search = Search.order(created_at: :desc).first
  
      if query.length > 3
        if latest_search && query.start_with?(latest_search.query)
          # Update the existing latest search record
          latest_search.update(query: query)
        else
          # Create a new search record
          Search.create(query: query,user: current_user)
        end
      end
      @articles = Article.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @articles = Article.all
    end
  
  
  end

  # GET /articles/1 or /articles/1.json
  def show
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.fetch(:article, {})
    end

   def query_param
    params[:query]&.strip
   end

   def save_search
    Search.create(query: query_param, user: current_user)   
  end


  def valid_search?
    return true if recent_search.blank?
    query_param_length = query_param.to_s.length
    !recent_search.query.include?(query_param) || recent_search.query.length < query_param_length
   
  end
end
