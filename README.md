# amber-trade-risk-forge

`amber-trade-risk-forge` packages a practical trading systems exercise in Zig. The emphasis is on deterministic behavior, a small public API, and examples that explain the tradeoffs.

## How I Read Amber Trade Risk Forge

The useful thing to inspect here is how the same score rule is represented in code, metadata, and examples. If those three pieces disagree, the audit script should make the drift visible.

## Main Behaviors

- Includes extended examples for fills, including `surge` and `degraded`.
- Documents portfolio pressure tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.
- Adds a repository audit script that checks structure before running the language verifier.

## Problem Shape

This project keeps the domain idea close to the tests. That makes it useful as a reference implementation, a small experiment, or a starting point for a more specialized tool.

## Repository Map

- `src`: primary implementation
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Internal Model

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps order state, risk checks, and fills in one explicit decision path. The threshold is 176, with risk penalty 4, latency penalty 3, and weight bonus 2. The Zig version uses compile-time constants and native test blocks for fast local checks.

## How To Run It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Scenario Walkthrough

`surge` is the first example I would inspect because it lands on the `accept` path with a score of 202. The broader file also keeps `degraded` at 0 and `surge` at 202, which gives the model a useful low-to-high spread.

## Validation

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Known Edges

The scoring model is simple by design. More domain-specific behavior should be added through explicit adapters or extra fixture classes rather than hidden constants.

## Follow-Up Work

- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Split the scoring constants into a typed configuration object and validate it before use.
- Add one more trading systems fixture that focuses on a malformed or borderline input.

## Run It Locally

Clone the repository, enter the directory, and run the verifier. No database server, cloud account, or token is required.
