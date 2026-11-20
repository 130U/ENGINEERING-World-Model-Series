# Content and material checks

The two reading editions state the study; `source-snapshot/` holds the materials behind it. The research cutoff is July 14, 2026.

## What the numbers are

- 23 leads, 10 validated objects, 5 focus companies, 4 watch objects and 1 early signal.
- 141 registered sources, 141 source cards, 111 atomic claims, 58 targeted queries and 63 page-to-evidence mappings.
- The five focus companies are World Labs, Odyssey, Runway, Decart and NVIDIA Cosmos 3. They are five complementary paths.
- Manifold is the public comparison anchor, and every competitive statement is conditional on its public record.
- The presentation is a ten-page PPTX.

## How to verify them

```powershell
powershell -ExecutionPolicy Bypass -File source-snapshot/scripts/audit/verify_repository.ps1
```

The script confirms the five inputs, the source, card, claim, query and mapping counts, the five dossiers, the hash of the locked content package and the SHA-256 of the presentation, then checks every text file for encoding and portability. The [verification guide](source-snapshot/docs/reproducibility/reproduction-guide.md) shows how to follow one sentence of the presentation back to its source, and [`SOURCE-MANIFEST.sha256`](SOURCE-MANIFEST.sha256) records the identity of every file in the package.

Product access, pricing, licensing and adoption change after the cutoff; an update starts from the primary sources listed in the source registry.
