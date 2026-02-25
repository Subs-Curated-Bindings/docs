# Docs Contributor Guide

This folder contains the documentation site for **Subliminal's Curated Bindings**.

If you want to improve docs, this is where you work.

## Quickest path (no Docker required)

You can update docs directly on GitHub:

1. Open `docs-site/docs/` in the repository
2. Click a `.md` file you want to update
3. Click **Edit this file** (pencil icon)
4. Commit to a branch and open a Pull Request

After merge to `main`, the docs site auto-deploys via GitHub Actions.

Use Docker only when you want local preview before opening a PR.

## What to edit

- Edit Markdown pages in `docs-site/docs/`
- Update navigation in `docs-site/mkdocs.toml` (`nav = [...]`)
- Add/update assets under `docs-site/docs/assets/`
- Update styles in `docs-site/docs/stylesheets/extra.css` when needed

Do **not** manually edit generated files in `docs-site/site/`.

## Local preview (recommended)

From repo root:

```bash
docker compose -f docs-site/docker-compose.yml up
```

Then open:

- `http://localhost:8000`

Stop preview:

```bash
docker compose -f docs-site/docker-compose.yml down
```

## Local build check

From repo root:

```bash
docker run --rm \
  -v "$PWD":/work \
  -w /work/docs-site \
  zensical/zensical:latest \
  build -f mkdocs.toml
```

A successful build outputs static files to `docs-site/site/`.

## VS Code tasks

This repo includes tasks:

- `Zensical: Serve`
- `Zensical: Build`
- `Zensical: Stop`

They run from `docs-site/`.

## Contributor workflow

1. Create a branch
2. Edit files in `docs-site/docs/`
3. Run local preview/build
4. Commit only source changes (not generated site output)
5. Open a Pull Request

## Deploy behavior

Deployment is handled by:

- `.github/workflows/deploy.yml`

It runs on:

- pushes to `main` that touch `docs-site/**` or the workflow itself
- manual run via `workflow_dispatch`

It builds docs and force-pushes generated output to `gh-pages`.

## Troubleshooting quick checks

- Confirm `docs-site/mkdocs.toml` exists
- Confirm `docs-site/docs/index.md` exists
- Confirm `.github/workflows/deploy.yml` exists and is enabled
- Confirm GitHub Pages source is `gh-pages` (root)
