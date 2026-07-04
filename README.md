# gh-orgsync

A [GitHub CLI](https://cli.github.com) extension that clones or updates **every repo in an org** into a local folder named for that org. Re-running is safe and idempotent — missing repos get cloned, existing ones get fast-forwarded.

```
$ gh orgsync anthropics

  ___  _ __ __ _ ___ _   _ _ __   ___
 / _ \| '__/ _` / __| | | | '_ \ / __|
| (_) | | | (_| \__ \ |_| | | | | (__
 \___/|_|  \__, |___/\__, |_| |_|\___|
           |___/     |___/
  clone or sync a whole GitHub org  v1.0.0

▸ querying anthropics …
▸ 42 repo(s) found; target dir ./anthropics/

  ✓ cloned   claude-code
  ✓ pulled   anthropic-sdk-python
  ! skipped  some-fork (diverged or dirty)
  ...

▸ done — 42 repo(s) under ./anthropics/
```

## Install

```bash
gh extension install <your-github-username>/gh-orgsync
```

Or from a local clone:

```bash
git clone https://github.com/<you>/gh-orgsync
gh extension install ./gh-orgsync
```

## Usage

```
gh orgsync [options] <org>

ARGUMENTS
  <org>            GitHub organization (or user) name

OPTIONS
  -j, --jobs N     parallel clones/pulls        (default: 8)
  -l, --limit N    max repos to fetch           (default: 1000)
  -s, --source     skip forks (sources only)
  -n, --dry-run    list what would happen, do nothing
  -h, --help       show this help
  -V, --version    print version
```

### Examples

```bash
gh orgsync anthropics          # clone/sync into ./anthropics/
gh orgsync -j16 -s my-company  # sources only (no forks), 16 in parallel
gh orgsync --dry-run some-org  # show the plan, change nothing
```

## Behavior

- Repos land in `./<org>/`. The org name is also a valid GitHub **user** — personal accounts work too.
- Existing checkouts are updated with `git pull --ff-only`. Anything diverged or with a dirty tree is **skipped and flagged**, never clobbered.
- `--limit` defaults high (1000) so nothing is silently cut off. Raise it for orgs with more repos.
- Private repos are included automatically once your `gh` session has the right scopes.
- Colors auto-disable when output isn't a terminal (piping, logs, CI).

## Requirements

- [`gh`](https://cli.github.com) — authenticated (`gh auth login`)
- `git`
- `bash` 4+ (for `mapfile`)

## Upgrade / remove

```bash
gh extension upgrade orgsync
gh extension remove orgsync
```

## License

MIT — see [LICENSE](LICENSE).
