
#let fet_label(csv_row) = {
  grid.cell[
    #grid(
      columns: (2.25cm, 2.25cm),
      rows: (0.62cm, 1.7cm, 0.38cm, 1.8cm),
      stroke: (thickness: 1pt),
      // name of the component
      grid.cell(align: left + horizon, fill: rgb("#b7f3f5"))[#text(
        size: 13pt,
        weight: "bold",
        fill: black,
      )[#sym.space#csv_row.component]],

      grid.vline(x: 1, start: 0, end: 4, stroke: none),

      grid.cell(align: right + horizon, fill: rgb("#b7f3f5"))[#text(
        size: 10pt,
        weight: "bold",
        fill: if csv_row.channel == "P" { rgb("#1739f5") } else { rgb("#e73323") },
      )[#if csv_row.channel == "P" [ P-channel ] else [ N-channel ] #sym.space]],

      // diagrams
      grid.cell(
        align: center + horizon,
        box(inset: 2pt, image(
          "../images/diagrams/fets/" + csv_row.schematic,
          width: 1.6cm,
          fit: "contain",
        )),
      ),

      grid.cell(
        align: center + horizon,
        box(inset: 2pt, image(
          "../images/diagrams/fets/" + csv_row.drawing,
          width: 2.8cm,
          fit: "contain",
        )),
      ),

      // description
      grid.cell(align: center + horizon, colspan: 2, fill: black)[#text(
        size: int(csv_row.desc_pt) * 1pt,
        weight: "bold",
        fill: white,
      )[#csv_row.description]],

      grid.cell(
        align: center + horizon,
        box(inset: 2pt, image(
          "../images/qrcodes/fets/" + csv_row.qrcode,
          width: 2.8cm,
          fit: "contain",
        )),
      ),
    )
  ]
}
