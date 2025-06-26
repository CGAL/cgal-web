---
layout: post
title: "New in CGAL: 3D Constrained Triangulations"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Laurent Rineau</a>,
<a href="https://geometryfactory.com/who-we-are/">Jane Tournois</a>
</h3>

<div style="text-align:center;">
  <a href="../../../../images/cdt3_flower_pots.png"><img src="../../../../images/cdt3_flower_pots.png" style="max-width:95%"/></a>
  <br><small>3D Constrained Triangulation</small>
</div>

<br>
<p> Building the triangulation of a set of points in 3D is a well known problem
in computational geometry, and its implementation from 3D points
has been available in CGAL since CGAL-2.1.
<p>
The user may want to build a constrained triangulation, that must respect not only a set of
input points, but also a set of specified line segments and polygons that represent boundaries,
holes, or internal features of the domain.
<p>
Building a build constrained triangulation is a fundamental technique used to partition
a closed domain defined by a _Piecewise Linear Complex_ into non-overlapping triangles
and tetrahedra while preserving a set of predefined edges and polygonal faces, known as `constraints`.
This added geometric and topological complexity makes constrained triangulation particularly useful
in applications such as mesh generation for finite element analysis, computer graphics,
geographic information systems (GIS), and terrain modeling.
By ensuring that key structural features are retained in the resulting mesh,
constrained triangulations provide a flexible and robust foundation for the simulation and analysis of complex geometries.
<p>

<p>CGAL-6.1 offers a new package,
<a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/index.html">3D Constrained Triangulations</a>,
to construct a 3D constrained triangulation from an input Piecewise Linear Complex or a polygon soup.
</p>

<p>This package provides two main free functions
<a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/group___pkg_constrained_triangulation3_functions_polygon_soup_or_mesh.html">CGAL::make_conforming_constrained_Delaunay_triangulation_3()</a>
to build the constrained triangulation from a Piecewise Linear Complex or a polygon soup.
The class
<a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/class_c_g_a_l_1_1_conforming__constrained___delaunay__triangulation__3.html">CGAL::Conforming_constrained_Delaunay_triangulation_3</a>
offers a more complete way of tuning the constrained triangulation.
</p>


<br>
<div style="text-align:center;">
  <a href="../../../../images/cdt_title_pyramid.png"><img src="../../../../images/cdt_title_pyramid.png" style="max-width:95%"/></a>
  <br><small>Input Piecewise Linear Complex (left); 3D Constrained Triangulation (right).</small>
</div>

<h3>Remeshing</h3>
<br>
<p>

<h3>Robustness</h3>
<br>
<p>

<h3>Performances</h3>
<br>
<p>


<h4>Status</h4>

<p>All these additions are already integrated in CGAL's master branch on the
<a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>.
3D Constrained Triangulations will be officially released
in the upcoming version of CGAL, CGAL 6.1, scheduled for mid 2025.</p>

<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/index.html">Documentation about 3D Constrained Triangulations</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
<br><br><br>
</p>
