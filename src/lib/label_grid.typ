
#let label_grid(data: none, generate_label: none, doc) = {
  set page(margin: 0.5in)
  set text(font: "Helvetica", size: 10pt)

  grid(
    columns: (4.5cm, 4.5cm, 4.5cm, 4.5cm),
    rows: calc.ceil(data.len() / 4),
    stroke: (thickness: 1pt),
    ..data.map(generate_label)
  )
}

