# Resume — Ishan Singh

LaTeX resume compiled with [Tectonic](https://tectonic-typesetting.github.io/), a self-contained LaTeX engine that auto-downloads packages on first run.

## Quick Start

```bash
# 1. Install tectonic
make setup

# 2. Build PDF
make build

# 3. Build and open PDF
make open
```

## Setup by OS

### macOS
```bash
brew install tectonic
```

### Linux (Ubuntu/Debian)
```bash
curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net | sh
sudo mv tectonic /usr/local/bin/
```

### Windows
```powershell
winget install tectonic-typesetting.tectonic
```

Or download from [tectonic releases](https://github.com/tectonic-typesetting/tectonic/releases).

## Make Targets

| Command       | Description                                      |
|---------------|--------------------------------------------------|
| `make setup`  | Install tectonic for your OS                     |
| `make build`  | Compile `resume.tex` → `resume.pdf`              |
| `make open`   | Build and open the PDF in your default viewer    |
| `make watch`  | Auto-rebuild on file changes (uses fswatch/inotifywait/polling) |
| `make clean`  | Remove generated files                           |

## Editing

Edit `resume.tex` directly. The file is structured with clearly marked sections:

- **Heading** — name, email, phone, LinkedIn, portfolio
- **Summary** — one-line professional summary
- **Technical Skills** — tabular layout with categories
- **Experience** — reverse chronological with bullet points
- **Projects** — one-liner descriptions with links
- **Education** — degree and GPA

Run `make build` after editing to regenerate the PDF.

## Dependencies

Only **tectonic** is required. It downloads all LaTeX packages (charter, titlesec, etc.) automatically on first compile. No TeX Live or MacTeX installation needed.
