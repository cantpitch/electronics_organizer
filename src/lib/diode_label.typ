
#let diode_label(csv_row) = {
  grid.cell[
    #grid(
      columns: (2.25cm, 2.25cm),
      rows: (0.62cm, 1.3cm, 0.38cm, 2.2cm),
      stroke: (thickness: 1pt),
      // name of the component
      grid.cell(align: center + horizon, colspan: 2, fill: purple)[#text(
        size: 13pt,
        weight: "bold",
        fill: white,
        csv_row.name,
      )],

      grid.vline(x: 1, start: 0, end: 4, stroke: none),

      // diagrams
      grid.cell(
        align: center + horizon,
        colspan: 2,
        box(inset: 2pt, image(
          "../images/diagrams/diodes/" + csv_row.diagram,
          width: 4.2cm,
          fit: "cover",
        )),
      ),

      // description
      grid.cell(align: center + horizon, colspan: 2, fill: black)[#text(
        size: int(csv_row.desc_pt) * 1pt,
        weight: "bold",
        fill: white,
      )[#csv_row.desc]],

      grid.cell(
        align: left + top,
        box(inset: (left: 1pt, top: 2pt), text(size: 9pt)[
          #{ if csv_row.IfAV != "" [ I#sub[F(AV)] = *#csv_row.IfAV*\ ] }
          #{ if csv_row.Ifsm != "" [I#sub[FSM] = *#csv_row.Ifsm*\ ] }
          #{ if csv_row.Vrrm != "" [ V#sub[RRM] = *#csv_row.Vrrm*\ ] }
          #{ if csv_row.Vr != "" [ V#sub[R] = *#csv_row.Vr*\ ] }
          #{ if csv_row.fM != "" [ f#sub[M] = *#csv_row.fM*\ ] }
          #{ if csv_row.Vzmin != "" [ V#sub[Zmin] = *#csv_row.Vzmin*\ ] }
          #{ if csv_row.Vzmax != "" [ V#sub[Zmax] = *#csv_row.Vzmax*\ ] }
          #{ if csv_row.Vztyp != "" [ V#sub[Ztyp] = *#csv_row.Vztyp*\ ] }
          #{ if csv_row.Iz != "" [ I#sub[Z] = *#csv_row.Iz*\ ] }
        ]),
      ),

      grid.cell(
        align: left + top,
        box(inset: (right: 1pt, top: 2pt), text(size: 9pt)[
          #{ if csv_row.Trr != "" [ t#sub[RR] = *#csv_row.Trr*\ ] }
          #{ if csv_row.Pmax != "" [ P#sub[max] = *#csv_row.Pmax*\ ] }
          #{ if csv_row.Ir != "" [ I#sub[R] = *#csv_row.Ir*\ ] }
          #{ if csv_row.Zz != "" [ Z#sub[z] = *#csv_row.Zz* #sym.Omega\ ] }
          #{ if csv_row.Zzk != "" [ Z#sub[zk] = *#csv_row.Zzk* #sym.Omega\ ] }
          #{ if csv_row.Izk != "" [ I#sub[zk] = *#csv_row.Izk*\ ] }
          #{ if csv_row.Izsm != "" [ I#sub[zsm] = *#csv_row.Izsm*\ ] }
        ]),
      ),
    )
  ]
}
