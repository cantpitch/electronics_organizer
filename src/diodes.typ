#import "lib/label_grid.typ" as lg
#import "lib/diode_label.typ" as mf

#let data = csv("diodes.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: mf.diode_label)
