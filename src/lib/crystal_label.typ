#import "util.typ": title_case


#let crystal_label(csv_row) = {
  grid.cell[
    #grid(
      columns: (2.25cm, 2.25cm),
      rows: (0.62cm, 2.70cm, 1.18cm),
      stroke: (thickness: 1pt),

      // color
      grid.cell(align: center + horizon, inset: (left: 8pt), fill: blue, colspan: 2, text(
        size: 14pt,
        weight: "bold",
        fill: white,
        "Crystal",
      )),

      grid.vline(x: 1, start: 1, end: 2, stroke: none),

      grid.cell(
        align: left + horizon,
        box(inset: (left: 1pt, top: 2pt, bottom: 2pt))[#image(
          "../images/examples/crystal.jpg",
          width: 2.2cm,
          fit: "contain",
        )],
      ),

      grid.cell(align: center + horizon, text(weight: "bold", size: 12pt, csv_row.freq + " MHz")),

      grid.hline(y: 2, start: 0, end: 2, stroke: rgb("#bbbbbb")),

      grid.cell(inset: 3pt, colspan: 2, fill: rgb("#eeeeee"), text(size: 8pt)[
        #csv_row.applications
      ]),
    )
  ]
}
