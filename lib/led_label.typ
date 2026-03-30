#import "util.typ": title_case

#let led_label(csv_row) = {
  grid.cell[
    #grid(
      columns: (2.25cm, 2.25cm),
      rows: (0.62cm, 2.78cm, 1.1cm),
      stroke: (thickness: 1pt),

      // color
      grid.cell(align: center + horizon, inset: (left: 8pt), fill: black, colspan: 2, text(
        size: 14pt,
        weight: "bold",
        fill: white,
        title_case(csv_row.color) + " LED",
      )),

      grid.vline(x: 1, start: 1, end: 2, stroke: none),

      grid.cell(
        align: left + horizon,
        box(inset: (left: 1pt, top: 2pt, bottom: 2pt))[#image(
          "../images/examples/" + csv_row.example,
          width: 2.2cm,
          fit: "contain",
        )],
      ),

      grid.cell(align: center + horizon, box(inset: (left: 1pt, top: 2pt, bottom: 2pt))[#image(
        "../images/diagrams/" + csv_row.diagram,
        width: 2.2cm,
        fit: "contain",
      )]),

      grid.hline(y: 2, start: 0, end: 2, stroke: rgb("#bbbbbb")),

      grid.cell(inset: 3pt, colspan: 2, fill: rgb("#eeeeee"), text(size: 8pt)[
        *V#sub[f] =* #csv_row.Vlow - #csv_row.Vhigh V\
        *I#sub[f] =* #csv_row.If
      ]),
    )
  ]
}
