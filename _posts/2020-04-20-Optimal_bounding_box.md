---
layout: post
title: "New in CGAL: Optimal Bounding Box"
description: "Computing Tight Bounding Boxes Of Point Sets and Models"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://dikatrio.xyz/">Konstantinos Katrioplas</a>, <a href="https://geometryfactory.com/who-we-are/">Mael Rouxel-Labbé</a></h3>
<h4><a href="https://geometryfactory.com/">GeometryFactory</a></h4>

<br>

<p>Encompassing a model within a volume is a common approach to accelerate
a number of applications such as collision detection or visibility testing:
the proxy volume provides a rapid way to test a configuration or filter results,
with the real model only being used when required.
Typical coarser volumes that can be used to approximate a more complex
model are simplified meshes (for example using the package
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Surface_mesh_simplification/index.html#Chapter_Triangulated_Surface_Mesh_Simplification">Surface Mesh Simplification</a>),
convex hulls, or simple rectangular boxes.<p>

<br>

<h3>Bounding Volumes</h3>

<p>Within bounding boxes, the axis-aligned bounding box (AABB) has obvious advantages:
it is extremely simple to compute and one may build a hierarchical
structure of successively tighter volumes to further speed up intersection and distance computations.
One such structure is the
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/AABB_tree/index.html#Chapter_3D_Fast_Intersection_and_Distance_Computation">AABB tree</a>.
The disadvantage is also clear: the box is usually poorly fitting most models.
A good compromise between the good approximation offered by convex hulls or simplified meshes
and the speed offered by axis-aligned bounding boxes are <em>Optimal Bounding Boxes</em>.
Contrary to the AABB, the optimal bounding box of a model is not necessarily axis-aligned,
but provides a tight approximation.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/aabb_vs_obb.png"><img src="../../../../images/aabb_vs_obb.png" style="max-width:95%"/></a><br>
  <small>Although simple to compute, an AABB (left) is rarely as a good fit for a model as the optimal bounding box (right)</small>
  <!-- model: https://www.myminifactory.com/object/3d-print-chinese-new-year-dragon-incense-holder-5476 -->
</div>
<br>

<br>

<h3>Optimal Bounding Box</h3>

<p>In 2D, the optimal bounding rectangle of an input can be computed in linear time
using the technique of <a href="https://en.wikipedia.org/wiki/Rotating_calipers"><em>rotating calipers</em></a>
(see also the CGAL package <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Bounding_volumes/index.html#Chapter_Bounding_Volumes">Bounding Volumes</a>).
An algorithm to compute the optimal oriented bounding box in 3D was proposed
by O’Rourke in 1985 (<a href="http://cs.smith.edu/~jorourke/Papers/MinVolBox.pdf"><em>Finding Minimal Enclosing Boxes</em></a>),
but its cubic complexity in the number of points makes it unusable in practice.</p>

<p>The implementation proposed in this new CGAL package is based on the paper of Chang et al.,
<a href="http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.717.9566&rep=rep1&type=pdf"><em>
Fast oriented bounding box optimization on the rotation group SO(3, R)</em></a>,
where an algorithm to compute a close approximation of the optimal
bounding box is introduced. The algorithm formulates the computation
of the optimal bounding box as an unconstrained optimization problem
on the 3D matrix rotation group. The function to optimize is defined
as the volume of the box. Because this function is non-differentiable,
in particular near local optima, traditional optimization methods
might encounter convergence issues.
Consequently, Chang et al.'s algorithm employs a combination
of a derivative-free optimization method, the
<a href="https://en.wikipedia.org/wiki/Nelder%E2%80%93Mead_method">Nelder-Mead simplex method</a>, and a metaheuristics method based on
biological evolution principles to maintain and evolve a population of tentative
rotation matrices. The purpose of this evolution is to oppose
a global approach to the local Nelder-Mead optimization,
enabling the algorithm to explore the search space as much as possible,
and to find not only a local minimum, but a global optimum.</p>

<br>

<h3>implementation in CGAL</h3>

<p>The implementation of CGAL supports point sets and meshes as input, with multiple possible output types.
Convex hull preprocessing is used to greatly improve speed, and is performed using the package
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Convex_hull_3/index.html#Chapter_3D_Convex_Hulls">3D Convex Hull</a>.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/obb_chess.png"><img src="../../../../images/obb_chess.png" style="max-width:95%"/></a><br>
  <small>Optimal bounding boxes of a set of chess pieces.</small>
  <!-- chess pieces from https://www.myminifactory.com/object/3d-print-chess-game-set-26114 -->
</div>
<br>

<br>

<p>The package <em>Optimal bounding box</em> is already integrated in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 5.1, scheduled for July 2020.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Optimal_bounding_box/index.html#Chapter_Building_Optimal_Bounding_Box">Documentation of the package Optimal_bounding_box</a> <br>

<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
