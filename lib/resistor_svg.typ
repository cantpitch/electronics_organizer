#import "util.typ": title_case

#let resistor_colors_by_value = (
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white",
  "gold",
  "silver",
)

#let resistor_tolerance_color_by_value = (
  "10": "silver",
  "5": "gold",
  "1": "brown",
  "2": "red",
  "0.5": "green",
  "0.25": "blue",
  "0.1": "violet",
  "0.05": "grey",
)

#let resistor_colors = (
  "black": rgb("#000000"),
  "brown": rgb("#654321"),
  "red": rgb("#ff0000"),
  "orange": rgb("#ff8800"),
  "yellow": rgb("#ffff00"),
  "green": rgb("#00ff00"),
  "blue": rgb("#0000ff"),
  "violet": rgb("#8800ff"),
  "grey": rgb("#808080"),
  "white": rgb("#ffffff"),
  "gold": rgb("#d4af37"),
  "silver": rgb("#bcc6cc"),
)

// 4-band resistor positions (adjust based on SVG viewBox 200x80)
#let band_positions_4 = (
  band1: (x: 55, y: 20, width: 8, height: 40),
  band2: (x: 80, y: 20, width: 8, height: 40),
  band3: (x: 105, y: 20, width: 8, height: 40),
  band4: (x: 140, y: 20, width: 8, height: 40),
)

// 5-band resistor positions
#let band_positions_5 = (
  band1: (x: 55, y: 20, width: 7, height: 40),
  band2: (x: 75, y: 20, width: 7, height: 40),
  band3: (x: 95, y: 20, width: 7, height: 40),
  band4: (x: 115, y: 20, width: 7, height: 40),
  band5: (x: 140, y: 20, width: 7, height: 40),
)


#let draw_resistor_4band(
  band1_color: "brown",
  band2_color: "black",
  band3_color: "red",
  band4_color: "gold",
  width: 4.5cm,
) = {
  context {
    let img = image("../images/diagrams/resistors/4-band.svg", width: width, fit: "contain")
    let size = measure(img)
    let scale = size.width / 200pt

    box(
      width: width,
    )[
      #img
      // Overlay color bands - positions calculated relative to image width
      #place(
        dx: 55pt * scale,
        dy: -(74pt * scale),
        rect(fill: resistor_colors.at(band1_color), width: 8pt * scale, height: 38pt * scale),
      )
      #place(
        dx: 80pt * scale,
        dy: -(74pt * scale),
        rect(fill: resistor_colors.at(band2_color), width: 8pt * scale, height: 38pt * scale),
      )
      #place(
        dx: 105pt * scale,
        dy: -(74pt * scale),
        rect(fill: resistor_colors.at(band3_color), width: 8pt * scale, height: 38pt * scale),
      )
      #place(
        dx: 140pt * scale,
        dy: -(74pt * scale),
        rect(fill: resistor_colors.at(band4_color), width: 8pt * scale, height: 38pt * scale),
      )

      #place(dx: 40pt * scale, dy: -(10pt * scale), rotate(-45deg, origin: top + left, text(
        size: 6pt,
        weight: "bold",
        title_case(band1_color),
      )))

      #place(dx: 65pt * scale, dy: -(10pt * scale), rotate(-45deg, origin: top + left, text(
        size: 6pt,
        weight: "bold",
        title_case(band2_color),
      )))

      #place(dx: 90pt * scale, dy: -(10pt * scale), rotate(-45deg, origin: top + left, text(
        size: 6pt,
        weight: "bold",
        title_case(band3_color),
      )))

      #place(dx: 125pt * scale, dy: -(10pt * scale), rotate(-45deg, origin: top + left, text(
        size: 6pt,
        weight: "bold",
        title_case(band4_color),
      )))
    ]
  }
}


#let draw_resistor_5band(
  band1_color: "brown",
  band2_color: "black",
  band3_color: "black",
  band4_color: "red",
  band5_color: "gold",
  width: 4.5cm,
) = {
  context {
    let img = image("../images/diagrams/resistors/5-band.svg", width: width, fit: "contain")
    let size = measure(img)
    let scale = size.width / 200pt

    box(
      width: width,
    )[
      #img
      // Overlay color bands - positions calculated relative to image width
      #place(
        dx: 55pt * scale,
        dy: -(74pt * scale),
        rect(fill: resistor_colors.at(band1_color), width: 7pt * scale, height: 38pt * scale),
      )
      #place(
        dx: 75pt * scale,
        dy: -(74pt * scale),
        rect(fill: resistor_colors.at(band2_color), width: 7pt * scale, height: 38pt * scale),
      )
      #place(
        dx: 95pt * scale,
        dy: -(74pt * scale),
        rect(fill: resistor_colors.at(band3_color), width: 7pt * scale, height: 38pt * scale),
      )
      #place(
        dx: 115pt * scale,
        dy: -(74pt * scale),
        rect(fill: resistor_colors.at(band4_color), width: 7pt * scale, height: 38pt * scale),
      )
      #place(
        dx: 140pt * scale,
        dy: -(74pt * scale),
        rect(fill: resistor_colors.at(band5_color), width: 7pt * scale, height: 38pt * scale),
      )

      #place(dx: 40pt * scale, dy: (-10pt * scale), rotate(-45deg, origin: top + left, text(
        size: 6pt,
        weight: "bold",
        title_case(band1_color),
      )))

      #place(dx: 60pt * scale, dy: (-10pt * scale), rotate(-45deg, origin: top + left, text(
        size: 6pt,
        weight: "bold",
        title_case(band2_color),
      )))

      #place(dx: 80pt * scale, dy: (-10pt * scale), rotate(-45deg, origin: top + left, text(
        size: 6pt,
        weight: "bold",
        title_case(band3_color),
      )))

      #place(dx: 100pt * scale, dy: (-10pt * scale), rotate(-45deg, origin: top + left, text(
        size: 6pt,
        weight: "bold",
        title_case(band4_color),
      )))

      #place(dx: 125pt * scale, dy: (-10pt * scale), rotate(-45deg, origin: top + left, text(
        size: 6pt,
        weight: "bold",
        title_case(band5_color),
      )))
    ]
  }
}

// Example usage:
// #draw_resistor_4band(
//   band1_color: "brown",
//   band2_color: "black",
//   band3_color: "red",
//   band4_color: "gold",
// )
