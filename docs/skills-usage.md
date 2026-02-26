# スキル利用ガイド

このプロジェクトで使うローカルスキルの一覧です。  
スキル本体は `skills/` 配下にあります。

## 利用可能スキル

### pattern-scaffolder
- 場所: `skills/pattern-scaffolder/SKILL.md`
- 用途: 新しい `catalog/{pattern}/` の雛形作成
- 依頼例: 「`factory-method` の雛形を作成して」

### quiz-generator
- 場所: `skills/quiz-generator/SKILL.md`
- 用途: `pattern.md` と `pattern.rb` からクイズ10問を生成
- 依頼例: 「`factory-method` の `quiz.md` を作成して」

### pattern-reviewer
- 場所: `skills/pattern-reviewer/SKILL.md`
- 用途: 完了要件レビュー（見出し不足、クイズ不足、実行性）
- 依頼例: 「`factory-method` を完了要件でレビューして」

### references-curator
- 場所: `skills/references-curator/SKILL.md`
- 用途: `docs/references.md` の整形・重複整理・優先度維持
- 依頼例: 「このURLを参考文献に追加して整形して」

### checklist-sync
- 場所: `skills/checklist-sync/SKILL.md`
- 用途: `docs/design-pattern-checklist.md` の進捗同期
- 依頼例: 「チェックリストを catalog の実体に合わせて更新して」

## 推奨運用順
1. `pattern-scaffolder` で雛形を作成
2. `pattern.md` / `pattern.rb` を埋める
3. `quiz-generator` で `quiz.md` を作成
4. 自分で回答を記入
5. `pattern-reviewer` で完了要件チェック
6. `checklist-sync` で進捗更新

