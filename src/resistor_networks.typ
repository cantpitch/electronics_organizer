#import "lib/label_grid.typ" as lg
#import "lib/resistor_network_label.typ" as cl

#let data = csv("resistor_networks.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: cl.resistor_network_label.with())
