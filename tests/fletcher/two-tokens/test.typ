#import "/src/lib.typ": *
#set page(width: auto, height: auto, margin: 1cm)

#import "@preview/fletcher:0.4.2" as fletcher

/// % Place 1
/// \node[place,
/// 	label={135:$P_1$}] (place1) at (0,0) {};
///
/// % Place 2
/// \node[place,
/// 	label={45:$P_2$},
/// 	tokens=3] (place2) at (2,0) {};

#fletcher.diagram(
  node-stroke: 0.5pt,

  p((0,0), $P_1$),

  p((2,0), $P_2$, tokens: 3),
)
