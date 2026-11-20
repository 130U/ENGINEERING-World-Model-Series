# Content Lock v1.1a 批准链机械复核

**复核日期：** `2026-07-15`  
**批准状态：** `approved`  
**机械复核：** `pass`  
**严重度：** `P0=0 / P1=0 / P2=0`

## 1. 规范批准对象

唯一规范批准包为 `content_lock_v1_1a.zip`；同目录中的 `content_lock_v1_1a_frozen_attachments.zip` 是批准前的旧交付件，不是批准对象，不得用于后续审计或制作。

| 文件 | 字节数 | SHA256 / 内容 |
|---|---:|---|
| `content_lock_v1_1a.zip` | 100,817 | `FD333842A2EA94818DBD6FAE3DF3C3B615CE98B3F03EEC60B95748E0C0964C20` |
| `content_lock_v1_1a.zip.sha256` | 89 | `FD333842A2EA94818DBD6FAE3DF3C3B615CE98B3F03EEC60B95748E0C0964C20  content_lock_v1_1a.zip` |

机械打开 ZIP 后确认：

- 恰好 16 个根级成员，16 个名称均唯一；
- 无 `(1)`、子目录、旧快照、脚本或预览文件；
- 15 个非自引用成员的字节数与 SHA256 均匹配冻结清单；
- 项目内零字节文件数为 0。

## 2. 四份冻结内容

| 冻结文件 | 字节数 | SHA256 |
|---|---:|---|
| `deck_content_review.md` | 12,214 | `7D794E1DEC6E9FC2FA3085892C6719B5778C7127CE424EB431543992659C4211` |
| `slide_evidence_map.csv` | 30,207 | `DD6D56F8228586C29A1015FE3739A92770CCC6542C2E59A8665C126C753DB4E2` |
| `slide_evidence_map.xlsx` | 18,803 | `21D6F269F2CDA98FCCE71FF22484C148600C09577B76FE7E179AAC43825FD17A` |
| `evidence_ledger.csv` | 81,827 | `D1B20B3137CCA4A9A4BD315A39D92030138C263328BE5CDCEB09F0A14A317E59` |

上述四份文件的 SHA256 与 `content_lock_v1_1a_frozen_manifest.md`、`content_lock_v1_1a_approval_record.md` 和 `project_state.json` 的批准哈希记录一致。

## 3. Evidence 底座完整性

- `evidence_ledger.csv`：111 行、111 个唯一 Claim ID、22 列、无空 Claim ID，文件完整结束；
- `sources.csv`：141 条来源；
- `04_evidence/sources/`：141 张 source card；
- `S-ODY-011.md` 与 `S-ODY-014.md` 均非零且可完整读取。

## 4. 治理快照解释

ZIP 内的 `project_state.json` 与 `decision_log.md` 是用户批准前冻结的治理快照。用户批准和 Storyboard 启动后，权威 live 文件依法继续演进，因此 live 治理文件不应与包内快照逐字节相同；这不构成四份内容冻结文件漂移。

Content Lock 批准链至此完成独立机械闭环。后续 Storyboard 或 Deck 状态变化不得修改上述四份冻结文件或批准包哈希。
