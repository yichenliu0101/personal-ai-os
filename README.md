# Personal AI OS

個人 AI 員工管理系統。管理多個 AI agent 的角色、權限、工作流。

## 設計原則

- Agent 只在本地工作，所有對外動作由 aaron 手動執行
- 權限邊界由 hooks 硬封鎖 + AGENTS.md 軟規範雙重保護
- Agent 透過 pending/ 提交待審項目
- Agent 可自我學習，固化工作流需 aaron 批准

## 目錄結構

```
personal-ai-os/
├── AGENTS.md          # 全域 agent 規則與權限邊界
├── pending/           # 所有待 aaron 審核的動作
└── hooks/             # 危險指令封鎖腳本
    └── block-dangerous-git.sh
```

## 權限規則

| 動作 | 權限 |
|------|------|
| Read / Edit / Commit | 自主執行 |
| 產生 draft | 自主執行（存入 pending/） |
| git push | 永遠封鎖 |
| glab mr create / note | 永遠封鎖 |
| rm -rf | 永遠封鎖 |
| 刪除檔案 / DB migration | 進 pending/ 等審核 |

## 本機資產（不推 GitHub）

- `C:\AgentWiki\` — 私人知識庫（Obsidian 相容）

## 接入新專案

在目標 repo 的 AGENTS.md 加入：

```markdown
@C:\personal-ai-os\AGENTS.md

# 專案特定規則
...
```

## 未來擴充

- [ ] 學生 / 交易員 role
- [ ] Telegram gateway（pending/ 推通知）
- [ ] AgentWiki SQLite index
- [ ] understand-anything 知識圖譜整合
