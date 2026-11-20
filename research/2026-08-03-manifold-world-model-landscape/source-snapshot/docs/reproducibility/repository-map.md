# 材料地图

## 阅读层

`docs/` 是面向读者的入口：背景与范围、Storyline、方法与证据、Research Log、研究结果和复核指南。

## 输入

`archive/manifold-world-model-landscape/01_inputs/` 保存五份初始输入：

- `governance/`：项目执行计划（章程）与启动 Prompt，即 Meta Prompting 的两份原件；
- `deep_research/`：DR-01、DR-02、DR-03 三份 Deep Research 线索报告。

## 研究记录

`archive/manifold-world-model-landscape/` 按研究推进的顺序组织：

```text
00_brief            章程、状态文件、决策日志
01_inputs           输入、输入登记与检查点审批记录
02_anchor           Manifold 公开比较锚点
03_universe         对象、资格、地域和组件登记
04_evidence         来源登记、来源卡和 Evidence Ledger
05_candidates       资格验证与两个检查点
06_dossiers         五份对象 Dossier
06_dossier_support  Dossier 研究协议、查询审计和完成 QA
07_synthesis        横向比较、监测矩阵和审阅工作簿
08_content          Content Lock、页面证据映射和冻结清单
09_red_team         Red Team 报告与修订记录
10_deck             Storyboard、10 页 PPTX、渲染与 QA
```

## 复核工具

`scripts/audit/verify_repository.ps1` 核对输入、来源、主张、页面证据映射的数量和演示稿哈希；`scripts/audit/check_reader_text.ps1` 检查文本编码与可移植性。命令见[复核指南](reproduction-guide.md)。
