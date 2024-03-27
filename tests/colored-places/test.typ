#import "/src/lib.typ": *
#set page(width: auto, height: auto, margin: 1cm)

/// % Place 1
/// \node[place,
/// 	fill=red!25,
/// 	draw=red!75,
/// 	tokens=2,
/// 	label=$P_1$] (place1) at (0,0) {};
/// 
/// % Place 2
/// \node[place,
/// 	fill=teal!25,
/// 	draw=teal!75,
/// 	tokens=1,
/// 	label=$P_2$] (place2) at (2,0) {};
/// 
/// % Place 3
/// \node[place,
/// 	fill=blue!25,
/// 	draw=blue!75,
/// 	tokens=5,
/// 	label=$P_3$] (place3) at (4,0) {};

#fletcher.diagram(
  node-stroke: 0.5pt,

  p((0,0), $P_1$, fill: red.lighten(55%), stroke: red.darken(15%), tokens: 2),

  p((2,0), $P_2$, fill: teal.lighten(55%), stroke: teal.darken(15%), tokens: 1),

  p((4,0), $P_3$, fill: blue.lighten(55%), stroke: blue.darken(15%), tokens: 5),
)
