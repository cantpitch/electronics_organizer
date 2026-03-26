
#let capacitor_label(mode: none, csv_row) = {
  let unit = if csv_row.unit == "uF" { sym.mu + "F" } else { csv_row.unit }
  let capacitance = float(csv_row.capacitance)
  let other_capacitance = if csv_row.unit == "uF" and capacitance < 10.0 {
    eval("*" + str(capacitance * 1000.0) + " nF*", mode: "markup")
  } else if (
    csv_row.unit == "uF"
  ) {
    eval("*" + str(capacitance / 1000.0) + " mF*", mode: "markup")
  }

  let color = if mode == "electrolytic" { rgb("#0e03a7") } else if mode == "ceramic" { rgb("#752b2b") } else {
    rgb("#333333")
  }

  let cap_type = if mode == "electrolytic" {
    "Electrolytic Capacitor"
  } else if mode == "ceramic" {
    "Multilayer Monolithic Ceramic Capacitor"
  } else {
    "Capacitor"
  }

  let cap_image = if mode == "electrolytic" {
    "../images/ElectroliticCap.png"
  } else if mode == "ceramic" {
    "../images/blank_ceramic_cap.png"
  } else {
    "../images/capacitors/default.png"
  }

  // only used for ceramic caps
  let second_unit = if csv_row.unit == "pF" { str(capacitance / 1000.0) + " nF" } else if csv_row.unit == "nF" {
    str(capacitance * 1000.0) + " pF"
  } else { "N/A" }

  // only used for ceramic caps
  let third_unit = if csv_row.unit == "pF" { str(capacitance / 1000000.0) + " " + sym.mu + "F" } else if (
    csv_row.unit == "nF"
  ) {
    str(capacitance / 1000.0) + " " + sym.mu + "F"
  } else { "N/A" }

  let other_capacitance = if mode == "ceramic" {
    eval("*" + second_unit + "* = *" + third_unit + "*", mode: "markup")
  } else { other_capacitance }

  let code_volt_color = if mode == "electrolytic" { rgb("#ffffff") } else { rgb("#ffff00") }

  grid.cell[
    #grid(
      columns: (2.25cm, 2.25cm),
      rows: (0.62cm, 2.08cm, 1.8cm),
      stroke: (thickness: 1pt),

      // capacitance
      grid.cell(align: left + horizon, inset: (left: 8pt), fill: color, text(
        size: 14pt,
        weight: "bold",
        fill: white,
        csv_row.capacitance + " " + unit,
      )),

      grid.vline(x: 1, start: 0, end: 1, stroke: color),

      // voltage rating or cap code
      grid.cell(align: right + horizon, inset: (right: 8pt), fill: color, text(
        size: 14pt,
        weight: "bold",
        fill: code_volt_color,
        if mode == "electrolytic" { csv_row.voltage } else { csv_row.cap_code },
      )),

      grid.vline(x: 1, start: 1, end: 2, stroke: none),

      // QR code and diagram
      grid.cell(
        align: left + horizon,
        box(inset: (left: 1pt, top: 2pt, bottom: 2pt))[#image(
            cap_image,
            width: 2.2cm,
            fit: "contain",
          )
          #if mode == "ceramic" [
            #place(dx: 31%, dy: -80%, text(font: "Consolas", size: 14pt, csv_row.cap_code))]],
      ),

      grid.cell(align: center + horizon, text(size: 11pt, weight: "bold", cap_type)),

      grid.hline(y: 2, start: 0, end: 2, stroke: rgb("#bbbbbb")),

      grid.cell(inset: 3pt, colspan: 2, fill: rgb("#eeeeee"), text(size: 8pt)[
        *#csv_row.capacitance #unit* = #other_capacitance\
        Voltage Rating = *#csv_row.voltage*\
        Tolerance = *#sym.plus.minus#csv_row.tolerance%*\
        Temp. Rating = *#csv_row.temp_min \~ #csv_row.temp_max #{ sym.degree }C*\
      ]),
    )
  ]
}
