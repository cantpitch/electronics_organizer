#import "lib/label_grid.typ" as lg
#import "lib/ic_label.typ" as ic

#let data = csv("ics.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: ic.ic_label)

