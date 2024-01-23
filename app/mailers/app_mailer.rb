class AppMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.app_mailer.daily_levels.subject
  #
  include ApplicationHelper
  def daily_levels
    res = HTTParty.get("https://api.indx.co.il/reports/EoD_Levels?api_key=nf6p1695-6311-ru21-2956-v07cw202t4vy").body 
    csv = json2csv(res)
    File.open("tmp/indexes-levels.csv", 'w') { |file| file.write(csv) }
    res = HTTParty.get("https://api.indx.co.il/reports/Parameters_daily?api_key=nf6p1695-6311-ru21-2956-v07cw202t4vy").body 
    csv = json2csv(res)
    File.open("tmp/indexes-params.csv", 'w') { |file| file.write(csv) }             

    @greeting = "Hi"
    attachments["levels.csv"] = File.read("tmp/indexes-levels.csv")
    attachments["params.csv"] = File.read("tmp/indexes-params.csv")
    mail to: " SasiE@BDO.co.il ; YelenaT@BDO.co.il ; NitzanA@BDO.co.il ;MeravRah@BDO.co.il" , :subject => "קבצי אינדקסים יומיים"
  end

  
end
