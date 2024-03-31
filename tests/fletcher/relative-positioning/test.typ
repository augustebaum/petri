#import "/src/lib.typ": *
#set page(width: auto, height: auto, margin: 1cm)

#import "@preview/fletcher:0.4.2" as fletcher: edge

/// % Place 1
/// \node[place,
/// 	fill=orange!25,
/// 	draw=orange!75,
/// 	tokens=2,
/// 	label=$P_1$] (place1) {};
/// 
/// % Place 2
/// \node[place,
/// 	below=of place1,
/// 	fill=orange!25,
/// 	draw=orange!75,
/// 	tokens=1,
/// 	label=below:$P_2$] (place2) {};
/// 
/// % Transition 1
/// \node[transition,
/// 	below left= 1.5cm and 1cm of place1,
/// 	minimum height=1mm,
/// 	minimum width=10mm,
/// 	fill=black,
/// 	label=left:$T_1$] (trans1) {};
/// 
/// % Transition 2
/// \node[transition,
/// 	below right= 1.5cm and 1cm of place1,
/// 	minimum height=1mm,
/// 	minimum width=10mm,
/// 	fill=black,
/// 	label=right:$T_2$] (trans2) {};
/// 
/// % Connect P1-T1-P2-T2-P1
/// \draw[thick] (place1) edge[post,bend right=30] (trans1)
/// 	(trans1) edge[post,bend right=30] (place2)
/// 	(place2) edge[post,bend right=30] (trans2)
/// 	(trans2) edge[post,bend right=30] (place1);

#fletcher.diagram(
  node-stroke: 0.5pt,
  spacing: (3em, 4.5em),

  p((0,0), $P_1$, fill: orange.lighten(25%), stroke: orange.darken(15%), tokens: 2),

  edge("-|>", bend: -25deg),

  t((-1,1), $T_1$, width: 10mm, height: 1mm, fill: black, label-args: (anchor: "west")),

  edge("-|>", bend: -25deg),

  p((0,2), $P_2$, fill: orange.lighten(25%), stroke: orange.darken(15%), tokens: 1, label-args: (anchor: "south")),

  edge("-|>", bend: -25deg),

  t((1,1), $T_2$, width: 10mm, height: 1mm, fill: black, label-args: (anchor: "east")),

  edge((0,0), "-|>", bend: -25deg),
)
