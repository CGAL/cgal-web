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

<br>
<div style="text-align:center;">
  <a href="../../../../images/cdt_title_pyramid.png"><img src="../../../../images/cdt_title_pyramid.png" style="max-width:95%"/></a>
  <br><small>Piecewise Linear Complex and its 3D Constrained Triangulation</small>
</div>

<br>
<p> While 3D triangulations have been available in CGAL since version 2.1, this release introduces a major
new feature: 3D triangulations <b>with constraints</b>, supporting constrained segments and polygonal faces.
<p>
This new component is introduced to enable CGAL to build not only
3D triangulations, but constrained
triangulations, that must respect not only a set of
input points, but also a set of specified line segments and polygons that
represent boundaries,
holes, or internal features of the domain.
<p>
Building a build constrained triangulation is a fundamental technique used to partition
a closed domain defined by a <em>Piecewise Linear Complex</em> into non-overlapping triangles
and tetrahedra while preserving a set of predefined edges and polygonal faces, known as <em>constraints</em>.
This added geometric and topological complexity makes constrained triangulation particularly useful
in applications such as mesh generation for finite element analysis, computer graphics,
geographic information systems (GIS), and terrain modeling.
By ensuring that key structural features are retained in the resulting mesh,
constrained triangulations provide a flexible and robust foundation for the simulation and analysis of complex geometries.
<p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/cdt3_flower_pots_plc_cdt.png"><img src="../../../../images/cdt3_flower_pots_plc_cdt.png" style="max-width:95%"/></a>
  <br><small>Piecewise Linear Complex (left) and its 3D Constrained Triangulation (right)</small>
</div>

<br>
<h3>New package</h3>
<p>CGAL-6.1 offers a new package,
<a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/index.html">3D Constrained Triangulations</a>,
to construct a 3D constrained triangulation from an input piecewise linear complex or a polygon soup.
</p>

<p>This package provides two core functions to generate constrained triangulations in 3D:
<ul>
<li><a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/group___pkg_constrained_triangulation3_functions_polygon_soup_or_mesh.html#gaf6c5b49383aa7a8652f9cd50bf171ed8">CGAL::make_conforming_constrained_Delaunay_triangulation_3(plc)</a>
to build the constrained triangulation from a Piecewise Linear Complex,
<li><a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/group___pkg_constrained_triangulation3_functions_polygon_soup_or_mesh.html#gadf8d2593ea11fdd58a57bbb7a7cc3fd3">CGAL::make_conforming_constrained_Delaunay_triangulation_3(points, polygons)</a>
to build the constrained triangulation from a polygon soup.
</ul>

<br>The class
<a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/class_c_g_a_l_1_1_conforming__constrained___delaunay__triangulation__3.html">CGAL::Conforming_constrained_Delaunay_triangulation_3</a>
offers a more complete way of tuning the constrained triangulation.

</p>

<br>
<h3>Planar patches</h3>
<p>
A preprocessing step can be performed to systematically detect and merge all coplanar faces within a Piecewise Linear Complex.
This operation simplifies the input data by reducing its overall complexity, while striving to preserve,
as constraints, only the boundary edges of the planar surface patches.
The resulting structure can then serve as input to the constrained triangulation algorithm,
leading to high-quality results, as illustrated in the following figures.
</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/cdt3_flower_pots_remesh_plc_cdt.png"><img src="../../../../images/cdt3_flower_pots_remesh_plc_cdt.png" style="max-width:95%"/></a>
  <br><small>Piecewise Linear Complex after Remeshing of planar faces (left), and its 3D Constrained Triangulation (right)</small>
</div>

<br>
<h3>Robustness</h3>
<p>
Built on top of CGAL's existing kernel and Delaunay triangulation structures,
the constrained variant inherits:
<ul>
<li> Exact geometric predicates
<li> Robustness to degeneracies
<li> Easy interfacing with CGAL <a href="https://doc.cgal.org/6.1/Polygon_mesh_processing/index.html">Polygon Mesh Processing</a>
and <a href="https://doc.cgal.org/6.1/Tetrahedral_remeshing/index.html">Tetrahedral Remeshing</a> packages, among others
</ul>

The algorithm successfully constructs constrained triangulations for all the data sets of <a href="https://ten-thousand-models.appspot.com/">Thingi10k</a>
that satisfy the input geometric and topologic requirements.
</p>

<br>
<h3>Status</h3>
<p>All these additions are already integrated in CGAL's master branch on the
<a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>.
3D Constrained Triangulations will be officially released
in the upcoming version of CGAL, CGAL 6.1, scheduled for July 2025.</p>

<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/index.html">Documentation about 3D Constrained Triangulations</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
<br><br><br>
</p>
