---
layout: post
title: "New in CGAL: 2D Hyperbolic Triangulations and 2D Periodic Hyperbolic Triangulations"
description: "Introducing two new packages to construct hyperbolic triangulations"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://imiordanov.github.io/">Iordan Iordanov</a> and
<a href="https://members.loria.fr/Monique.Teillaud/">Monique Teillaud</a></h3>
<h4><a href="https://www.inria.fr">INRIA Nancy Nancy - Grand Est</a>,
<a href="https://www.loria.fr/en/">LORIA</a></h4>

<br>
<p>Delaunay triangulations are among the most important structures in computational geometry
and have been part of CGAL since its very first release. However, they are traditionally
only handled in Euclidean spaces. Recent developments in fields such as neuromathematics, physics,
material sciences, and computer modeling however exhibit needs for Delaunay triangulations
in other spaces. CGAL already offers packages to compute Delaunay triangulations
of the flat torus in 2 and 3 dimensions, which can be seen as periodic triangulations
of the Euclidean space in 2 and 3 dimensions, respectively.
CGAL introduces now two new packages for the computation of Delaunay triangulations
in the hyperbolic plane, as well as Delaunay triangulations of the Bolza surface,
which can be seen as periodic Delaunay triangulations of the hyperbolic plane.</p>

<br>
<h3>2D Hyperbolic Triangulations</h3>

<p>The hyperbolic plane is represented using the conformal Poincar&eacute; disk model.
The package <b>2D Hyperbolic Triangulations</b> (also known as <i>Hyperbolic_triangulation_2</i>)
enables the computation of Delaunay triangulations of points living in the Poincar&eacute; disk.
Further operations supported are the location of a point in the triangulation, the removal
of existing vertices, and the computation of dual objects of faces and edges.</p>

<div style="text-align:center;">
  <img src="../../../../images/hyperbolic-triangulation-and-voronoi.png"><br>
  <small>Delaunay triangulation and Voronoi diagram of a set of points on the Poincar&eacute; disk.</small>
</div>

<br>
<h3>2D Periodic Hyperbolic Triangulations</h3>

<p>The Bolza surface is the most symmetric smooth, closed, orientable surface of genus 2.
It can be obtained by gluing together the opposite sides of a regular hyperbolic octagon
with all angles equal to π/4. Note that this octagon tiles the hyperbolic plane.
Delaunay triangulations of the Bolza surface can be seen as Delaunay triangulations
of the hyperbolic plane, periodic in the 4 directions defined by the gluing
of the opposite sides of the octagon.</p>

<div style="text-align:center;">
  <img src="../../../../images/tiling-hyperbolic-plane.png" width="50%"><br>
  <small>Illustration of the periodicity of the hyperbolic plane. All the red points correspond to the same
         point, periodically reproduced.</small>
</div>

<br>
<p>The package <b>2D Periodic Hyperbolic Triangulations</b> (also known as
<i>Periodic_4_hyperbolic_triangulation_2</i>) enables the computation
of periodic Delaunay triangulations of the hyperbolic plane, and offers functionalities
such as point location, vertex removal, and construction of dual objects of faces
and edges of the triangulation.</p>

<div style="text-align:center;">
  <img src="../../../../images/periodic-hyperbolic-triangulation-and-voronoi.png"><br>
  <small>Periodic Delaunay triangulation and periodic Voronoi diagram of a set of points.</small>
</div>

<br>
<p>Both packages are already available in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>,
and will be officially released in the upcoming version of CGAL, 4.14, scheduled for March 2019.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://doc.cgal.org/4.14/Hyperbolic_triangulation_2/index.html#Chapter_2D_Hyperbolic_Triangulations">Documentation of the package Hyperbolic_triangulation_2</a> <br>
<i class="glyphicon glyphicon-book"></i>
<a href="https://doc.cgal.org/4.14/Periodic_4_hyperbolic_triangulation_2/index.html#Chapter_2D_Periodic_Hyperbolic_Triangulations">Documentation of the package Periodic_4_hyperbolic_triangulation_2</a>

<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
