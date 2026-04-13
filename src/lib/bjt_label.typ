
#let bjt_label(csv_row) = {
  grid.cell[
    #grid(
      columns: (2.25cm, 2.25cm),
      rows: (0.62cm, 1.7cm, 0.38cm, 1.8cm),
      stroke: (thickness: 1pt),
      // name of the component
      grid.cell(align: left + horizon, fill: rgb("#e4fb9a"))[#text(
        size: 16pt,
        weight: "bold",
        fill: black,
      )[#sym.space#csv_row.component]],

      grid.vline(x: 1, start: 0, end: 4, stroke: none),

      grid.cell(align: right + horizon, fill: rgb("#e4fb9a"))[#text(
        size: 14pt,
        weight: "bold",
        fill: if csv_row.type == "NPN" { rgb("#1739f5") } else { rgb("#e73323") },
      )[#csv_row.type#sym.space]],

      // diagrams
      grid.cell(
        align: center + horizon,
        box(inset: 2pt, image(
          "../images/diagrams/bjts/" + csv_row.schematic,
          width: 1.6cm,
          fit: "contain",
        )),
      ),

      grid.cell(
        align: center + horizon,
        box(inset: 2pt, image(
          "../images/diagrams/bjts/" + csv_row.drawing,
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

      grid.cell(grid(
        columns: (2.25cm, 2.25cm),
        rows: 4,
        grid.cell(inset: (top: 4pt, left: 2pt), text(size: 7pt, eval(csv_row.c1r1, mode: "markup"))),
        grid.cell(inset: (top: 4pt, right: 2pt), text(size: 7pt, eval(csv_row.c2r1, mode: "markup"))),
        grid.cell(inset: (top: 4pt, left: 2pt), text(size: 8pt, eval(csv_row.c1r2, mode: "markup"))),
        grid.cell(inset: (top: 4pt, right: 2pt), text(size: 7pt, eval(csv_row.c2r2, mode: "markup"))),
        grid.cell(inset: (top: 4pt, left: 2pt), text(size: 8pt, eval(csv_row.c1r3, mode: "markup"))),
        grid.cell(inset: (top: 4pt, right: 2pt), text(size: 7pt, eval(csv_row.c2r3, mode: "markup"))),
        grid.cell(inset: (top: 4pt, left: 2pt), text(size: 8pt, eval(csv_row.c1r4, mode: "markup"))),
        grid.cell(inset: (top: 4pt, right: 2pt), text(size: 7pt, eval(csv_row.c2r4, mode: "markup"))),
      )),
    )
  ]
}
