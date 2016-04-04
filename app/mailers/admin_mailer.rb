class AdminMailer < ApplicationMailer
  default to: "luise.rauch@gmail.com",
          from: 'notifications@example.com'

  def new_user_waiting_for_approval(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end
end
