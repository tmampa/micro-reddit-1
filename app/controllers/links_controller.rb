class LinksController < ApplicationController
  # before_action :set_link, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /links or /links.json
  def index
    @links = Link.all
  end

  # GET /links/1 or /links/1.json
  def show
    @link = Link.find(params[:id])
  end

  # GET /links/new
  def new
    @link = current_user.links.build
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links or /links.json
  def create
    @link = current_user.links.build(link_params)
    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1 or /links/1.json
  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      redirect_to @link
    else
      render :edit
    end
  end

  # DELETE /links/1 or /links/1.json

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
