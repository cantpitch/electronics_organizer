#import "lib/label_grid.typ" as lg
#import "lib/fet_label.typ" as mf

#let data = csv("fets.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: mf.fet_label)
