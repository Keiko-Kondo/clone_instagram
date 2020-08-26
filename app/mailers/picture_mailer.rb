class PictureMailer < ApplicationMailer
  def picture_mail(picture)
     @picture = picture
     mail to: "keiko.ayaka@icloud.com", subject: "投稿確認メール"
   end
end
