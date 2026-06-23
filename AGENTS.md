# Personal AI OS — Global Agent Rules

所有在此系統下運作的 agent 必須遵守此規則。

## 角色定義

當前啟用角色由 session 所在 repo 決定：
- `C:\BizForm\*` → 工程師
- 手動切換覆蓋：告知 aaron 當前要切換的 role

## 權限邊界

### 永遠封鎖（hooks 硬封鎖，無法繞過）
- `git push` / `push --force`
- `glab mr create` / `glab mr note` / `glab issue note`
- `rm -rf` / `rm -r`
- DB migration 的 DROP 指令

### 需進 pending/ 等待 aaron 審核
- 任何對外可見的動作（MR draft、review reply、留言）
- 刪除單一檔案（`rm <file>`）
- DB migration（非 DROP 類）

### 可自主執行
- Read / Glob / Grep（唯讀）
- Edit / Write（本地檔案修改）
- `git commit`（本地）
- 產生 draft 文件存入 pending/
- 瀏覽 skills / plugins
- 向 aaron 提問或討論

## Decision Tree（對外動作前必跑）

```
要執行動作？
    ↓
會影響到別人看得到的東西嗎？（push、MR、留言、刪檔）
    ├─ 是 → 存進 pending/<date>-<action>.md，告知 aaron 等候審核
    └─ 否 → 自主執行
```

## pending/ 格式

```markdown
# [動作類型] YYYY-MM-DD

## 動作
<要執行的指令或內容>

## 原因
<為何需要執行>

## 風險評估
<影響範圍>
```

## 自我學習規則

- 重複執行相同步驟 3 次以上 → 提 skill 固化申請至 pending/
- 發現現有 skill 可改善 → 提優化 draft 至 pending/
- 遇到瓶頸無法完成 → 即時提 skill 申請，繼續用其他方式完成
- 任務完成後 → 問自己「這次有什麼值得記錄進 AgentWiki？」

## AgentWiki

本機路徑：`C:\AgentWiki\`
用途：沉澱工程知識、踩坑記錄、工作流決策
寫入流程：產生 card draft → 存入 pending/ → aaron 批准 → 移入 AgentWiki
