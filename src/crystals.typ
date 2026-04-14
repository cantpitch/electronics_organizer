#import "lib/label_grid.typ" as lg
#import "lib/crystal_label.typ" as pl

#let data = csv("crystals.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: pl.crystal_label)
