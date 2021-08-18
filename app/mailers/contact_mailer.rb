class ContactMailer < ApplicationMailer
# mailがメール生成のためのメソッド
# to:で送信先のアドレス指定　環境変数化
  def contact_mail(contact)
    @contact = contact
    mail to: '自分の@gmail.com', subject: 'お問い合わせ内容'
  end

end
