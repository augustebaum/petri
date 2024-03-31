#import "/src/lib.typ": *
#set page(width: auto, height: auto, margin: 1cm)

#import "@preview/fletcher:0.4.2" as fletcher

/// % Place 1
/// \node[place,
/// 	label=left:$P_1$] (place1) at (0,0) {};
/// 
/// % Place 2
/// \node[place,
/// 	label=above:$P_2$,
/// 	label=right:$P_2$,
/// 	label=left:$P_2$,
/// 	label=below:$P_2$] (place2) at (2,0) {};
/// 
/// % Place 3
/// \node[place,
/// 	label=0:$P_3$] (place3) at (4,0) {};

  
#fletcher.diagram(
  node-stroke: 0.5pt,

  p((0,0), $P_1$),

  p((2,0), $P_2$),

  p((4,0), $P_3$),

  t((0,2), $T_1$),

  t((2,2), $T_2$),

  t((4,2), $T_3$),
)
