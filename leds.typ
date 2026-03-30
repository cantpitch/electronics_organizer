#import "lib/label_grid.typ" as lg
#import "lib/led_label.typ" as ll

#let data = csv("leds.csv", row-type: dictionary)

#show: lg.label_grid.with(data: data, generate_label: ll.led_label)
