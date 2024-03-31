#import "@preview/cetz:0.2.2" as cetz: draw
#import cetz.drawable: path
#import cetz.vector

#let _label(label, labelled-element-name: "", anchor: "north", ..style) = {
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
  
  draw.content(
    (name: labelled-element-name, anchor: anchor),
    label,
    anchor: opposite-anchor,
    ..style
  )
}

/// CeTZ shape for Petri places

#let _token(center, name: "", ..style) = draw.circle(center, name: name, ..style)

#let _place_tokens(tokens, ..style) = {
    let radius(n_tokens) = (0.12 / calc.sin(180deg / n_tokens)) 

    let ngon(n, start-angle: 90deg) = {
      for k in range(n) {
        _token((start-angle + 360deg * k / n, radius(n)), ..style)
      }
    }
    if tokens == 0 {
    } else if tokens == 1 {
      _token((0,0), ..style)
    } else if tokens == 2 {
      ngon(tokens, start-angle: 0deg)
    } else if tokens in range(3, 7) {
      ngon(tokens)
    } else if tokens == 7 {
      ngon(6)
      _token((0,0), ..style)
    } else {
      _token((0,0), name: "token", ..style)
      draw.content("token.south", text(size:0.7em)[#tokens], anchor: "north", padding: 0.07em)
    }
}

#let place(center, label, name: none, ..style) = {
  draw.group(name: name, ctx => {
    let shape-name = "place"

    // Define a default style
    let def-style = (
      tokens: 0,
      radius: 1em,
      label-style: (anchor: "north", padding: 0.5em),
      // TODO: Make the default token radius and spacing dependent on the node radius
      token-style: (radius: 0.2em, spacing: 1em, fill: black)
    )

    let style = cetz.styles.resolve(
      ctx.style,
      merge: style.named(),
      base: def-style,
      root: shape-name
    )

    draw.circle(center, ..style, name: shape-name)
    draw.copy-anchors(shape-name)

    _label(label, labelled-element-name: shape-name, ..style.label-style)

    draw.set-origin(center)
    _place_tokens(style.tokens, ..style.token-style)
  })
}

/// CeTZ shape for Petri transitions

#let transition(center, label, name: none, ..style) = {
  draw.group(name: name, ctx => {
    let shape-name = "transition"

    let def-style = (
      width: 0.4em,
      height: 2.5em,
      fill: black,
      stroke: none,
      label-style: (anchor: "north", padding: 0.5em),
    )

    let style = cetz.styles.resolve(
      ctx.style,
      merge: style.named(),
      base: def-style,
      root: shape-name
    )

    let w = style.width / 2
    let h = style.height / 2

    draw.set-origin(center)
    draw.rect(
      (- w, - h),
      (  w,   h),
      ..style,
      name: shape-name
    )

    _label(label, labelled-element-name: shape-name, ..style.label-style)
  })
}
