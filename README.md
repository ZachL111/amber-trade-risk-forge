# amber-trade-risk-forge

`amber-trade-risk-forge` is a Zig project in trading systems. Its focus is to design a Zig verification harness for risk systems, covering policy evaluation, deny and allow fixtures, and failure-oriented tests.

## Problem It Tries To Make Smaller

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Amber Trade Risk Forge Review Notes

Start with `quote width` and `spread pressure`. Those cases create the widest score spread in this repo, so they are the best quick check when the model changes.

## Working Pieces

- `fixtures/domain_review.csv` adds cases for spread pressure and fill risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/amber-trade-risk-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `quote width` and `spread pressure`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Design Notes

The fixture data drives the tests. The code stays thin, while `metadata/domain-review.json` and `config/review-profile.json` explain what each case is meant to protect.

The Zig code keeps the review rule close to the tests.

## Example Run

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Tests

That command is also the regression path. It verifies the domain cases and catches mismatches between the CSV, metadata, and code.

## Known Limits

The repository is intentionally scoped to local checks. I would expand it by adding adversarial fixtures before adding features.
