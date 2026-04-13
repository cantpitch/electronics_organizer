#import "lib/label_grid.typ" as lg
#import "lib/mosfet_label.typ" as mf

#let data = csv("mosfets.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: mf.mosfet_label)
