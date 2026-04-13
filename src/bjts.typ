#import "lib/label_grid.typ" as lg
#import "lib/bjt_label.typ" as ic

#let data = csv("bjts.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: ic.bjt_label)

