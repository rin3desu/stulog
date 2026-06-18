
# Stulog

## 概要

Stulog は、受験生の学習管理とモチベーション維持をサポートするWebアプリケーションです。
スタディサプリのような学習アプリをイメージしており、以下の機能を提供します：

- 教科ごとの学習記録と統計の可視化
- これまでに受けた模試の保存・振り返り
- 学習モチベーションを高める勉強系YouTube動画の表示

## デモ動画

https://www.youtube.com/watch?v=dIdrLAKlCy0

## 公開URL

https://stulog.onrender.com

## 使用技術

| 種別 | 技術 |
|------|------|
| フロントエンド | HTML, CSS, JavaScript |
| フレームワーク | Ruby on Rails |
| データベース | PostgreSQL（本番） / SQLite（開発） |
| インフラ | Render |

## ローカルでの使い方

```bash
git clone https://github.com/rin3desu/stulog.git
cd stulog
bundle install
rails db:migrate
rails server
```

ブラウザで http://localhost:3000 にアクセスしてください。

## 今後の改善予定

- 最新バージョンの Ruby on Rails での再実装
- UI/UX の改善
- YouTubeの動画を教科ごとに厳選
