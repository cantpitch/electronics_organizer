#import "lib/label_grid.typ" as lg
#import "lib/resistor_label.typ" as rs

#let data = csv("resistors.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: rs.resistor_label)
