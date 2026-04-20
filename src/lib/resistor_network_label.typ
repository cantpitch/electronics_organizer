
#let resistor_network_label(csv_row) = {
  let resistance = float(csv_row.resistance)
  let suffix = sym.Omega
  if resistance >= 1e6 {
    resistance = resistance / 1e6
    suffix = "M" + sym.Omega
  } else if resistance >= 1e3 {
    resistance = resistance / 1e3
    suffix = "K" + sym.Omega
  } else {
    suffix = sym.Omega
  }

  let color = rgb("#7e6509")


  let res_image = if csv_row.pins == "10" {
    "../images/examples/res_net/10SIP.png"
  } else if csv_row.pins == "9" {
    "../images/examples/res_net/9SIP.jpg"
  } else if csv_row.pins == "8" {
    "../images/examples/res_net/8SIP.jpg"
  } else {
    "../images/examples/res_net/default.png"
  }

  grid.cell[
    #grid(
      columns: (2.25cm, 2.25cm),
      rows: (0.62cm, 2.08cm, 1.8cm),
      stroke: (thickness: 1pt),

      // resistance
      grid.cell(align: left + horizon, inset: (left: 8pt), fill: color, text(
        size: 14pt,
        weight: "bold",
        fill: white,
        str(resistance) + " " + suffix,
      )),

      grid.vline(x: 1, start: 0, end: 1, stroke: none),

      grid.cell(
        align: right + horizon,
        fill: color,
        inset: (right: 8pt),
        text(
          size: 14pt,
          weight: "bold",
          fill: white,
          csv_row.pins + "SIP",
        ),
      ),

      // QR code and diagram
      grid.cell(
        align: left + horizon,
        colspan: 2,
        box(inset: (left: 1pt, top: 2pt, bottom: 2pt))[#image(
          res_image,
          width: 4.5cm,
          fit: "contain",
        )],
      ),

      grid.hline(y: 2, start: 0, end: 2, stroke: rgb("#bbbbbb")),

      grid.cell(inset: 3pt, colspan: 2, fill: rgb("#eeeeee"), text(size: 10pt)[
        Resistance: *#str(resistance) #suffix* \
        Pins: *#csv_row.pins* \
        Resistors: *#{ int(csv_row.pins) - 1 }*

      ]),
    )
  ]
}
