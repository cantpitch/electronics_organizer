#import "lib/label_grid.typ" as lg
#import "lib/capacitor_label.typ" as cl

#let data = csv("ceramic_caps.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: cl.capacitor_label.with(mode: "ceramic"))
