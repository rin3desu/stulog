source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.6'
platforms :x86_64_linux, :x64_mingw32 do
end

# Railsのバージョン設定
gem 'rails', '~> 6.1.7', '>= 6.1.7.10'

# 使用するデータベースと関連gem
# 開発環境ではsqlite3を利用し、Production環境ではpg（PostgreSQL）を利用
gem 'pg', group: :production
gem 'sqlite3', group: :development

# アプリケーションサーバーやスタイルシートの設定
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'

# JavaScript関連の設定（webpackerまたはjsbundling-rails）
gem 'webpacker', '~> 5.0'  # 現在の設定を維持
# gem 'jsbundling-rails', '~> 1.0'  # jsbundling-railsに切り替える場合

# その他の機能追加
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bundler', '>= 2.6.6'

# 開発環境、テスト環境向けgem
group :development, :test do
  gem 'sqlite3'  # 開発環境ではsqlite3を利用
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

# 開発環境のみのgem
group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
end

# テスト環境のみのgem
group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
end

# Windows環境向けtzinfo-dataの対応
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# ユーザー認証にDeviseを使用
gem 'devise'

# 環境変数を管理
gem 'dotenv-rails'

# クラウドサービス関連
gem 'cloudinary'
gem 'activestorage-cloudinary-service'

# グラフ描画ライブラリ
gem 'chartkick'

# 本番環境用のpg設定
group :production do
  gem 'pg'
end
