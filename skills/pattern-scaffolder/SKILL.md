---
name: pattern-scaffolder
description: Create a new design-pattern learning scaffold in this repository by generating catalog/{pattern}/{pattern}.md, catalog/{pattern}/{pattern}.rb, and catalog/{pattern}/quiz.md from the project conventions.
---

# Pattern Scaffolder

このスキルは、新しいパターン学習ディレクトリを最短で作るために使う。

## 使うタイミング
- 「新しいパターンの雛形を作って」と依頼されたとき
- `catalog/{pattern}/` 一式を作るとき

## 実施手順
1. パターン名を確認し、ディレクトリ名を決める（例: `factory-method`）。
2. `catalog/{pattern}/` を作成する。
3. 以下 3 ファイルを作る。
   - `{pattern}.md`
   - `{pattern}.rb`
   - `quiz.md`
4. `{pattern}.md` には以下見出しを含める。
   - `# 基本情報`
   - `# カタログ`
   - `## 問題点`
   - `## 解決`
   - `## コード例`
   - `## メリット・デメリット`
   - `# メモ`
5. `quiz.md` は 10 問分の一問一答テンプレートを入れる。

## 完了チェック
- `catalog/README.md` の構成と一致している
- `AGENTS.md` の完了条件に必要な 3 ファイルが存在する

