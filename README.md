# check-crlf-action

A GitHub Action that fails if any tracked files in the repository contain CRLF line endings.

## Usage

```yaml
- name: Check for CRLF line endings
  uses: gi-org-pl/check-crlf-action@v1
  with:
    base-ref: ${{ github.base_ref }}
```

## Inputs

| Input      | Description                    | Required | Default |
|------------|--------------------------------|----------|---------|
| `base-ref` | Base branch to compare against | No       | `main`  |

## Example workflow

```yaml
name: PR Sanity Checks

on:
  pull_request:

jobs:
  check:
    runs-on: ubuntu-24.04
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Check for CRLF line endings
        uses: gi-org-pl/check-crlf-action@v1
        with:
          base-ref: ${{ github.base_ref }}
```

## How it works

The action scans all tracked files using `git ls-files --eol` and fails the workflow if any file contains CRLF (`\r\n`)
line endings. This helps enforce consistent LF line endings across the codebase.

To fix CRLF files locally, add the following to your `.gitattributes`:

```
* text=auto eol=lf
```

Then re-normalize with:

```bash
git add --renormalize .
git commit -m "chore: normalize line endings to LF"
```

## Authors

Action author is [Oskar Barcz](https://github.com/oskarbarcz), CTO of **[Generacja Innowacja](https://gi.org.pl)** — 
Poland's first technology-first NGO.

## License

MIT
