class ApplicationMailer < ActionMailer::Base
  # 問い合わせ内容がこのアドレスから送られてくる
  default from: 'yuru-work@gmail.com'
  layout 'mailer'
end
