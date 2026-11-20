# 复核指南

## 1. 机械审计

在 `source-snapshot/` 目录下运行：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/audit/verify_repository.ps1
```

脚本核对：

- 五份初始输入，其中三份为 Deep Research 线索报告；
- 141 个来源、141 张来源卡、111 条原子主张；
- 63 条页面证据映射；
- 五份对象 Dossier 及其研究协议、查询审计和完成 QA；
- Content Lock 规范包与 10 页 PPTX 的 SHA256。

随后自动运行 `check_reader_text.ps1`，检查文本编码、不可移植的引用标记和控制字符。

## 2. 沿证据链抽查

1. 在 [`sources.csv`](../../archive/manifold-world-model-landscape/04_evidence/sources.csv) 中任选一个来源编号，打开 `04_evidence/sources/` 下对应的来源卡，核对发布者、日期、支持内容和证据上限；
2. 在 [`evidence_ledger.csv`](../../archive/manifold-world-model-landscape/04_evidence/evidence_ledger.csv) 中查到引用该来源的原子主张；
3. 在 [`slide_evidence_map.csv`](../../archive/manifold-world-model-landscape/08_content/slide_evidence_map.csv) 中查到引用该主张的页面语句；
4. 打开 [`PPTX`](../../archive/manifold-world-model-landscape/10_deck/manifold_world_model_landscape_v1_4.pptx) 对应页面，确认页面措辞没有超出来源卡记录的证据上限。

## 3. 核对审阅工作簿

`07_synthesis/phase_4_comparison_review.xlsx` 与 `08_content/slide_evidence_map.xlsx` 由同目录的 CSV 单向生成。CSV 是权威数据；两者不一致时以 CSV 为准。

## 4. 演示稿渲染记录

最终演示稿在 Microsoft PowerPoint 中以 1280×720 逐页渲染，10 页共 252 个文本框，文本边界检查结果记录在 [`final_deck_qa_v1_4.md`](../../archive/manifold-world-model-landscape/10_deck/final_deck_qa_v1_4.md)。`10_deck/tools/qa_deck_powerpoint.ps1` 接受 `InputPptx` 和 `OutputDir` 参数，可在装有 PowerPoint 与 Noto Sans SC、Noto Serif SC 字体的环境中重复这项检查。

研究证据截至 2026-07-14；此后的产品、价格、许可和采用状态应回到对应的一手来源重新核对。
