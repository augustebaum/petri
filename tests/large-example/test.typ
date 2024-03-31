#import "/src/lib.typ": *
#set page(width: auto, height: auto, margin: 1cm)

#import "@preview/cetz:0.2.2" as cetz
#import "@preview/fletcher:0.4.2" as fletcher: edge

// The example is taken from https://tikz.dev/library-petri#sec-64.4

#{
  let p1 = (0,0)
  let p2 = cetz.vector.add(p1, (0, 1))
  let p3 = cetz.vector.add(p2, (0, 1))
  let p4 = cetz.vector.add(p3, (0, 1))
  let p5 = cetz.vector.add(p4, (0, 1))
  let p6 = cetz.vector.add(p5, (0, 1))

  let tp1 = cetz.vector.add(p1, (1, 1 / 2))
  let tp2 = cetz.vector.add(p2, (1, 1 / 2))
  let tp31 = cetz.vector.add(p3, (1, 1 / 3))
  let tp32 = cetz.vector.add(p3, (1, 2 / 3))
  let tp41 = cetz.vector.add(p4, (1, 1 / 3))
  let tp42 = cetz.vector.add(p4, (1, 2 / 3))
  let tp5 = cetz.vector.add(p5, (1, 1 / 2))
  let tp6 = cetz.vector.add(p6, (1, 1 / 2))

  let m1f = cetz.vector.add(p2, (2, 1 / 4))
  let m1t = cetz.vector.add(m1f, (0,  1 / 2))

  let h1 = cetz.vector.add(p4, (2.5, 1 / 4))
  let h2 = cetz.vector.add(h1, (0, 1 / 2))

  let reflect(vec) = cetz.vector.add(vec, (2 * (h1.at(0) - vec.at(0)), 0))

  let q1 = reflect(p1)
  let q2 = reflect(p2)
  let q3 = reflect(p3)
  let q4 = reflect(p4)
  let q5 = reflect(p5)
  let q6 = reflect(p6)

  let tq1 = reflect(tp1)
  let tq2 = reflect(tp2)
  let tq31 = reflect(tp31)
  let tq32 = reflect(tp32)
  let tq41 = reflect(tp41)
  let tq42 = reflect(tp42)
  let tq5 = reflect(tp5)
  let tq6 = reflect(tp6)

  let m2f = reflect(m1f)
  let m2t = reflect(m1t)

  let p = p.with(fill: blue.lighten(45%), stroke: blue.darken(10%))
  let t = t.with(width: 0.3, height: 0.3, fill: red.lighten(25%), stroke: red.darken(10%))
  let edge = edge.with(marks: "-|>")
  let double-edge = edge.with(marks: "<|-|>")

  fletcher.diagram(
    node-stroke: 1pt,
    spacing: (7em, 5em),

    p(p1, $p_1$, label-args: (anchor: "west"), tokens: 1),
    p(p2, $p_2$, label-args: (anchor: "west")),
    p(p3, $p_3$, label-args: (anchor: "west")),
    p(p4, $p_4$, label-args: (anchor: "west")),
    p(p5, $p_5$, label-args: (anchor: "west")),
    p(p6, $p_6$, label-args: (anchor: "west")),

    t(tp1, []),
    t(tp2, []),
    t(tp31, []),
    t(tp32, []),
    t(tp41, []),
    t(tp42, []),
    t(tp5, []),
    t(tp6, []),

    p(m1f, $m_1 = f$, tokens: 1),
    p(m1t, $m_1 = t$, label-args: (anchor: "south")),

    p(h1, $"hold" = 1$, tokens: 1),
    p(h2, $"hold" = 2$, label-args: (anchor: "south")),
  
    p(m2f, $m_2 = f$, tokens: 1),
    p(m2t, $m_2 = t$, label-args: (anchor: "south")),

    p(q1, $q_1$, label-args: (anchor: "east"), tokens: 1),
    p(q2, $q_2$, label-args: (anchor: "east")),
    p(q3, $q_3$, label-args: (anchor: "east")),
    p(q4, $q_4$, label-args: (anchor: "east")),
    p(q5, $q_5$, label-args: (anchor: "east")),
    p(q6, $q_6$, label-args: (anchor: "east")),

    t(tq1, []),
    t(tq2, []),
    t(tq31, []),
    t(tq32, []),
    t(tq41, []),
    t(tq42, []),
    t(tq5, []),
    t(tq6, []),

    //
    
    edge(p1, tp1),
    edge(p2, tp2),
    edge(p3, tp31),
    edge(p3, tp32),
    edge(p4, tp41),
    edge(p4, tp42),
    edge(p5, tp5),
    edge(p6, tp6),
    
    edge(tp1, p2),
    edge(tp2, p3),
    edge(tp31, p4),
    edge(tp32, p4),
    edge(tp41, p5),
    edge(tp42, p5),
    edge(tp5, p6),
    edge(tp6, p1),

    //
    
    edge(q1, tq1),
    edge(q2, tq2),
    edge(q3, tq31),
    edge(q3, tq32),
    edge(q4, tq41),
    edge(q4, tq42),
    edge(q5, tq5),
    edge(q6, tq6),
    
    edge(tq1, q2),
    edge(tq2, q3),
    edge(tq31, q4),
    edge(tq32, q4),
    edge(tq41, q5),
    edge(tq42, q5),
    edge(tq5, q6),
    edge(tq6, q1),

    //

    edge(m1f, tp2),
    edge(tp2, m1t),
    edge(m1t, tp5),
    edge(tp5, m1f),
    double-edge(m1f, tq41),

    edge(m2f, tq2),
    edge(tq2, m2t),
    edge(m2t, tq5),
    edge(tq5, m2f),
    double-edge(m2f, tp41),

    //

    edge(h1, tq32),
    edge(tp32, h1),
    double-edge(h1, tp31),
    double-edge(h1, tq42),

    //

    edge(h2, tp32),
    edge(tq32, h2),
    double-edge(h2, tq31),
    double-edge(h2, tp41),
  )
}
