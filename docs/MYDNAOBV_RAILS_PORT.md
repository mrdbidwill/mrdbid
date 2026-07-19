# myDNAobv Rails Port

This document is the durable handoff for the Rails conversion of the former Python `myDNAobv` project.

## Location

The port lives inside the Rails app under the `Dna` namespace:

- Public downloads: `/dna`; `https://dna.mrdbid.com/` should route to the same Rails surface after nginx is switched from the legacy FastAPI service to `puma-mrdbid`.
- Admin controls: `/admin/dna/observation_lists`
- Models: `Dna::ObservationList`, `Dna::Observation`, `Dna::ExportArtifact`
- Services: `app/services/dna/*`

## Data Rules

County products must preserve the original inclusion rule:

- observation is inside the county/place scope
- observation belongs to one of `DNA_COUNTY_PROJECT_IDS`
- observation has `DNA Barcode ITS`
- create only an observation index PDF with iNaturalist links and a genera count text file

AMS Sequenced Specimens must stay `index_only`:

- default project ID: `132913`
- create an observation index PDF with iNaturalist links
- create a genera count text file
- do not download or store iNaturalist image files

## Storage Rules

- Generated files are stored under `storage/dna_exports`, which is ignored by git through the root `/storage/*` rule.
- No backup directories or large local image caches should be added.
- Use `Dna::ArtifactPruner` or the admin prune action to remove expired artifacts.

## Environment

Optional environment variables:

```env
DNA_INAT_BASE_URL=https://api.inaturalist.org/v1
DNA_INAT_TAXON_ID=47170
DNA_INAT_DNA_FIELD_ID=2330
DNA_INAT_DNA_FIELD_NAME=DNA Barcode ITS
DNA_BARCODE_INFERRED_FIELD_ID=20740
DNA_COUNTY_PROJECT_IDS=124358,184305,132913,251751
DNA_AMS_PROJECT_ID=132913
DNA_INAT_DELAY_SECONDS=0.35
DNA_INAT_TIMEOUT_SECONDS=20
DNA_INAT_MAX_PAGES=200
DNA_INAT_MAX_OBSERVATIONS=5000
DNA_EXPORT_RETENTION_HOURS=168
```

## Operational Notes

- Admin sync currently runs from the admin action and respects page caps and request delay.
- Export generation uses Prawn and creates small metadata/link PDFs.
- County products intentionally use the same small index-only artifact set as AMS Sequenced Specimens.
- If background jobs are added later, keep one active sync/export per list and do not add R2/versioned backup behavior unless explicitly required.
