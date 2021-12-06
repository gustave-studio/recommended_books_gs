desc "Qiitaの記事をインポート"
task :import_article => :environment do
  #ログ
  logger = Logger.new 'log/import_article.log'

  #インポート
  UrlImporter.import

  #デバッグのため
  p "ここまでOK"
end