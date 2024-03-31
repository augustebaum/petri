#import "/src/lib.typ": *
#set page(width: auto, height: auto, margin: 1cm)

#import "@preview/fletcher:0.4.2" as fletcher

/// % Transition 1
/// \node[transition,
/// 	minimum size=1cm,
/// 	label=$T_1$] (Trans1) at (0,0) {};
/// 
/// % Transition 2
/// \node[transition,
/// 	minimum width=2mm,
/// 	minimum height=12mm,
/// 	label=$T_2$] (Trans2) at (2,0) {};
/// 
/// % Transition 3
/// \node[transition,
/// 	minimum width=12mm,
/// 	minimum height=2mm,
/// 	label=$T_3$] (Trans3) at (4,0) {};

#fletcher.diagram(
  node-stroke: 0.5pt,

  t((0,0), $T_1$, width: 1cm, height: 1cm),

  t((2,0), $T_2$, width: 2mm, height: 12mm),

  t((4,0), $T_3$, width: 12mm, height: 2mm),

  t((6,0), $T_4$),

  t((0,2), $T_1$, width: 1cm, height: 1cm, fill: black),

  t((2,2), $T_2$, width: 2mm, height: 12mm, fill: black),

  t((4,2), $T_3$, width: 12mm, height: 2mm, fill: black),

  t((6,2), $T_4$, fill: black),
)

