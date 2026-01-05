---
layout: post
title: "New in CGAL: 3D Constrained Triangulations"
description: ""
category:
tags: ["features"]
image: /images/cdt_title_pyramid.png
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Laurent Rineau</a>,
<a href="https://geometryfactory.com/who-we-are/">Jane Tournois</a>
</h3>
<h4><a href="https://geometryfactory.com/">GeometryFactory</a></h4>

<br>
<p>Triangulations, and in particular Delaunay triangulations, are fundamental tools in computational geometry
and have been part of CGAL since its very first release.
CGAL offers (Delaunay) triangulations in Euclidean spaces of any dimension, as well as specialized
types such as periodic or hyperbolic triangulations.</p>

<p>Among these, a particularly interesting subset of triangulations are <em>Constrained (Delaunay) Triangulations</em>,
which guarantee that a given set of points, segments, or polygonal constraints are present in the
triangulation. By ensuring that key features are retained in the resulting mesh,
constrained triangulations provide a faithful representation of complex geometries for simulation
and analysis. CGAL has long supported two-dimensional constrained triangulations,
but the notoriously harder three-dimensional version was missing, until now.</p>

<h3>New Package: 3D Constrained Triangulations</h3>

<p>As a major milestone for the CGAL library, the upcoming release CGAL 6.1
will offer a new package, <a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/index.html">3D Constrained Triangulations</a>,
which enables the construction of 3D Delaunay triangulations that can preserve a user-defined set of
segments and 3D polygons.</p>

<p>These new triangulations leverage the exact geometric paradigm of CGAL,
and the experience of existing triangulations to achieve robustness to degeneracies. For example,
the algorithm successfully constructs constrained Delaunay triangulations for all inputs
of <a href="https://ten-thousand-models.appspot.com/">Thingi10k</a> that meet
the input geometrical and topological requirements.</p>

<div style="text-align:center;">
  <a href="../../../../images/cdt_title_pyramid.png"><img src="../../../../images/cdt_title_pyramid.png" style="max-width:95%"/></a>
  <br><small>Piecewise linear complex input (left) and its 3D constrained Delaunay triangulation (right)</small>
</div>
<br>

<p>The package supports two types of input: piecewise linear complexes and 3D polygon soups. These are used as parameters for the two main functions to generate constrained triangulations in 3D:</p>

<ul>
<li><a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/group___pkg_constrained_triangulation3_functions_polygon_soup_or_mesh.html#gaf6c5b49383aa7a8652f9cd50bf171ed8"><code>CGAL::make_conforming_constrained_Delaunay_triangulation_3(plc)</code></a>
to build the constrained triangulation from a piecewise linear complex;</li>
<li><a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/group___pkg_constrained_triangulation3_functions_polygon_soup_or_mesh.html#gadf8d2593ea11fdd58a57bbb7a7cc3fd3"><code>CGAL::make_conforming_constrained_Delaunay_triangulation_3(points, polygons)</code></a>
to build the constrained triangulation from a polygon soup.</li>
</ul>

<p>
The class
<a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/class_c_g_a_l_1_1_conforming__constrained___delaunay__triangulation__3.html"><code>CGAL::Conforming_constrained_Delaunay_triangulation_3</code></a>
provides a richer interface to build and explore the triangulation.
</p>

<h3>Interfacing with Existing CGAL Packages</h3>

<p>The new 3D constrained triangulations have been designed to interface easily with other CGAL components,
such as <a href="https://doc.cgal.org/6.1/Polygon_mesh_processing/index.html">Polygon Mesh Processing</a>
or <a href="https://doc.cgal.org/6.1/Tetrahedral_remeshing/index.html">Tetrahedral Remeshing</a> packages.
As an illustration of this, a preprocessing step can be performed using the function
<a href="https://doc.cgal.org/6.1/Polygon_mesh_processing/group__PMP__meshing__grp.html#ga7fca6fa2db94560ab6d32e6a77fc35b6"><code>CGAL::Polygon_mesh_processing::remesh_planar_patches</code></a>
to systematically detect and merge all coplanar faces within a piecewise linear complex.
This operation simplifies the input data by reducing its overall complexity, while striving to preserve
as constraints, only the boundary edges of the planar surface patches.
The resulting structure can then serve as input to the constrained triangulation algorithm,
leading to simpler and higher quality results, as illustrated in the following two figures.
</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/cdt3_flower_pots_plc_cdt.png"><img src="../../../../images/cdt3_flower_pots_plc_cdt.png" style="max-width:95%"/></a>
  <br><small>Piecewise linear complex (left) and its 3D Constrained Triangulation (right)</small>
</div>
<br>
<div style="text-align:center;">
  <a href="../../../../images/cdt3_flower_pots_remesh_plc_cdt.png"><img src="../../../../images/cdt3_flower_pots_remesh_plc_cdt.png" style="max-width:95%"/></a>
  <br><small>Piecewise linear complex after remeshing of planar faces (left), and its 3D Constrained Triangulation (right)</small>
</div>

<br>
<h3>Status</h3>
<p>The package <em>3D Constrained Triangulations</em> is already available in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be officially released in CGAL 6.1, scheduled for mid 2025.</p>

<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/6.1/Constrained_triangulation_3/index.html">Documentation about 3D Constrained Triangulations</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
