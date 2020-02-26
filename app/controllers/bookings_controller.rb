class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @user = current_user
    @path = ''
  end
end
