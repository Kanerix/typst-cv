# 📄 Typst CV

A clean, two-column CV built with [Typst](https://typst.app/) — featuring a slim sidebar for profile picture, contact details, and skills, alongside a wider main section for experience and education.

## Preview

The latest compiled PDF is available as a [GitHub Release](../../releases/latest).

## Project Structure

```
typst-cv/
├── src/
│   ├── cv.typ             # Main CV layout
│   ├── helpers.typ        # Shared functions & colour palette
│   ├── jobs.typ           # Work experience entries
│   ├── education.typ      # Education entries
│   ├── summary.typ        # Profile summary
│   └── kasper.jpg         # Profile picture
├── Poppins/               # Poppins font family (.ttf files)
├── .github/
│   └── workflows/
│       └── pipeline.yaml  # CI: compile PDF & create GitHub release
├── VERSION                # Current release version
├── LICENSE                # Apache 2.0
└── README.md
```

## Getting Started

### Prerequisites

- [Typst](https://github.com/typst/typst) (v0.12+)

### Compile Locally

```sh
typst compile --font-path Poppins src/cv.typ cv.pdf
```

Or use watch mode for live reloading while editing:

```sh
typst watch --font-path Poppins src/cv.typ cv.pdf
```

The `--font-path Poppins` flag tells Typst where to find the bundled [Poppins](https://fonts.google.com/specimen/Poppins) font files.

## Customisation

### Content

The CV content is split into separate files under `src/` for easy editing:

| File            | Contents                          |
| --------------- | --------------------------------- |
| `cv.typ`        | Page layout, name, and sidebar    |
| `summary.typ`   | Profile summary paragraph         |
| `jobs.typ`      | Work experience entries           |
| `education.typ` | Education entries                 |
| `helpers.typ`   | Shared helper functions & colours |

To add a new job or education entry, use the `entry` function in the respective file:

```typ
#entry(
  title: "Job Title",
  subtitle: "Company Name",
  date: "Jan 2023 – Present",
  description: [
    - Accomplishment one.
    - Accomplishment two.
  ],
)
```

### Colours

The colour palette is defined at the top of `src/helpers.typ`:

```typ
#let accent   = rgb("#2b4a6f")   // Sidebar & headings
#let light-bg = rgb("#eaf0f6")   // Light background accent
#let body-fg  = rgb("#333333")   // Main text colour
#let muted    = rgb("#777777")   // Subtle/secondary text
```

### Profile Picture

The profile picture is displayed in a circular clip in the sidebar. To adjust the zoom and position, modify the `place` call in `src/cv.typ`:

- **Zoom in/out** — increase or decrease the `width` value.

## CI/CD

A GitHub Actions workflow (`.github/workflows/pipeline.yaml`) automatically:

1. **Triggers** when the `VERSION` file is changed (or via manual dispatch).
2. **Compiles** the CV to PDF using Typst.
3. **Creates a GitHub Release** tagged with the version from `VERSION`, with the PDF attached.

To create a new release, simply bump the version in `VERSION` and push:

```sh
echo "1.0.0" > VERSION
git add VERSION
git commit -m "Release v1.0.0"
git push
```

## License

This project is licensed under the [Apache License 2.0](LICENSE).
