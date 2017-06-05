class ApartmentFilter
  include ActiveModel::Model
  attr_accessor(
      :price_from,
      :price_to,
      :room_type,
      :occupancy,
      :start_from,
      :end_at
  )
  validates :start_from, presence: true, date: {after_or_equal_to: Proc.new {Date.today},
                                                message: "must be at least #{(Date.today).to_s}"}, on: :create
  validates :end_at, presence: true, date: {after_or_equal_to: :start_from}
  validates :price_from, numericality: {greater_than: 0}
  validates :price_to, numericality: {greater_than: 0}

  def request
    @apartments = Apartment.where(nil)
    if params[:price_from].present? && params[:price_to].present?
      @apartments = @apartments.price_range(params[:price_from], params[:price_to] )
    elsif params[:price_from].present?
      @apartments = @apartments.price_from(params[:price_from])
    elsif params[:price_to].present?
      @apartments = @apartments.price_to(params[:price_to])
    end
    @apartments = @apartments.room_type(params[:room_type]) if params[:room_type].present?
    @apartments = @apartments.occupancy(params[:occupancy]) if params[:occupancy].present?
    @apartments = @apartments.description(params[:description]) if params[:description].present?
  end

  private

  def price_from_not_greater_than_price_to
    return unless price_to < price_from
    errors.add :price_to, 'max price cannot be smaller than the min price'
  end


end
