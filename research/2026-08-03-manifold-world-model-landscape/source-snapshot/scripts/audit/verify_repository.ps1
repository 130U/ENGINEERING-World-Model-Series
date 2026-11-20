param()

$ErrorActionPreference = 'Stop'
$root = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\..'))
$archive = Join-Path $root 'archive\manifold-world-model-landscape'
$failures = New-Object System.Collections.Generic.List[string]

function Assert-Equal {
    param(
        [string]$Name,
        $Actual,
        $Expected
    )
    if ($Actual -ne $Expected) {
        $failures.Add("$Name expected '$Expected' but got '$Actual'")
    }
    [PSCustomObject]@{ check = $Name; actual = $Actual; expected = $Expected; pass = ($Actual -eq $Expected) }
}

function Assert-Exists {
    param([string]$RelativePath)
    $exists = Test-Path -LiteralPath (Join-Path $root $RelativePath)
    if (-not $exists) { $failures.Add("Missing: $RelativePath") }
    [PSCustomObject]@{ check = "exists:$RelativePath"; actual = $exists; expected = $true; pass = $exists }
}

$results = New-Object System.Collections.Generic.List[object]

$required = @(
    'README.md',
    'RESEARCH_GOVERNANCE.md',
    'docs\methodology\meta-prompting.md',
    'archive\manifold-world-model-landscape\01_inputs\governance\Manifold_World_Model_Research_Project_Plan_v2.0_CN.md',
    'archive\manifold-world-model-landscape\01_inputs\governance\Manifold_ChatGPT_Work_Launch_Prompt_v2.0_CN.md',
    'archive\manifold-world-model-landscape\06_dossiers\O-001_world_labs_dossier.md',
    'archive\manifold-world-model-landscape\06_dossiers\O-002_odyssey_dossier.md',
    'archive\manifold-world-model-landscape\06_dossiers\O-003_runway_dossier.md',
    'archive\manifold-world-model-landscape\06_dossiers\O-004_decart_dossier.md',
    'archive\manifold-world-model-landscape\06_dossiers\O-005_nvidia_cosmos_3_dossier.md',
    'archive\manifold-world-model-landscape\06_dossier_support\Dossier_Query_Audit.csv',
    'archive\manifold-world-model-landscape\06_dossier_support\Dossier_Completion_QA.md',
    'archive\manifold-world-model-landscape\06_dossier_support\Dossier_Research_Protocol.md'
)

foreach ($file in $required) { $results.Add((Assert-Exists $file)) }

$governanceInputs = @(Get-ChildItem -LiteralPath (Join-Path $archive '01_inputs\governance') -File)
$drInputs = @(Get-ChildItem -LiteralPath (Join-Path $archive '01_inputs\deep_research') -File -Filter 'DR-*.md')
$results.Add((Assert-Equal 'original_input_files' ($governanceInputs.Count + $drInputs.Count) 5))
$results.Add((Assert-Equal 'original_dr_files' $drInputs.Count 3))

$dossiers = @(Get-ChildItem -LiteralPath (Join-Path $archive '06_dossiers') -File)
$dossierSupport = @(Get-ChildItem -LiteralPath (Join-Path $archive '06_dossier_support') -File)

$results.Add((Assert-Equal 'dossier_files' $dossiers.Count 5))
$results.Add((Assert-Equal 'dossier_support_files' $dossierSupport.Count 3))

$archiveFiles = @(Get-ChildItem -LiteralPath $archive -Recurse -File).Count
$results.Add((Assert-Equal 'research_record_files' $archiveFiles 245))

$sources = @(Import-Csv (Join-Path $archive '04_evidence\sources.csv')).Count
$sourceCards = @(Get-ChildItem (Join-Path $archive '04_evidence\sources') -File -Filter '*.md').Count
$claims = @(Import-Csv (Join-Path $archive '04_evidence\evidence_ledger.csv')).Count
$maps = @(Import-Csv (Join-Path $archive '08_content\slide_evidence_map.csv')).Count
$queries = @(Import-Csv (Join-Path $archive '06_dossier_support\Dossier_Query_Audit.csv')).Count

$results.Add((Assert-Equal 'sources' $sources 141))
$results.Add((Assert-Equal 'source_cards' $sourceCards 141))
$results.Add((Assert-Equal 'evidence_claims' $claims 111))
$results.Add((Assert-Equal 'slide_evidence_map_rows' $maps 63))
$results.Add((Assert-Equal 'dossier_queries' $queries 58))

$contentZipCompanion = Join-Path $archive '08_content\content_lock_v1_1a.zip.sha256'
$contentZipRecordedHash = ([System.IO.File]::ReadAllText($contentZipCompanion, [System.Text.Encoding]::UTF8)).Trim().Split(' ')[0]
$results.Add((Assert-Equal 'content_lock_package_sha256' $contentZipRecordedHash 'FD333842A2EA94818DBD6FAE3DF3C3B615CE98B3F03EEC60B95748E0C0964C20'))

$pptx = Join-Path $archive '10_deck\manifold_world_model_landscape_v1_4.pptx'
$pptxHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $pptx).Hash
$results.Add((Assert-Equal 'presentation_sha256' $pptxHash 'A22B0148C1D369063E62EF9A9B8CAC4CE397354F899F5A29237B5781CC82ED87'))

$results | Format-Table -AutoSize

if ($failures.Count -gt 0) {
    Write-Host ''
    Write-Host 'Verification failed:' -ForegroundColor Red
    $failures | ForEach-Object { Write-Host "- $_" -ForegroundColor Red }
    exit 1
}

Write-Host ''
Write-Host 'Verification passed.' -ForegroundColor Green

& (Join-Path $PSScriptRoot 'check_reader_text.ps1')
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
