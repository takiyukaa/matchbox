class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @user = current_user
    @path = ''
  end

  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
    authorize @booking
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @user = @booking.skill.user
    if @booking.save
      redirect_to user_booking_path(@user, @booking)
      authorize @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @user = @booking.skill.user
     authorize @booking
  end

  def booking_params
    params.require(:booking)
          .permit(:date,
                  :start_time,
                  :end_time,
                  :user_comment,
                  :skill_id)
  end
end
