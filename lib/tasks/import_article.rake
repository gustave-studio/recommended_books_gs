desc "Qiitaの記事をインポート"
task :import_article => :environment do
  #ログ
  logger = Logger.new 'log/import_article.log'

  #インポート
  UrlImporter.import("created:>=#{Date.today.days_ago(1).to_s} created:<=#{Date.today.to_s}")

  #デバッグのため
  p "ここまでOK"
end