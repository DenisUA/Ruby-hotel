class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_apartment, only: %i[show edit update destroy]

  def index
    @apartments = Apartment.all
  end

  def new
    @apartment = Apartment.new
    @apartment.photos.build
  end

  def edit; end

  def show; end

  def create
    @apartment = Apartment.new(apartment_params)
    respond_to do |format|
      if @apartment.save
        debugger
        params[:apartment][:photos_attributes]['photo'].each do |p|
          @photo = @apartment.photos.create!(photo: p, apartment_id: @apartment.id)
        end
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment }
        format.json { render json: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_path, notice: 'Apartment was successfully destroyed.' }
      format.json { head :ok }
    end
  end

private

  def apartment_params
    params
        .require(:apartment)
        .permit(:room_number, :status, :price, :description, :room_type, :occupancy, photos_attributes: [:photo, :id, :apartment_id ])
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
end
