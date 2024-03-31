#import "/src/lib.typ": *
#set page(width: auto, height: auto, margin: 1cm)

#import "@preview/fletcher:0.4.2" as fletcher: edge

/// % Place 1
/// \node[place,
/// 	fill=teal!25,
/// 	draw=teal!75,
/// 	tokens=2,
/// 	label=$P_1$] (place1) at (0,0) {};
/// 
/// % Place 2
/// \node[place,
/// 	fill=teal!25,
/// 	draw=teal!75,
/// 	tokens=1,
/// 	label=$P_2$] (place2) at (4,0) {};
/// 
/// % Transition
/// \node[transition,
/// 	minimum height=12mm,
/// 	minimum width=1.5mm,
/// 	fill=black,
/// 	label=$T$] (trans) at (2,0) {};
/// 
/// % Connect P-T
/// \draw[-latex,thick] (place1) -- (trans);
/// 
/// % Connect T-P
/// \draw[-latex,thick] (trans) -- (place2);

#fletcher.diagram(
  node-stroke: 0.5pt,

  p((0,0), $P_1$, fill: teal.lighten(25%), stroke: teal.darken(15%), tokens: 2),

  edge("-|>"),

  t((2,0), $T$, fill: black),

  edge("-|>"),

  p((4,0), $P_2$, fill: teal.lighten(25%), stroke: teal.darken(15%), tokens: 1),
)
