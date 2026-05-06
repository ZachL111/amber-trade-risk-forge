# Review Journal

The review surface for `amber-trade-risk-forge` is deliberately narrow: one fixture, one scoring rule, and one local check.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its trading systems focus without claiming live deployment or external usage.

## Cases

- `baseline`: `spread pressure`, score 187, lane `ship`
- `stress`: `fill risk`, score 226, lane `ship`
- `edge`: `portfolio drift`, score 195, lane `ship`
- `recovery`: `quote width`, score 264, lane `ship`
- `stale`: `spread pressure`, score 197, lane `ship`

## Note

A future change should add new cases before it changes the scoring rule.
