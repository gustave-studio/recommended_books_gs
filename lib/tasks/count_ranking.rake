desc "Qiitaのランキング集計"
task :count_ranking => :environment do
  #ログ
  logger = Logger.new 'log/count_ranking.log'

  #ランキング集計
  RankingCounter.create_monthly_ranking
  RankingCounter.create_three_months_ranking
  RankingCounter.create_six_months_ranking

  #デバッグのため
  p "ランキング集計ここまでOK"
end