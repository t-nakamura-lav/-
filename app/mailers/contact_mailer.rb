class ContactMailer < ApplicationMailer
# mailがメール生成のためのメソッド
# to:で送信先のアドレス指定　環境変数を.envに定義
  def contact_mail(contact)
    @contact = contact
    mail to: ENV['MAIL'], subject: 'お問い合わせ内容'
  end

end
