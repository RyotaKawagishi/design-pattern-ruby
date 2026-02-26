---
name: pattern-reviewer
description: Review a pattern directory against this repository's completion criteria in AGENTS.md, focusing on missing sections, missing quiz answers, and executable Ruby sample readiness.
---

# Pattern Reviewer

このスキルは、1パターン分が完了要件を満たすか確認するために使う。

## 使うタイミング
- 「このパターン完成してる？」と確認したいとき
- PR 前に要件漏れを点検するとき

## レビュー観点
1. `catalog/{pattern}/{pattern}.md`
   - `問題点 / 解決 / コード例 / メリット・デメリット` があるか
2. `catalog/{pattern}/{pattern}.rb`
   - 実行可能か（最低限、文法エラーがないか）
3. `catalog/{pattern}/quiz.md`
   - 一問一答が 10 問程度あるか
   - 自分の回答が記録されているか
4. 参考文献
   - 必要に応じて `docs/references.md` と `pattern.md` が整合しているか

## 出力形式
- 指摘を重要度順に列挙する
- ファイルパスと行番号を付ける
- 指摘がなければ「要件上は完了」と明記する

