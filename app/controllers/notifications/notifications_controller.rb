module Notifications
  class NotificationsController < Notifications::ApplicationController
    before_action :logged_in_user

    def index
      @notifications = notifications.includes(:actor).order('id desc').page(params[:page])

      unread_ids = @notifications.reject(&:read?).select(&:id)
      Notification.read!(unread_ids)

      @notification_groups = @notifications.group_by { |note| note.created_at.to_date }
    end

    def clean
      notifications.delete_all
      redirect_to notifications_path
    end

    private

    def notifications
      raise "You need reqiure user login for /notifications page." unless current_user
      Notification.where(user_id: current_user.id)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "用户需要进行登录!"
        redirect_to main_app.login_url
      end
    end
  end
end
