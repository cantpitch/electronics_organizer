#import "lib/resistor_svg.typ": draw_resistor_4band, draw_resistor_5band

#set page(width: 15cm, height: auto, margin: 1cm)
#set text(font: "Arial", size: 10pt)

= Resistor SVG Demo

== 4-Band Resistors

=== 470Ω (Yellow-Violet-Brown-Gold)
#draw_resistor_4band(
  band1_color: "yellow",
  band2_color: "violet",
  band3_color: "brown",
  band4_color: "gold",
)

=== 10kΩ (Brown-Black-Orange-Gold)
#draw_resistor_4band(
  band1_color: "brown",
  band2_color: "black",
  band3_color: "orange",
  band4_color: "gold",
)

=== 1MΩ (Brown-Black-Green-Gold)
#draw_resistor_4band(
  band1_color: "brown",
  band2_color: "black",
  band3_color: "green",
  band4_color: "gold",
)

== 5-Band Resistors

=== 1.2kΩ (Brown-Red-Black-Brown-Gold)
#draw_resistor_5band(
  band1_color: "brown",
  band2_color: "red",
  band3_color: "black",
  band4_color: "brown",
  band5_color: "gold",
)

=== 22.6kΩ (Red-Red-Blue-Red-Gold)
#draw_resistor_5band(
  band1_color: "red",
  band2_color: "red",
  band3_color: "blue",
  band4_color: "red",
  band5_color: "gold",
)

== Color Reference

#table(
  columns: (1fr, 1fr),
  [*Color*], [*Available*],
  [Black], [✓],
  [Brown], [✓],
  [Red], [✓],
  [Orange], [✓],
  [Yellow], [✓],
  [Green], [✓],
  [Blue], [✓],
  [Violet], [✓],
  [Grey], [✓],
  [White], [✓],
  [Gold], [✓],
  [Silver], [✓],
)
