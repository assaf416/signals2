module ApplicationHelper



  def format_number(value, leading_digits, trailing_digits)
    # Ensure the input is a number
    unless value.is_a?(Numeric)
      raise ArgumentError, "value must be a numeric type"
    end
  
    # Round the number to the specified number of decimal places
    formatted_number = sprintf("%.#{trailing_digits}f", value)
  
    # Split the number into integer and decimal parts
    integer_part, decimal_part = formatted_number.split('.')
  
    # Add leading digits if necessary
    leading_zeros = '0' * [0, leading_digits - integer_part.length].max
    formatted_number = "#{leading_zeros}#{integer_part}.#{decimal_part}"
  
    return formatted_number.gsub(".","")
  end
  


  def nis_field(number)
    begin
      "#{number_with_delimiter(number)} שח "
    rescue => exception
      number
    end
  end

  def sample_password
    "Aa12345"
  end

  def ils_field(number)
    begin
      "#{number_with_delimiter(number.round(2))} שח "
    rescue => exception
      number
    end
  end

  def date_field_tag(d)
    begin
      return d.strftime("%Y-%m-%d")
    rescue => exception
      return d
    end
  end

  def date_field(d)
    begin
      return d.strftime("%Y-%m-%d")
    rescue => exception
      return d
    end
  end

  def time_field(d)
    begin
      return d.strftime("%H:%M")
    rescue => exception
      return d
    end
  end

  def date_time_field(d)
    begin
      return d.strftime("%Y-%m-%d %H:%M")
    rescue => exception
      return
    end
  end

  def json2csv(json_string)
    csv = ""
    jv = JSON.parse(json_string)
    list = jv["rows"]
    csv << list.first.keys.to_s.gsub("[","").gsub("]","").gsub("\"","")
    csv << "\n"
    for i in list do 
      csv << i.values.to_s.gsub("[","").gsub("]","").gsub("\"","")
      csv << "\n"
    end 
    csv
  end 

  def star_field(value)
    output = ""
    if (1..5).include?(value.to_i)
      value.to_i.times { output += "<i class='fa fa-star'></i>" }
    end
    output.html_safe
  end

  def fake_name
    first = "דוד משה שושנה לימור אלון   עמית ויקי שלמה ענת סמדר נטשה נטע רמי דני יגאל מוטי נחמה אורן איציק שלומי ישראל ליאור ליאורה אביבית אביב אור אורי אוריאל ".split(" ").sample(1)[0]
    last = "הכהן כהן לוי יששכר גבאי איבגי מועלם כספית כספי אורבך דניאלוב נחימוב גולדשויין דיין ".split(" ").sample(1)[0]
    "#{first} #{last}"
  end

  def fake_last_name
    last = "הכהן כהן לוי יששכר גבאי איבגי מועלם כספית כספי אורבך דניאלוב נחימוב גולדשויין דיין לוינסקי מועלם שלום כהנא אביבי מור צחנובר סלע  ".split(" ").sample(1)[0]
  end

  def fake_first_name
    first = "דוד משה שושנה לימור אלון   עמית ויקי שלמה ענת סמדר נטשה נטע רמי דני יגאל מוטי נחמה אורן איציק שלומי ישראל ליאור ליאורה אביבית אביב אור אורי אוריאל ".split(" ").sample(1)[0]
  end

  MOBILE_USER_AGENTS = "palm|blackberry|nokia|phone|midp|mobi|symbian|chtml|ericsson|minimo|" +
                       "audiovox|motorola|samsung|telit|upg1|windows ce|ucweb|astel|plucker|" +
                       "x320|x240|j2me|sgh|portable|sprint|docomo|kddi|softbank|android|mmp|" +
                       'pdxgw|netfront|xiino|vodafone|portalmmm|sagem|mot-|sie-|ipod|up\\.b|' +
                       "webos|amoi|novarra|cdm|alcatel|pocket|iphone|mobileexplorer|mobile"

  def mobile?(request)
    agent_str = request.user_agent.to_s.downcase
    return false if agent_str =~ /ipad/
    agent_str =~ Regexp.new(MOBILE_USER_AGENTS)
  end

  def device(request)
    agent = request.user_agent
    return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return "mobile" if agent =~ /Mobile/
    return "desktop"
  end

  def lorem(words)
    str =
      "
 אנא היום בשפות לערכים אם, המזנון ומהימנה בה מתן. רוסית קישורים אספרנטו דת קרן, רקטות לרפובליקה גם סדר, על מונחים פיסיקה התפתחות זכר. שכל עמוד כלכלה תקשורת דת, בה לראות המזנון הנאמנים רבה. בדפים מחליטה תאולוגיה ארץ על, דת המלצת אירועים ארץ. או עזה נבחרים לויקיפדים. על שנתי פסיכולוגיה עזה, בה אספרנטו תיאטרון כתב.
דת קרן החברה שינויים האנציקלופדיה, גרמנית לטיפול גיאוגרפיה אל בדף. אחר ערכים מבוקשים בה, זאת או הראשי אספרנטו רב־לשוני, מלא מה הבקשה מרצועת. שתפו כלכלה לערכים אחר את, מאמר הנדסת אחר ב, בדף של המלחמה לאחרונה. מיזם ישראל אנתרופולוגיה בה כלל. תוכל רשימות לעריכה על בדף, אחד לציין אירועים גם. החול פוליטיקה טכנולוגיה לוח בה, כדור לימודים כתב בה.
דת והוא ראשי רשימות אנא, מועמדים והגולשים אחד את. גם יוצרים והגולשים אחד, מלא אל מונחים ספרדית למאמרים. בה אקראי מרצועת נוסחאות בקר, מדע עזרה כלכלה ב, ארץ אל היום הקנאים. כתב על עזרה קלאסיים. שימושי נוסחאות זאת על, גם זקוק ננקטת הסביבה שתי.
דת שמו החלל אחרות פיסיקה, בה אחר הרוח אקטואליה לרפובליקה. של צט היום זקוק ייִדיש, עוד אם דפים לערכים עקרונות. ב לויקיפדיה לויקיפדים ויש. כלל או פיסול קרימינולוגיה, אנא או פנאי בשפות מבוקשים. ב ישראל תרומה היסטוריה שמו, תנך אל הרוח המקושרים. תנך ישראל בידור בהשחתה על.
מדע הבאים לעריכה אל, אל אנא זקוק פיסיקה. ב בקר הבקשה הגרפים, עוד את עסקים לראות. אם שינויים הגולשות ארכיאולוגיה צט. רומנית תקשורת חבריכם אתה ב, כלל להפוך לטיפול הקהילה אם. דת לראות קודמות שימושי ארץ, תנך אם עיצוב ופיתוחה מונחונים.
אנא מה נפלו בקלות. למנוע בעברית כתב מה, רבה קולנוע טכניים אם, מתוך כלכלה בקר בה. קרן בכפוף אנגלית דת, גם צעד יוני אגרונומיה. עמוד זכויות ביוטכנולוגיה תנך את, זאת אם דרכה ויקימדיה פסיכולוגיה, כלליים ביוטכנולוגיה ב עזה. אחד אל כניסה התוכן, על הרוח אחרים לעברית קרן. מה מלא ריקוד קולנוע והגולשים. שמות מדינות את אתה, מפתח רוסית מה מלא.
היום יוני בקרבת ארץ ב. מדע ומהימנה לימודים תאולוגיה על. את אחרות לחשבון וכמקובל תנך, אנא ב יידיש ביוני למחיקה, חינוך המקובל אקטואליה על מתן. צט היום והגולשים גיאוגרפיה אל. על אתה זקוק תקשורת, אחר גם קישורים וספציפיים, זאת ב ותשובות ואלקטרוניקה. מדעי לעריכת על שכל, בה שונה תיקונים פילוסופיה סדר.
לוח ביולי טכניים נוסחאות דת, לשון ותשובות או כתב. בקר של בחירות ותשובות, גם רפואה ליצירתה טכנולוגיה שער, תוכל לאחרונה דת אתה. אל המחשב רומנית קרן, בהבנה למחיקה אם אחר, צעד שונה תורת מה. לערך משפטים לעריכת של זכר, ב בדפים לערכים ארכיאולוגיה כלל.
אחר שתפו ליום ותשובות אם. אתה את ניהול ביולי, ב רבה ראשי הנדסת ממונרכיה, אחד המחשב הגרפים וכמקובל בה. ניהול בדפים רשימות חפש על, כדי מרצועת הקהילה אל, של הטבע בארגז מדע. ליום ובמתן רשימות או סדר, החברה לאחרונה או כתב.
מפתח אדריכלות מה אנא, שתי לשון בשפה מיתולוגיה על, כלכלה הספרות תבניות גם אחד. העמוד בהתייחסות גם עזה. צט ראשי עיצוב לויקיפדים את, לימודים תאולוגיה בה כלל. ב קסאם קודמות מרצועת זכר, עזרה בהיסטוריה או בדף. תבניות ויקיפדיה האנציקלופדיה או קרן. אחד אל רוסית חרטומים.
    "
    list = str.split(" ").sample(words)
    s = ""; list.each { |i| s = s + i + " " }
    s
  end
end
