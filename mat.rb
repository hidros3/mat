require 'csv'

rawdata = []
CSV.foreach("publisherandmatchypte_raw.csv", headers: true) do |row|
  row['publisher'] =
    case row['publisher.name']
    when /Daum/ then 'daum'
    when /Kakao/ then 'kakao'
    when /Cauly/ then 'cauly'
    when /SnD/ then 'snd'
    when /Adbay/ then 'adbay'
    when /Lette/ then 'lattescreen'
    when /Google/ then 'google'
    when /Coupang/ then 'coupang'
    when /Naver/ then 'naver'
    when /Band/ then 'band'
    when /Facebook/ then 'facebook'
    when /Cashslide/ then 'cashslide'
    else 'etc'
    end
  rawdata << row
end

CSV.open("processed_data.csv", 'w') do |output|
  rawdata.each { |row| output << row }
end
