#import "/src/lib.typ": *
#set page(width: auto, height: auto, margin: 1cm)

#import "@preview/cetz:0.2.2" as cetz: draw

#cetz.canvas({
  place((0,0), [yo])

  place((0,1.5), $P_n$, label-style: (anchor: "west"), tokens: 7)

  place((3,1.5), [], tokens: 8000)
  place((3,0.5), [], tokens: -800)

  draw.set-style(place: (label-style: (anchor: "east", padding: 0.1em)))

  place((0,3), $P_1$, name: "p1", label-style: (anchor: "north"))

  draw.set-style(place: (fill: teal.lighten(60%), stroke: teal.darken(30%)))

  place((5,3), $P_2$, tokens: 2, name: "p2", label-style: (anchor: "north"))

  draw.line("p1", "p2", mark: (end: ">"))
  draw.line("p1.east", "p2", mark: (end: ">"))

  place((0,6), [], tokens: 6)

  transition((5,0), $T_1$)
  transition((6,0), $T_2$, stroke: black)
})
