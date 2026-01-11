-- 25個のアプリアイデアをmemosテーブルにインポート

-- お金管理系
INSERT INTO memos (title, content) VALUES 
('3秒家計簿', '【概要】
金額入力だけ、今月の合計表示。カテゴリなし、超シンプル。

【機能】
- 金額入力フォーム1つだけ
- 今月の合計表示
- 簡単なグラフ

【技術】
- PHP + MySQL
- 開発期間: 1日

【競合】
マネーフォワード、Zaimは複雑すぎる

【差別化】
「3秒」で記録完了することに特化');

INSERT INTO memos (title, content) VALUES 
('サブスク解約リマインダー', '【概要】
Netflix、Spotify、Adobe等のサブスク管理。無料期間終了前に通知。

【機能】
- サブスク登録（名前、金額、更新日）
- 無料期間終了2日前に通知
- 解約リンク自動表示
- 年間節約額表示

【技術】
- PHP + MySQL
- メール通知 or Push通知
- 開発期間: 1週間

【差別化】
「解約」に特化（家計簿アプリは管理だけ）');

INSERT INTO memos (title, content) VALUES 
('ポイント期限アラート', '【概要】
楽天ポイント、Tポイント等の有効期限管理。

【機能】
- ポイント登録（種類、残高、期限）
- 期限前に通知
- 失効予定ポイント表示

【技術】
- PHP + MySQL
- 通知機能
- 開発期間: 1週間');

-- 食事・栄養管理系
INSERT INTO memos (title, content) VALUES 
('カロリー計算アプリ', '【概要】
BMR、TDEE、目標カロリーを計算。PFCバランス表示。

【機能】
- 基礎代謝量（BMR）計算
- 総消費カロリー（TDEE）計算
- 目標別カロリー（減量・維持・増量）
- PFCバランス推奨値

【技術】
- PHP 8.4
- ハリス・ベネディクト方程式
- 開発期間: 1日

【ステータス】
✅ 完成済み');

INSERT INTO memos (title, content) VALUES 
('シンプルPFC記録', '【概要】
タンパク質・脂質・炭水化物の記録に特化。MyFitnessPalのシンプル版。

【機能】
- 目標PFC設定（カロリー計算から自動）
- 食品プリセット（鶏胸肉、白米など）
- 今日の残りPFC表示
- 1週間のグラフ

【技術】
- PHP + MySQL
- 食品データベース（自前）
- 開発期間: 1-2週間

【差別化】
MyFitnessPalより圧倒的にシンプル。「PFC記録」だけに特化。

【収益化】
月額300円（グラフ、写真記録、データエクスポート）');

INSERT INTO memos (title, content) VALUES 
('冷蔵庫賞味期限アラート', '【概要】
食品の賞味期限を管理。期限前に通知。

【機能】
- 食品写真撮影
- 賞味期限入力（手動 or OCR）
- 期限3日前に通知
- 使い切りレシピ提案

【技術】
- PHP + MySQL
- OCR（Tesseract or Google Vision API）
- 開発期間: 1-2週間

【課題】
OCR精度、継続利用の工夫');

-- 健康・フィットネス系
INSERT INTO memos (title, content) VALUES 
('シンプル筋トレ記録', '【概要】
「今日筋トレした？」だけを記録。継続日数カウント。

【機能】
- 「今日筋トレした？」Yes/No
- 継続日数カウント
- 週間グラフ

【技術】
- PHP + MySQL
- 開発期間: 半日

【差別化】
Strong、FitNotesは複雑すぎる。シンプルに継続だけを記録。');

INSERT INTO memos (title, content) VALUES 
('ワンタップ睡眠記録', '【概要】
「おやすみ」「おはよう」ボタンで睡眠時間を記録。

【機能】
- 寝る時: 「おやすみ」ボタン
- 起きた時: 「おはよう」ボタン
- 睡眠時間自動計算
- 1週間グラフ

【技術】
- PHP + MySQL
- 開発期間: 1週間

【競合】
Sleep Cycle、AutoSleepは複雑すぎる');

INSERT INTO memos (title, content) VALUES 
('フィットネスフォームチェッカー（AI）', '【概要】
動画撮影でフォーム分析。AIで姿勢をチェック。

【機能】
- スクワット、デッドリフト等の動画撮影
- AIで姿勢・フォーム分析
- 改善点をフィードバック

【技術】
- Python + TensorFlow or MediaPipe
- 姿勢推定AI
- 開発期間: 2-3週間

【難易度】
高い（AI実装が必要）');

INSERT INTO memos (title, content) VALUES 
('体脂肪率推定（写真から）', '【概要】
写真アップロードでAIが体脂肪率を推定。

【機能】
- 前面・側面の写真撮影
- AI推定（体脂肪率）
- 変化の追跡

【技術】
- Python + 機械学習モデル
- 開発期間: 3週間以上

【難易度】
高い（AIモデル構築）');

-- 地図・場所検索系
INSERT INTO memos (title, content) VALUES 
('犬OKマップ', '【概要】
犬連れ可の施設を地図で検索。カフェ、レストラン、公園、ドッグラン等。

【機能】
- 地図表示（Leaflet.js）
- カテゴリフィルター（カフェ、公園等）
- サイズ別フィルター（小型犬・中型犬・大型犬）
- ルール表示（店内OK、テラスのみ等）
- ユーザー投稿機能

【技術】
- PHP + MySQL
- Google Places API（基本情報）
- Leaflet.js（地図）
- 開発期間: 2週間

【競合】
わんことCafe（1,324件、2021年）、itsumo dog（909件）、イヌトミィ（1,300件以上）

【差別化案】
- 大型犬専用マップ
- 東京23区完全網羅版
- 屋内OK限定版');

INSERT INTO memos (title, content) VALUES 
('空いてるカフェマップ', '【概要】
リアルタイム混雑度を表示。空いてるカフェを地図で探せる。

【機能】
- 地図表示（混雑度別に色分け）
- 混雑度フィルター
- 作業しやすさフィルター（電源、Wi-Fi、静かさ）
- 狙い目時間帯表示
- ユーザー投稿（混雑度報告）

【技術】
- PHP + MySQL
- Google Places API（基本情報）
- ユーザー投稿データ
- 開発期間: 2週間以上

【ステータス】
⚠️ 保留中

【課題】
- Google APIで混雑度データが取れない
- スクレイピングはグレーゾーン
- ユーザー投稿のみだとコールドスタート問題');

INSERT INTO memos (title, content) VALUES 
('近所の24時間営業店マップ', '【概要】
深夜営業の店だけを表示。コンビニ、ドラッグストア、ジム等。

【機能】
- 現在地から24時間営業店を表示
- カテゴリフィルター
- 距離順ソート

【技術】
- PHP + MySQL
- Google Places API
- 営業時間データ
- 開発期間: 1週間

【差別化】
「24時間」だけに絞る');

INSERT INTO memos (title, content) VALUES 
('支払い方法検索マップ', '【概要】
PayPay、クレカ、現金等で店舗を検索。

【機能】
- 地図表示
- 支払い方法フィルター（PayPay、クレカ、現金、電子マネー等）
- レストラン・カフェ検索

【技術】
- PHP + MySQL
- Google Places API（paymentOptions フィールド）
- 開発期間: 2週間

【課題】
Google Places APIの paymentOptions は Enterprise SKU（高額）

【コスト試算（月間1万リクエスト）】
- Nearby Search: 5,000回 × $32/1000 = $160
- Place Details: 5,000回 × $17/1000 = $85
- 合計: $245/月

【差別化】
Googleマップには支払い方法フィルターがない');

-- カフェ・コーヒー系
INSERT INTO memos (title, content) VALUES 
('コーヒー抽出タイマーアプリ', '【概要】
V60、Kalita、Kono等の抽出方法別にタイマーとガイドを提供。

【機能】
- 抽出方法選択（V60、Kalita、Kono、Melitta等）
- ステップバイステップガイド
- タイマー機能
- 音声・バイブ通知
- カスタムレシピ保存
- 豆の記録（豆の種類、抽出方法、味の感想）

【技術】
- PHP + MySQL
- JavaScript タイマー
- PWA（オフライン対応）
- Web Notification API
- 開発期間: 1週間

【差別化】
一般的なキッチンタイマーより専門的。初心者向けガイド付き。');

-- 生活便利系
INSERT INTO memos (title, content) VALUES 
('図書館本返却リマインダー', '【概要】
借りた本の返却日を管理。返却日前に通知。

【機能】
- 借りた本の登録（タイトル、返却日）
- 返却日2日前に通知
- 返却済みチェック

【技術】
- PHP + MySQL
- 通知機能
- 開発期間: 3日');

INSERT INTO memos (title, content) VALUES 
('植物水やりスケジュール', '【概要】
植物ごとに水やり頻度を設定。リマインダー通知。

【機能】
- 植物登録（名前、写真、水やり頻度）
- 水やりリマインダー
- 水やり記録
- 成長記録（写真）

【技術】
- PHP + MySQL
- 通知機能
- 開発期間: 1週間');

INSERT INTO memos (title, content) VALUES 
('薬の飲み忘れ防止', '【概要】
薬の写真を登録。毎日決まった時間に通知。

【機能】
- 薬の写真登録
- 服用時間設定
- 毎日通知
- 「飲んだ」ボタン
- 服用履歴

【技術】
- PHP + MySQL
- 通知機能
- 開発期間: 1週間

【差別化】
既存アプリは複雑すぎる。超シンプル版。');

INSERT INTO memos (title, content) VALUES 
('Wi-Fi QRコード生成', '【概要】
SSID + パスワード入力でQRコード自動生成。ゲスト用Wi-Fi共有。

【機能】
- SSID、パスワード、暗号化方式入力
- QRコード自動生成
- 印刷用PDF出力
- 複数Wi-Fi管理

【技術】
- PHP
- QRコードライブラリ（endroid/qr-code）
- 開発期間: 1時間

【フォーマット】
WIFI:T:WPA;S:MyHomeWiFi;P:mypassword123;;

【活用方法】
- カフェ・レストラン向けツール
- 民泊・Airbnb向けツール

【課題】
単体アプリとしては弱い（1回作って終わり）');

INSERT INTO memos (title, content) VALUES 
('医薬品・サプリ在庫管理', '【概要】
薬・サプリメントの在庫を管理。補充時期に通知。

【機能】
- 医薬品・サプリ登録（名前、残量、1日の使用量）
- 残量自動計算
- 補充時期通知
- 購入履歴

【技術】
- PHP + MySQL
- 開発期間: 1週間');

-- 高齢者・家族向け
INSERT INTO memos (title, content) VALUES 
('高齢親見守りアプリ', '【概要】
高齢の親の見守り。日次チェックイン、SOSボタン。

【機能】
- 日次チェックインボタン（「今日も元気」）
- SOSボタン
- 活動記録（歩数、睡眠等）
- 家族への通知

【技術】
- PHP + MySQL
- スマホアプリ（PWA or ネイティブ）
- 通知機能
- 開発期間: 2週間');

-- 趣味・エンタメ系
INSERT INTO memos (title, content) VALUES 
('推しイベント集約アプリ', '【概要】
お気に入りアーティスト・配信者のイベントを一覧表示。

【機能】
- アーティスト・配信者登録
- イベント・ライブ・配信スケジュール自動取得
- カレンダー表示
- リマインダー通知

【技術】
- PHP + MySQL
- 各種API（YouTube、Twitter等）
- 開発期間: 2週間

【課題】
データ取得方法（API or スクレイピング）');

-- タスク管理系
INSERT INTO memos (title, content) VALUES 
('ミニマムTODO', '【概要】
1日5個まで。本当に重要なことに集中。

【機能】
- 1日のTODO 5個まで（それ以上追加不可）
- 完了したら消える
- 翌日自動リセット

【技術】
- PHP + MySQL
- 開発期間: 1日

【差別化】
Notion、Todoist、Any.doは複雑すぎる。
「制約」がコンセプト。');

INSERT INTO memos (title, content) VALUES 
('シンプル読書記録', '【概要】
タイトルだけ入力。今年何冊読んだかを表示。

【機能】
- 本のタイトルだけ入力
- 読了日自動記録
- 「今年○冊読んだ」表示
- レビュー・評価なし

【技術】
- PHP + MySQL
- 開発期間: 半日

【差別化】
読書メーター、Goodreadsは複雑すぎる。
記録だけに特化。');

-- 複雑アプリのシンプル版
INSERT INTO memos (title, content) VALUES 
('Notionシンプル版（メモだけ）', '【概要】
Notionの「メモ機能」だけを抽出。

【機能】
- Markdownメモ
- 検索機能
- フォルダ分類（シンプル）

【技術】
- PHP + MySQL
- Markdown エディタ
- 開発期間: 1週間

【差別化】
Notionは機能が多すぎて初心者が挫折。メモだけに特化。');

INSERT INTO memos (title, content) VALUES 
('Evernoteシンプル版', '【概要】
Evernoteの「メモ + 検索」だけに特化。

【機能】
- Markdownメモ
- 全文検索
- タグなし、ノートブックなし

【技術】
- PHP + MySQL
- 全文検索（MySQL FULLTEXT or Elasticsearch）
- 開発期間: 1週間');

INSERT INTO memos (title, content) VALUES 
('Asanaシンプル版（個人用TODO）', '【概要】
Asanaの個人向けシンプル版。

【機能】
- タスク追加
- 完了チェック
- 期限設定
- それだけ

【技術】
- PHP + MySQL
- 開発期間: 1日

【差別化】
Asanaはプロジェクト管理機能が過多。個人用TODOに特化。');
