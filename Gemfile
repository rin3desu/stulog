source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.6'

# Rails本体
gem 'rails', '~> 6.1.7', '>= 6.1.7.10'

# データベース
gem 'pg', group: :production
gem 'sqlite3', '~> 1.4', group: [:development, :test]

# アプリケーションサーバーやスタイルシート
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'

# JavaScript管理
gem 'webpacker', '~> 5.0'  # Rails 6 で使用

# その他機能
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', require: false

# ユーザー認証
gem 'devise'

# 環境変数管理（開発・テストのみ）
group :development, :test do
  gem 'dotenv-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

# 開発環境のみ
group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
end

# テスト環境のみ
group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
end

# Windows 環境向け
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# クラウドサービス関連
gem 'cloudinary'
gem 'activestorage-cloudinary-service'

# グラフ描画
gem 'chartkick'
