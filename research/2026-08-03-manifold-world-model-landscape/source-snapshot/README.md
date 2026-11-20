# Manifold and the Overseas World-Model Landscape: Research Materials

**Letao (Theodore) Ouyang** · Research cutoff July 14, 2026

This directory holds everything the study rests on: the charter and launch prompt that govern the research, the three lead reports, 141 source cards, 111 atomic claims, five dossiers, the red-team record, the locked content and the ten-page presentation. The reading editions of the study are [English](../README.en.md) and [中文](../README.zh-CN.md).

## Start here

| To see | Open |
| --- | --- |
| The method | [Meta prompting](docs/methodology/meta-prompting.md), with the [charter](archive/manifold-world-model-landscape/01_inputs/governance/Manifold_World_Model_Research_Project_Plan_v2.0_CN.md) and the [launch prompt](archive/manifold-world-model-landscape/01_inputs/governance/Manifold_ChatGPT_Work_Launch_Prompt_v2.0_CN.md) |
| The conclusions | [Final conclusions](docs/overview/final-conclusions.md) and the [ten-page presentation](archive/manifold-world-model-landscape/10_deck/manifold_world_model_landscape_v1_4.pptx) |
| The five focus companies | [Final five](docs/results/final-five.md) and the [five dossiers](archive/manifold-world-model-landscape/06_dossiers/) |
| How 23 leads became five | [Candidate funnel](docs/results/candidate-funnel.md) and the [eligibility register](archive/manifold-world-model-landscape/03_universe/eligibility_register.csv) |
| The evidence | [Sources](archive/manifold-world-model-landscape/04_evidence/sources.csv), [source cards](archive/manifold-world-model-landscape/04_evidence/sources/) and the [evidence ledger](archive/manifold-world-model-landscape/04_evidence/evidence_ledger.csv) |
| The challenges | [Red-team report](archive/manifold-world-model-landscape/09_red_team/red_team_report.md) and the [decision log](archive/manifold-world-model-landscape/00_brief/decision_log.md) |
| The sentence-level trace | [Page-to-claim-to-source map](archive/manifold-world-model-landscape/08_content/slide_evidence_map.csv) |

## Layout

| Path | Contents |
| --- | --- |
| [`docs/`](docs/index.md) | Reading layer in Chinese: background, storyline, method, research log, results and the verification guide |
| [`archive/manifold-world-model-landscape/`](archive/manifold-world-model-landscape/README.md) | The research record in working order, from the brief to the presentation |
| [`scripts/audit/`](scripts/audit/) | Checks of the evidence counts, the presentation hash and the text encoding |
| [`RESEARCH_GOVERNANCE.md`](RESEARCH_GOVERNANCE.md) · [`NOTICE.md`](NOTICE.md) | Authority order and roles; reuse terms |

## Verify

```powershell
powershell -ExecutionPolicy Bypass -File scripts/audit/verify_repository.ps1
```

The script confirms five inputs, 141 sources and source cards, 111 claims, 63 page-evidence mappings, five dossiers and the SHA-256 of the presentation. The [verification guide](docs/reproducibility/reproduction-guide.md) shows how to follow one sentence of the presentation back to its source.
