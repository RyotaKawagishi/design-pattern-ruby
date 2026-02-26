---
name: quiz-generator
description: Generate about 10 short Q&A questions for catalog/{pattern}/quiz.md from the pattern's markdown and Ruby implementation so the learner can self-answer.
---

# Quiz Generator

このスキルは、`pattern.md` と `pattern.rb` を元に `quiz.md` の問題を作る。

## 使うタイミング
- 実装後の理解確認を作りたいとき
- 問題を追加・刷新したいとき

## 実施手順
1. `catalog/{pattern}/{pattern}.md` を読む。
2. `catalog/{pattern}/{pattern}.rb` を読む。
3. 以下バランスで 10 問程度の一問一答を作る。
   - 概念理解（目的、適用場面）
   - 設計理解（責務分離、依存関係）
   - 実装理解（今回コードの読み取り）
   - 比較（似たパターンとの違い）
4. `### 自分の回答` 欄を残した形で `quiz.md` を更新する。

## 注意
- 回答そのものは埋めない（学習者が記入する）
- 問題文は短く、1問1意図にする

