#import "@preview/cetz:0.2.2" as cetz: draw
#import "@preview/fletcher:0.4.2" as fletcher: node, edge, shapes

#let _label(label, anchor: "north", padding: 0.5em, name: "node") = {
  let opposite-anchor = (
    "north-west": "south-east",
    "north": "south",
    "north-east": "south-west",
    "west": "east",
    "center": "center",
    "east": "west",
    "south-west": "north-east",
    "south": "north",
    "south-east": "north-west",
  ).at(anchor)
  
  draw.content((name: name, anchor: anchor), label, anchor: opposite-anchor, padding: padding)
}

#let p(pos, label, tokens: 0, label-args: (), ..args) = {
  node(
    pos,
    [],
    shape: (node, extrude) => {
      draw.circle((0,0), radius: 1em, name: "node")

      _label(label, ..label-args)

      let token(pos, name: "") = draw.circle(pos, radius: 0.2em, fill: black, stroke: black, name: name)
      // so that the tokens are equally spaced
      let radius(n_tokens) = (0.12 / calc.sin(180deg / n_tokens)) 

      let ngon(n, start-angle: 90deg) = {
        for k in range(n) {
          token((start-angle + 360deg * k / n, radius(n)))
        }
      }
      
      if tokens == 0 {
      } else if tokens == 1 {
        token((0,0))
      } else if tokens == 2 {
        ngon(tokens, start-angle: 0deg)
      } else if tokens in range(3, 7) {
        ngon(tokens)
      } else if tokens == 7 {
        ngon(6)
        token((0,0))
      } else {
        token((0,0), name: "token")
        draw.content("token.south", text(size:0.7em)[#tokens], anchor: "north", padding: 0.05em)
      }
    },
    ..args
  )
}

#let t(pos, label, width: 0.4em, height: 2.5em, label-args: (), ..args) = {
  node(
    pos,
    [],
    shape: (node, extrude) => {
      draw.rect(
        (- (width / 2), - (height / 2)),
        (  (width / 2),   (height / 2)),
        fill: green.lighten(60%),
        ..args,
        name: "node"
      )

      _label(label, ..label-args)
      // draw.content((name: "node", anchor: 180deg), label, anchor: "east", padding: .4em)
      // draw.content("node.north", label, anchor: "south", padding: .5em)
    }
  )
}
