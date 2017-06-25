require 'sidekiq-scheduler'

class StatusesUpdateWorker
  include Sidekiq::Worker

  def perform
    Order.find_each do |order|
      unless order.cancelled?
        if order.start_from == Date.today && !order.in_progress?
          order.in_progress!
          order.apartment.booked!
        elsif order.start_from > Date.today && !order.booked?
          order.booked!
        elsif order.end_at == Date.today
          order.expired!
          order.apartment.available!
        end
      end
    end
  end
end
