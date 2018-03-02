class NotificationsController < ApplicationController
  before_action :logged_in_user
  before_action :set_notifications, only: [:index, :read]

  def index
    notifiable_id = current_user.notifications.pluck(:notifiable_id)
    @comments = Comment.find(notifiable_id)
    @dates = @comments.pluck(:created_at).map{ |date| date.strftime("%Y-%m-%d") }.uniq
  end
  
  def read
    @notifications.each do |notification|
      notification.update_attribute(:read_at, Time.zone.now)
    end
    redirect_to notifications_path
  end
  
  def remove
    @notifications = Notification.where(recipient: current_user)
    @notifications.destroy_all
    respond_to do |format| 
      format.html { redirect_to notifications_path }
      format.js
    end
  end

  private
    def set_notifications
      @notifications = Notification.where(recipient: current_user).unread
    end
end
