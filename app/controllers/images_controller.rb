require 'colorize'

class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create

    if !image_params[:file].nil?
      file_type = ".#{image_params[:file].content_type.split('/')[1]}"
      file_name = "#{SecureRandom.urlsafe_base64}#{file_type}"

      image_params[:file].original_filename = file_name
      @image = Image.new(name: image_params[:name],
                         description: image_params[:description],
                         file: image_params[:file])

      if @image.save
        File.open(Rails.root.join('public/images', file_name), 'wb') do |file|
          file.write(image_params[:file].read)
        end

        flash[:notice] = "Image was successfully uploaded."
        redirect_to @image
      else
        render :new
      end
    else
      redirect_to new_image_path
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :description, :file)
    end
end
