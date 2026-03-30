#import "lib/label_grid.typ" as lg
#import "lib/potentiometer_label.typ" as pl

#let data = csv("potentiometers.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: pl.potentiometer_label)
