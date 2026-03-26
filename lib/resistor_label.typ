#import "resistor_svg.typ": (
  draw_resistor_4band, draw_resistor_5band, resistor_colors, resistor_colors_by_value,
  resistor_tolerance_color_by_value,
)

#let resistor_bands_4(ohms, tolerance) = {
  let value = decimal(ohms)
  let multiplier = 1
  let multiplier_idx = 0
  if value >= 100 {
    while value >= 100 {
      value = value / 10
      multiplier = multiplier * 10
      multiplier_idx = int(calc.log(multiplier))
    }
  } else {
    if value < 10 {
      value = value * 10
      multiplier_idx = 10
    }
  }


  let band1_value = calc.floor(value / 10)
  let band2_value = calc.rem(calc.floor(value), 10)

  let band1_color = resistor_colors_by_value.at(band1_value)
  let band2_color = resistor_colors_by_value.at(band2_value)
  let band3_color = resistor_colors_by_value.at(multiplier_idx)
  let band4_color = resistor_tolerance_color_by_value.at(tolerance)

  (band1_color, band2_color, band3_color, band4_color)
}

#let resistor_bands_5(ohms, tolerance) = {
  let value = decimal(ohms)
  let multiplier = 1
  let multiplier_idx = 0

  if value >= 1000 {
    while value >= 1000 {
      value = value / 10
      multiplier = multiplier * 10
      multiplier_idx = int(calc.log(multiplier))
    }
  } else {
    if value < 10 {
      value = value * 100
      multiplier_idx = 11
    } else if value < 100 {
      value = value * 10
      multiplier_idx = 10
    }
  }


  let band1_value = calc.floor(value / 100)
  let band2_value = calc.rem(calc.floor(value / 10), 10)
  let band3_value = calc.rem(calc.floor(value), 10)

  let band1_color = resistor_colors_by_value.at(band1_value)
  let band2_color = resistor_colors_by_value.at(band2_value)
  let band3_color = resistor_colors_by_value.at(band3_value)
  let band4_color = resistor_colors_by_value.at(multiplier_idx)
  let band5_color = resistor_tolerance_color_by_value.at(tolerance)

  (band1_color, band2_color, band3_color, band4_color, band5_color)
}

#let resistor_label(csv_row) = {
  let (c1, c2, c3, c4) = resistor_bands_4(csv_row.resistance, csv_row.tolerance)
  let (c1_5, c2_5, c3_5, c4_5, c5_5) = resistor_bands_5(csv_row.resistance, csv_row.tolerance)
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
  grid.cell[
    #grid(
      columns: 4.5cm,
      rows: (0.62cm, 1.82cm, 0.24cm, 1.82cm),
      stroke: (thickness: 1pt),
      // name of the component
      grid.cell(align: center + horizon, fill: rgb("#000000"))[#text(
          size: 16pt,
          weight: "bold",
          fill: white,
        )[#resistance #suffix]

        #place(rect(fill: resistor_colors.at(c3), width: 0.62cm, height: 0.60cm), dx: 3.8cm, dy: -0.5cm)],

      // QR code and diagram
      grid.cell(
        align: center + horizon,
        draw_resistor_4band(
          band1_color: c1,
          band2_color: c2,
          band3_color: c3,
          band4_color: c4,
          width: 4.5cm,
        ),
      ),

      // description
      grid.cell(align: center + horizon, fill: black)[#text(
        size: 8pt,
        weight: "bold",
        fill: white,
        "5 band resistor",
      )],

      // 5 band resistor
      grid.cell(
        draw_resistor_5band(
          band1_color: c1_5,
          band2_color: c2_5,
          band3_color: c3_5,
          band4_color: c4_5,
          band5_color: c5_5,
          width: 4.5cm,
        ),
      ),
    )
  ]
}
