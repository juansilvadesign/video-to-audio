# Video to Audio Converter — Responsive Roadmap

Status: proposed planning baseline  
Last reviewed: 2026-08-20  
Execution backlog: [TASKS.md](TASKS.md)

## Fixed frame

This roadmap assumes a Windows-first v1.0 stabilization effort. Re-baseline the dates once before kickoff if the actual start or capacity differs; after kickoff, time and capacity stay fixed and scope flexes.

| Constraint | Commitment |
| --- | --- |
| Outcome | A nontechnical Windows user can reliably extract audio from a batch, understand every result, and install a traceable release without configuring Python. |
| Kickoff | 2026-08-24 |
| Deadline | 2026-10-02 (six weeks) |
| Capacity | One maintainer, maximum 48 focused engineering hours (about 8 hours/week) |
| Scope rule | Safety and truthful results are mandatory. Packaging polish and convenience features are cut before the deadline or capacity moves. |
| Primary platform | Windows; source compatibility elsewhere is best-effort for this time-box. |

The current implementation proves the basic UI flow, background execution, three output choices, batch selection, and collision-free naming. It does not yet prove reliable cleanup, isolated batch failures, honest progress, cancellation, repeatable setup, or a distributable artifact. The roadmap retires those risks in that order.

## Release sequence

| Release | Target | Benefit shipped | Evidence at the checkpoint | Riskiest assumption retired | Candidate scope |
| --- | --- | --- | --- | --- | --- |
| **R1 — Trustworthy conversion MVP** | 2026-09-04 | Users can complete or cancel a mixed batch and trust the reported outcome without losing existing files. | Headless engine suite plus manual mixed-batch demo covering success, silent/bad input, duplicate output, and cancellation. | MoviePy/FFmpeg can be wrapped with predictable cleanup and useful per-file outcomes without redesigning the app. | VTA-001–VTA-006 |
| **R2 — Repeatable install and operation** | 2026-09-18 | Contributors can reproduce the app, and Windows users get correct assets, diagnostics, and behavior from the launcher. | Clean-environment setup, CI matrix, launch from a non-project directory, and documentation review. | The runtime and FFmpeg dependency can be made supportable across the chosen Python/Windows baseline. | VTA-007–VTA-011 |
| **R3 — Downloadable v1.0** | 2026-10-02 | A user without Python can download a versioned artifact and convert supported inputs on a clean Windows machine. | Clean-VM smoke matrix, checksums, tagged build, release notes, and documented limitations. | The application and media runtime can be packaged within the capacity and distribution constraints. | VTA-012–VTA-014 |

R1 is the minimum viable release: it tests whether the product's core promise—safe, understandable batch audio extraction—works. If R1 fails that test, packaging and new features stop until the core path is corrected.

## Next increment in detail — R1

Time-box: 16–18 hours, ending 2026-09-04.

1. **Define the observable contract (2 hours).** Specify supported inputs/outputs, structured per-file results, batch states, cancellation semantics, and what happens when a video has no audio.
2. **Extract and harden the engine (6 hours).** Complete VTA-001–VTA-003, including explicit codec options, context-managed resources, partial-file cleanup, and failure isolation.
3. **Build the test harness (5 hours).** Complete VTA-006 with generated/mocked fixtures and a headless command that works without opening Qt.
4. **Reconnect truthful UI state (4 hours).** Complete VTA-004 and VTA-005; remove simulated progress, prevent overlapping workers, and surface success/partial/failure/cancelled outcomes.
5. **Run the release check (1 hour).** Execute the automated suite and one manual mixed batch, then record defects and actual effort before selecting R2 scope.

### R1 acceptance boundary

- Existing outputs are never overwritten.
- Each opened media resource is closed on every exit path.
- One failed file does not prevent valid remaining files from converting.
- Progress reflects completed work; 100% means the batch has ended.
- Cancellation and window close finish without a false success message or abandoned worker.
- Core behavior is testable without driving the GUI.

If the boundary is not met by the checkpoint, retain VTA-001, VTA-002, VTA-004, and the tests that protect them. Defer format breadth before weakening safety: AAC is the first output candidate to move beyond v1.0 if its packaging or codec behavior is unreliable.

## Later increments, intentionally coarse

### R2 — Repeatable install and operation

Select the exact Python/FFmpeg support matrix from R1 evidence. Favor a small direct dependency set, deterministic asset paths, a diagnostic Windows launcher, CI, and accurate documentation. If capacity tightens, reduce the CI version matrix and documentation embellishment; do not defer dependency/FFmpeg detection or the license correction.

### R3 — Downloadable v1.0

Choose the packaging approach only after R2 establishes the runtime boundary. Prove it on a clean Windows environment before adding installer polish. If bundling FFmpeg is legally or technically expensive, ship a clearly diagnosed external prerequisite or reduce format scope; do not silently produce an artifact that works only on the maintainer's machine.

## Scope guardrails

The following are not committed inside this time-box: drag-and-drop, metadata editing, naming templates, persisted preferences, per-frame progress, localization, and packaged macOS/Linux releases. They remain in the later-candidate section of `TASKS.md`.

When capacity is exceeded, cut in this order:

1. Release-page and installer polish.
2. Breadth of packaging/CI platforms and Python versions.
3. AAC support if its codec path is not dependable.
4. Convenience enhancements not required by the release acceptance boundary.

Never cut cleanup, non-overwrite guarantees, accurate results, cancellation correctness, or the tests that protect them.

## Retrospective and re-plan cadence

Hold a 30-minute checkpoint at the end of every release (2026-09-04, 2026-09-18, and 2026-10-02):

1. Demonstrate the benefit using the checkpoint evidence, not task completion alone.
2. Compare actual hours with the 48-hour cap and list new technical or user evidence.
3. Close, rewrite, split, or defer tasks in `TASKS.md`.
4. Detail only the next release; keep later releases coarse.
5. Record the scope cuts needed to preserve the fixed deadline and capacity.

After v1.0, use real issue reports and conversion failures to decide whether the next investment is format reliability, platform packaging, or workflow convenience.
