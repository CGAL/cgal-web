---
layout: post
title: "New in CGAL: 3D Periodic Mesh Generation"
description: "Introducing a new package to generate meshes over the three-dimensional flat torus"
category:
tags: [""]
---
{% include JB/setup %}

<h3>Mikhail Bogdanov&#42;, Aymeric Pellé&#42;, <a href="https://geometryfactory.com/who-we-are/">Mael Rouxel-Labbé</a>&deg;,
and <a href="https://members.loria.fr/Monique.Teillaud/">Monique Teillaud</a>&#42;</h3>
<h4>&#42;<a href="https://www.inria.fr">INRIA</a>, &deg;<a href="http://www.geometryfactory.com" target="_blank">GeometryFactory</a></h4>

<br>
<p>The field of algorithmic geometry is traditionally limited to Euclidean spaces. Consequently,
this is also the case for most data structures and algorithms in CGAL.
However, by assuming other geometric postulates, it is possible to consider different kinds of spaces, such
as <i>periodic spaces</i> defined as the quotient of an Euclidean space with an associative group,
also known as <i>flat torus</i>. In a simpler-to-visualize way, such periodic spaces can been
seen as a square (in 2D) or cubic (in 3D) tile that paves the Euclidean space. Geometric entities living
in these spaces are duplicated across all tiles.</p>

<div style="text-align:center;">
  <img src="../../../../images/periodic_2D.png"><br>
  <small>Example of 3 points in a 2D periodic space: the points and simplicies are reproduced periodically from tile to tile.</small>
</div>

<br>
<p>These periodic spaces are particularly well adapted to materials science and the modelling
of some physic phenomena such as crystallographic structures, the cosmic web,
and <a href="https://members.loria.fr/MTeillaud/PeriodicSpacesWorkshop/">more</a>...
As in the Euclidean space, the study of these topics requires discretizing objects in triangulations
and meshes. The construction of 3D periodic triangulations has been available in CGAL since
<a href="../../../../2009/10/05/cgal-35">CGAL 3.5</a>, with the release of the package
<a href="https://doc.cgal.org/4.13/Periodic_3_triangulation_3/index.html#Chapter_3D_Periodic_Triangulations">3D Periodic Triangulations</a>.
The next natural step was to offer mesh generation, that is the automatic generation of new points
of a triangulation to construct a good approximation of a given domain living within the periodic cube.</p>

<h3>3D Periodic Mesh Generation</h3>

<p>Introducing the newest CGAL package: <b>3D Periodic Mesh Generation</b> (also known as <i>Periodic_3_mesh_3</i>).
The package Periodic_3_mesh_3 computes isotropic simplicial meshes for domains
described through implicit functional boundaries over the flat torus. The output is a periodic 3D mesh
of the domain volume and conformal surface meshes for all the boundary and subdividing surfaces.

<div style="text-align:center;">
  <a href="../../../../images/periodic_mesh.png"><img src="../../../../images/periodic_mesh.png" style="max-width:95%"/></a><br>
  <small>Example of a periodic mesh (8 representations of the mesh are shown, each with a different color).</small>
</div>

<br>
<p>The package is closely related to the
<a href="https://doc.cgal.org/4.13/Mesh_3/index.html#Chapter_3D_Mesh_Generation">3D Mesh Generation package</a>
(also known as <i>Mesh_3</i>), with similar concepts, classes, and API.
The package Periodic_3_mesh_3 therefore also offers feature protection, to ensure the presence
of sharp edges in a mesh, as well as post-processing steps such as mesh optimization
(Lloyd, ODT, sliver removal, ...):</p>

<div style="text-align:center;">
  <img src="../../../../images/periodic_optimizers.png" style="max-width:80%"><br>
  <small>Optimization of a periodic mesh (8 representations shown).</small>
</div>

<br>
<p>The package Periodic_3_mesh_3 is already integrated in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be available
officially in the upcoming release, CGAL 4.13, scheduled for September 2018.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://doc.cgal.org/4.13/Periodic_3_mesh_3/index.html#Chapter_3D_Periodic_Mesh_Generation">Documentation of the package Periodic_3_mesh_3</a>
<br>
<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
