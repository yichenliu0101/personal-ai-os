# BizForm Ecosystem

## 專案關係

```
backend ──(submodule)──→ BizFormDomain
backend ──(HTTP)──→ depot-server
backend ──(HTTP)──→ elsa-server
backend ──(submodule)──→ browserservice
```

## 跨專案規則

- submodule 變更：先 commit 子模組 → 再 commit 主 repo 指針
- API 變更：WebApi + WebApp 兩邊同步
- Domain 層不能有外部依賴

## 專案清單

| 專案 | 路徑 | 描述 |
|------|------|------|
| backend | `C:\BizForm\backend` | 主要 .NET backend |
| depot-server | TBD | 多租戶設定管理 |
| elsa-server | TBD | 工作流編排 |
| browserservice | TBD | 瀏覽器服務 |

## Wiki Domain

`C:\AgentWiki\Cards\engineering\bizform\`
