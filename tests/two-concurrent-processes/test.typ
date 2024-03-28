#import "/src/lib.typ": *
#set page(width: auto, height: auto, margin: 1cm)

/// 	node distance=2cm,
/// 	on grid,
/// 	every transition/.style={fill=black,minimum width=.1cm, minimum height=0.9cm},
/// 	every place/.style={fill=red!25,draw=red!75},
/// 	every label/.style={black!75}]
/// 
/// % Places
/// \node[place,
/// 	label=left:$P_1$] (place1) {};
/// 
/// \node[place,
/// 	right=of place1,
/// 	tokens=1,
/// 	label=right:$P_2$] (place2) {};
/// 
/// \node[place,
/// 	right= 2.25cm of place2,
/// 	label=$P_3$] (place3) {};
/// 
/// \node[place,
/// 	right= 2.25cm of place3,
/// 	label=left:$P_4$] (place4) {};
/// 
/// \node[place,
/// 	right=of place4,
/// 	tokens=1,
/// 	label=right:$P_5$] (place5) {};
/// 
/// % Transitions
/// \node[transition,
/// 	above left=1.5cm and 1cm of place2,
/// 	label=$T_1$] (T1) {};
/// 
/// \node[transition,
/// 	below left=1.5cm and 1cm of place2,
/// 	label=below:$T_2$] (T2) {};
/// 
/// \node[transition,
/// 	above right=1.5cm and 1cm of place4,
/// 	label=$T_3$] (T3) {};
/// 
/// \node[transition,
/// 	below right=1.5cm and 1cm of place4,
/// 	label=below:$T_4$] (T4) {};
/// 
/// % connections
/// \draw (T1.east) edge[bend left,post] (place2)
/// 	(place2) edge[bend left,post] (T2.east)
/// 	(T2.west) edge[bend left,post] (place1.south)
/// 	(place1.north) edge[bend left,post] (T1.west);
/// 
/// \draw (T2.-70) edge[bend right,post] (place3)
/// 	(place3)edge[bend right,post] (T1.70);
/// 
/// \draw (T3.east) edge[bend left,pre] (place5) 
/// 	(place5) edge[bend left,pre] (T4.east)
/// 	(T4.west) edge[bend left,pre] (place4.south)
/// 	(place4.north) edge[bend left,pre] (T3.west);
/// 
/// \draw (T4.250) edge[bend left,post] (place3)
/// 	(place3)edge[bend left,post] (T3.110) ;

#let p1 = (0,0)
#let p2 = (2,0)
#let p3 = (4,0)
#let p4 = (6,0)
#let p5 = (8,0)

#let t1 = (1,-1)
#let t2 = (1,1)
#let t3 = (7,-1)
#let t4 = (7,1)

#let bend-angle = 30deg

#let my-p = p.with(fill: red.lighten(25%), stroke: red)
#let my-t = t.with(fill: black)

#fletcher.diagram(
  node-stroke: 1pt,
  spacing: (3em, 4.5em),

  // First process

  my-p(p1, $P_1$, label-args: (anchor: "west")),

  edge("-|>", bend: bend-angle),

  my-t(t1, $T_1$),

  edge("-|>", bend: bend-angle),

  my-p(p2, $P_2$, tokens: 1, label-args: (anchor: "east")),

  edge("-|>", bend: bend-angle),

  my-t(t2, $T_2$, label-args: (anchor: "south")),

  edge(t2, p1, "-|>", bend: bend-angle),

  // Second process
  
  my-p(p4, $P_4$, label-args: (anchor: "west")),

  edge("-|>", bend: - bend-angle),

  my-t(t4, $T_4$, label-args: (anchor: "south")),

  edge("-|>", bend: - bend-angle),

  my-p(p5, $P_5$, tokens: 1, label-args: (anchor: "east")),

  edge("-|>", bend: - bend-angle),

  my-t(t3, $T_3$),

  edge(t3, p4, "-|>", bend: - bend-angle),

  // Interaction

  my-p(p3, $P_3$),

  edge(p3, t1, "-|>", bend: - bend-angle),
  edge(p3, t3, "-|>", bend: bend-angle),
  edge(t2, p3, "-|>", bend: - bend-angle),
  edge(t4, p3, "-|>", bend: bend-angle),
)
