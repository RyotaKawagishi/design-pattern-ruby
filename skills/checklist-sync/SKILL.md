---
name: checklist-sync
description: Sync docs/design-pattern-checklist.md with actual directories under catalog/ and mark progress based on presence of pattern.md, pattern.rb, and quiz.md.
---

# Checklist Sync

このスキルは、チェックリスト進捗と `catalog/` の実体を合わせるために使う。

## 使うタイミング
- 新しいパターンを追加した後
- 学習進捗を更新したいとき

## 実施手順
1. `docs/design-pattern-checklist.md` を読む。
2. `catalog/` 配下のパターンディレクトリを列挙する。
3. 各パターンで以下存在を確認する。
   - `{pattern}.md`
   - `{pattern}.rb`
   - `quiz.md`
4. 進捗ルールに従ってチェックを更新する。
   - 3点そろっていれば完了候補
   - 欠けがあれば未完了
5. 不一致があれば、差分を箇条書きで報告する。

## 注意
- GoF 23 の一覧自体は勝手に改変しない
- 進捗更新と一覧定義の更新は分けて扱う

