# Amber Trade Risk Forge Walkthrough

The fixture is intentionally compact, so the review starts with the cases that pull farthest apart.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | spread pressure | 187 | ship |
| stress | fill risk | 226 | ship |
| edge | portfolio drift | 195 | ship |
| recovery | quote width | 264 | ship |
| stale | spread pressure | 197 | ship |

Start with `recovery` and `baseline`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`recovery` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
