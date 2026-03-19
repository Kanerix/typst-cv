#import "helpers.typ": accent, light-bg, body-fg, muted, section-title, entry, sidebar-section, sidebar-item, sidebar-item-link, skill-bar

#let name      = "Kasper Jønsson"
#let email     = "kas@lerpz.com"
#let phone     = "+45 60 18 80 69"
#let location  = "Brøndby, 2605"
#let linkedin  = "https://www.linkedin.com/in/kasper-jonsson/"

#set page(
  paper: "a4",
  margin: (top: 0pt, bottom: 0pt, left: 0pt, right: 0pt),
)

#set text(font: "Poppins", size: 10pt, fill: body-fg)
#set par(leading: 0.65em)

#let sidebar-width = 30%

#grid(
  columns: (1fr, sidebar-width),
  gutter: 0pt,

  box(
    width: 100%,
    inset: (top: 36pt, bottom: 36pt, left: 36pt, right: 24pt),
  )[
    #text(size: 28pt, weight: "bold", fill: accent)[#name]
    #linebreak()
    #v(0mm)
    #text(size: 13pt, fill: muted)[Student Worker]
    #v(-2pt)

    #section-title("Summary")
    #include "summary.typ"

    #section-title("Experience")
    #include "jobs.typ"

    #section-title("Education")
    #include "education.typ"
  ],

  box(
    width: 100%,
    height: 100%,
    fill: accent,
    inset: (top: 36pt, bottom: 36pt, left: 16pt, right: 16pt),
  )[
    #align(center)[
      #box(
        width: 100pt,
        height: 100pt,
        radius: 50pt,
        clip: true,
        stroke: 2pt + white,
      )[
        #place(top + center, image("kasper.jpg", width: 160pt, height: 200pt))
      ]
    ]

    #sidebar-section("Contact")
    #sidebar-item("📧", phone)
    #sidebar-item("📧", email)
    #sidebar-item("📍", location)
    #sidebar-item-link("🔗", "LinkedIn", linkedin)

    #sidebar-section("Skills")
    #skill-bar("Python", 90%)
    #skill-bar("Rust", 80%)
    #skill-bar("TypeScript", 85%)
    #skill-bar("Docker / K8s", 75%)
    #skill-bar("SQL / NoSQL", 70%)

    #sidebar-section("Languages")
    #sidebar-item("🌍", "Danish — Native")
    #sidebar-item("🌍", "English — Fluent")

    #sidebar-section("Interests")
    #text(size: 9pt, fill: white.transparentize(10%))[
      - Problem-solving
      - Infra development
      - AI platform dev
      - Workflow automation
    ]
  ],
)
