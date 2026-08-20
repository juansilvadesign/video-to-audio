# Video to Audio Converter — Tasks

Last reviewed: 2026-08-20

This is the execution backlog for [ROADMAP.md](ROADMAP.md). Work top to bottom inside each release. A checked item means its acceptance criteria are present in the repository, not merely started.

## Delivery rules

- Keep the six-week deadline and 48-hour capacity fixed; reduce optional scope when work exceeds the estimate.
- Finish and validate one task before starting another unless the tasks are explicitly independent.
- Treat data safety, truthful status, resource cleanup, and repeatable tests as release blockers.
- Do not call a release complete until the definition of done at the end of this file passes.

## Baseline already present

- [x] Select one or more MP4, AVI, MOV, or MKV files in the desktop UI.
- [x] Choose MP3, WAV, or AAC output and a destination folder.
- [x] Run conversion work outside the main Qt thread.
- [x] Avoid overwriting an existing output by adding a numbered suffix.
- [x] Provide a Windows launcher and basic contributor/security documentation.

## Release 1 — Trustworthy conversion MVP

Goal: a user can run a batch and trust the files, progress, failures, and cancellation state they see.

- [ ] **VTA-001 — Extract an import-safe conversion engine.** Move media validation, output-path selection, codec options, and one-file conversion out of `app.py`. Define typed request/result objects so the engine can be tested without creating a `QApplication`.

  Acceptance: importing the engine has no GUI side effects; one function accepts a source, destination, format, and applicable quality options; it returns the created path and a structured result.

- [ ] **VTA-002 — Make file handling safe and batch failures isolated.** Close every `VideoFileClip` and audio resource on success, error, and cancellation; remove partial outputs; report a missing audio stream clearly; continue with the remaining files after one input fails.

  Acceptance: a bad or silent input cannot abort the rest of the batch, lock the source file, or leave a partial output behind.

- [ ] **VTA-003 — Validate format-specific options.** Use an explicit format-to-codec mapping, apply bitrate only where it is meaningful, reject missing/unreadable inputs, and verify the destination is writable before starting the worker.

  Acceptance: MP3, WAV, and AAC each have a documented encoding configuration and actionable validation errors.

- [ ] **VTA-004 — Replace simulated progress with truthful job state.** Remove the timer that increments progress independently of conversion. Show the active filename and completed-file count, disable mutation controls while a job runs, and distinguish success, partial success, failure, and cancellation.

  Acceptance: the UI never displays 100% before the batch is finished and cannot start a second worker over the first.

- [ ] **VTA-005 — Add safe cancellation and shutdown.** Add a Cancel action, check cancellation between files, define the limitation for an in-progress FFmpeg operation, and wait for worker cleanup when the window closes.

  Acceptance: cancelling never produces a success dialog; closing during a job does not leave an unmanaged Qt thread or corrupt an output.

- [ ] **VTA-006 — Add deterministic engine tests.** Cover unique names, format validation, no-audio input, one-file failure inside a batch, cancellation between files, cleanup, paths with spaces/Unicode, and success results. Use tiny generated fixtures or mocks; do not commit large media files.

  Acceptance: the core suite runs headlessly and does not depend on a developer's local media library.

## Release 2 — Repeatable install and operation

Goal: a new contributor can set up the app, and a Windows user gets the same behavior from any launch location.

- [ ] **VTA-007 — Define and minimize the supported runtime.** Choose a currently supported Python range, list only direct runtime dependencies, normalize `requirements.txt` to UTF-8, and document how FFmpeg is obtained and detected.

  Acceptance: setup succeeds in a clean virtual environment from the documented commands, and startup reports a useful error when FFmpeg is unavailable.

- [ ] **VTA-008 — Make assets location-independent.** Resolve icons relative to `app.py`, fix the nonexistent `icons/Video to Audio.png` reference, and define a single asset manifest usable by source and packaged builds.

  Acceptance: launching outside the project directory still loads every icon.

- [ ] **VTA-009 — Align the Windows launcher with the setup guide.** Use one virtual-environment name, validate required files and imports, preserve the application exit code, and print a copyable recovery command.

  Acceptance: `run.bat` handles a ready environment, missing environment, missing dependency, and missing Python without a hard-coded local path.

- [ ] **VTA-010 — Add continuous integration.** Run syntax/static checks and headless engine tests on supported Python versions; include Windows because it is the primary release platform.

  Acceptance: every pull request has an automated pass/fail signal for the supported matrix.

- [ ] **VTA-011 — Correct the public documentation and metadata.** Reconcile the README's MIT claims with the repository's Apache-2.0 `LICENSE`, document actual rather than simulated progress, list FFmpeg and platform prerequisites, and remove unsupported performance/security claims.

  Acceptance: README, license badge/text, setup commands, supported formats, and observed behavior agree.

## Release 3 — Downloadable v1.0

Goal: a Windows user can download, verify, and run a release without assembling a Python environment.

- [ ] **VTA-012 — Create a reproducible Windows package.** Add the smallest suitable packaging configuration, bundle required icons and handle FFmpeg according to its license/distribution constraints, and keep application paths portable.

  Acceptance: a clean Windows VM can launch the artifact and complete a conversion without Python installed.

- [ ] **VTA-013 — Run the release smoke matrix.** Exercise at least one valid input container per supported type, every output format, duplicate names, silent/corrupt input, Unicode/long paths, cancellation, and a mixed-success batch.

  Acceptance: results are recorded with the release candidate, outputs open in an independent player, and no critical or high-severity defect remains.

- [ ] **VTA-014 — Publish the v1.0 release package.** Produce versioned artifacts, checksums, concise release notes, known limitations, and installation/uninstallation instructions.

  Acceptance: the tagged source and downloadable artifact can be traced to the same passing commit.

## Later candidates

These are deliberately outside the fixed v1.0 commitment. Promote them only after a release retrospective.

- [ ] **VTA-101 — Drag-and-drop input.**
- [ ] **VTA-102 — Remember the last destination and safe user preferences.**
- [ ] **VTA-103 — Add metadata and naming templates.**
- [ ] **VTA-104 — Add per-file retry and an “open output folder” action.**
- [ ] **VTA-105 — Package and smoke-test macOS and Linux builds.**
- [ ] **VTA-106 — Add fine-grained FFmpeg progress only if it remains accurate across all supported formats.**

## Decisions and dependencies

- [ ] Confirm Apache-2.0 as the intended project license, or deliberately replace it and update every notice.
- [ ] Confirm Windows as the v1.0 primary platform; other platforms remain source-supported until separately packaged.
- [ ] Decide whether FFmpeg is bundled or discovered on the host after reviewing distribution and codec-license obligations.
- [ ] Select a small, redistributable media-fixture strategy for automated and release testing.

## Definition of done for every release

- Acceptance criteria for included task IDs pass.
- Automated tests pass in a clean environment and CI.
- A real end-to-end conversion smoke test passes on the target platform.
- Failure and cancellation paths leave no partial files or running worker.
- User-visible behavior and prerequisites are documented.
- The release retrospective records evidence, surprises, and the scope decision for the next increment.
