
**Stulog**

**概要**

Stulog は、受験生の学習管理とモチベーション維持をサポートするWebアプリケーションです。
スタディサプリのような学習アプリをイメージしており、以下の機能を提供します：

・教科ごとの学習記録と統計の可視化

・これまでに受けた模試の保存・振り返り

・学習モチベーションを高める勉強系YouTube動画の表示

**デモ動画**
デモ動画があるのでそちらをご覧ください
https://www.youtube.com/watch?v=dIdrLAKlCy0

↑クリックするとデモ動画をご覧いただけます

**使用技術**

フロントエンド：HTML, CSS, JavaScript

フレームワーク：Ruby on Rails

データベース：SQLite

**使い方**

現在デプロイ最中であるため、ローカルでの使用を想定しています

以下のコマンドをコマンドプロンプト上に入力してください

git clone https://github.com/rin3desu/stulog.git

cd stulog

bundle install

rails db:migrate

rails server
ブラウザで以下にアクセスしてください：

http://localhost:3000

**今後の改善予定**
・最新バージョンの Ruby on Rails での再実装

・デプロイ（Heroku など）に再挑戦

・UI/UX の改善

・Youtubeの動画を教科ごとに厳選

