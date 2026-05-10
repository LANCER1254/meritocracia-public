# Viewer分類メモ
作成日: 2026-04-20

## 1. 公開候補（募集・外部共有に使える可能性が高い）
- viewer/official-site
- viewer/共有用
- viewer/character
- viewer/story
- viewer/map
- viewer/db（一部のみ精査前提）

## 2. 内部候補（制作・設計・進行管理向け）
- viewer/production
- viewer/memo
- viewer/knowledge
- viewer/tools
- viewer/data
- viewer/system

## 3. 除外・慎重確認候補
- viewer/アーカイブ
- viewer/story/old
- viewer/official-site/_backup
- viewer/production/files(15)
- files系
- old / backup / archive 系全般

## 4. 今回の方針
- 募集用viewの材料は、まず「公開候補」から選ぶ
- production / memo / archive は基本的にそのままAIへ渡さない
- db は必要箇所だけ抜粋する
- story は old を除いて確認する
- まずは official-site / 共有用 / character / story / map / db を重点監査対象とする

## 5. 次にやること
1. 公開候補フォルダだけ抜粋bundleを作る
2. その内容を見て、募集用に使えるページ・使えないページをさらに仕分ける
3. その後にAI投入用の公開資料セットを作る
