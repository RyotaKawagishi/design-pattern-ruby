---
name: quiz-grader
description: Grade answers written in catalog/{pattern}/quiz.md without changing the learner's text, add explanations under ### 解説, then propose three follow-up question ideas and three memo ideas in chat and ask what to continue with.
---

# Quiz Grader

このスキルは、`quiz.md` に書かれた自分の回答を残したまま採点し、理解を深めるための補助を行う。

## 使うタイミング
- 「`quiz.md` を採点して」と依頼されたとき
- 回答後に、正誤と短い解説を残したいとき
- 次に考える疑問やメモの候補も出したいとき

## 実施手順
1. `catalog/{pattern}/quiz.md` を読む。
2. 必要に応じて `catalog/{pattern}/{pattern}.md` と `catalog/{pattern}/{pattern}.rb` を読み、採点根拠を確認する。
3. `quiz.md` 内の既存の問題文と `### 自分の回答` の内容は変更しない。
4. 各設問について、`### 解説` がなければ追加し、次の方針で短く記載する。
   - 正しい: `○` で始め、要点を一言補足する
   - 一部正しい: `△` で始め、不足点を補う
   - 誤りまたは未回答: `×` で始め、正しい考え方を簡潔に書く
5. 採点後、チャットで次の 2 つを出す。
   - 「こんな疑問がありますか？」の候補を 3 つ
   - `# メモ` に書けそうな候補を 3 つ
6. 最後に、どれを掘り下げるか、または他に気になる点があるかをチャットで聞く。

## 注意
- 学習者が書いた `### 自分の回答` は言い換えない
- 解説は短く、採点と補足に集中する
- `pattern.md` / `pattern.rb` にない内容を広げすぎない
- 疑問候補とメモ候補は、その回の回答内容に寄せる
