---
layout: post
title: "New in CGAL: Triangulations on the Sphere"
description: "Constructing Delaunay triangulations on the 2-sphere"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Mael Rouxel-Labbé</a>&deg;,
<a href="https://members.loria.fr/Monique.Teillaud/">Monique Teillaud</a>&#42;,
and Claudia Werner&#42;</h3>
<h4>&deg;<a href="http://www.geometryfactory.com" target="_blank">GeometryFactory</a>, &#42;<a href="https://www.inria.fr">INRIA</a></h4>

<br>
<p>The Delaunay triangulation, along with its dual – the Voronoi diagram, are some of the most
well-known structures of computational geometry. In fact first defined in a periodic setting,
these structures have been since extended to numerous domains: the Euclidean or hyperbolic spaces,
periodic tilings, any Riemannian manifold, etc. A domain that is particularly of interest
in geographic information systems, geology or structural molecular biology is the sphere.</p>

<p>One could of course simply construct a triangulation of a set of points on the sphere using
the 3D embedding and a 3D Delaunay triangulation, however this would incur needless costs, especially
as this would be a degenerate configuration: all points are on the same Delaunay ball.
The construction of triangulations of the sphere as 2D triangulations has in addition
an obvious advantage over 3D triangulations: the Delaunay "in-sphere" test, that is given a face,
whether another point is within or outside the circumscribing ball of this face trivially reduces
to an orientation test of the points in 3D.</p>

<div style="text-align:center;">
  <a href="../../../../images/ToS2-in_sphere.png"><img src="../../../../images/ToS2-in_sphere.png" style="max-width:50%"/></a><br>
</div>
<br>

<p>In the above figure, the Delaunay property on the sphere is illustrated: the circumscribing circle (in green)
on the sphere of the Delaunay face p1p2p3 is empty. This circle is also the intersection
of the supporting plane of the face with the sphere, and checking the Delaunay property is simply
figuring whether a point is above or below a plane!</p>

<br>
<h3>2D Triangulations on the Sphere</h3>

<p>Joining the ever-growing family of CGAL triangulations is a new triangulation package: <b>2D Triangulations on the Sphere</b>.
This package enables the construction of Delaunay triangulations and Voronoi diagrams on the 2-sphere.
It supports point insertion, location, and removal. Its API is similar to that of the other triangulation
packages of CGAL (<a href="https://doc.cgal.org/5.3/Manual/packages.html#PartTriangulationsAndDelaunayTriangulations">2D
and 3D triangulations, hyperbolic triangulations, periodic triangulations, ...<a/>).

<br><br>
<div style="text-align:center;">
  <a href="../../../../images/ToS2.png"><img src="../../../../images/ToS2.png" style="max-width:95%"/></a><br>
  <br><small>Delaunay triangulations and Voronoi diagrams of radar data on Earth (click to enlarge).</small>
</div>

<br>
<p></p>

<br>
<h3>Status</h3>

<p>The package Triangulation_on_sphere_2 is already integrated in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 5.3, scheduled for June 2021.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://doc.cgal.org/5.3/Manual/packages.html#PkgTriangulationOnSphere2">Documentation of the package Triangulation_on_sphere_2</a>
<br>
<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
