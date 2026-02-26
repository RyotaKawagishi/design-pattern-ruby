---
name: references-curator
description: Curate docs/references.md by normalizing format, removing duplicates, and preserving the project's policy that the design-pattern section is the highest-trust source.
---

# References Curator

このスキルは、参考文献管理を整えるために使う。

## 使うタイミング
- 参考文献を追加したとき
- 形式のゆれや重複を直したいとき

## 実施手順
1. `docs/references.md` を読み、現行方針を確認する。
2. 追加文献を以下の区分へ配置する。
   - `### デザインパターン`（最優先）
   - `### 学習補助（Qiita, Zenn, その他）`
3. 表記を統一する（タイトル行 + URL 行）。
4. 重複 URL と重複タイトルを整理する。
5. 方針文を維持する。
   - `## デザインパターン` を最も信頼する
   - その他は学習補助

## 完了チェック
- 情報源の優先順位が崩れていない
- 追加文献がどこに置かれたか明確

