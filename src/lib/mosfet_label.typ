
#let mosfet_label(csv_row) = {
  grid.cell[
    #grid(
      columns: (2.25cm, 2.25cm),
      rows: (0.62cm, 1.7cm, 0.38cm, 1.8cm),
      stroke: (thickness: 1pt),
      // name of the component
      grid.cell(align: center + horizon, fill: rgb("#bc0013"), colspan: 2)[#text(
        size: 16pt,
        weight: "bold",
        fill: white,
      )[#csv_row.component]],

      // QR code and diagram
      grid.cell(
        align: left + horizon,
        colspan: 2,
        box(inset: (left: 1pt, bottom: 1pt), image("../images/qrcodes/" + csv_row.qrcode, width: 1.6cm, fit: "contain"))
          + box(inset: (left: 1pt, top: 1pt, bottom: 1pt), image(
            "../images/diagrams/" + csv_row.diagram,
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

      grid.cell(inset: 1pt, text(size: 7pt, eval(csv_row.stats_1, mode: "markup"))),

      grid.vline(x: 1, start: 3, end: 4, stroke: none),

      grid.cell(inset: 1pt, text(size: 7pt, eval(csv_row.stats_2, mode: "markup"))),
    )
  ]
}
