---
layout: post
title: "New in CGAL: New Surface Remeshing Algorithms"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Sébastien Loriot</a>&#42; and
<a href="https://www.linkedin.com/in/hossam-saeed-1abab91b3/">Hossam Mohamed Saeed</a>
</h3>
<h4>&#42;<a href="https://geometryfactory.com/">GeometryFactory</a></h4>

<br>
<p>Numerous tasks in geometric modeling and processing revolve around 3D geometric objects
represented by surface meshes. Such meshes can be created through different processes (CAD, scans, ...),
with varying element shape and size, which might not be adapted to downstream applications. For example,
3D scanners can create amounts of data that are excessive for a simple visualization.
Adapting the density of the mesh, also known as remeshing, is thus a crucial step to fit the data
to application needs.<p>

<p>CGAL offers various packages and functions that can be used to construct a mesh from scratch,
resample a mesh, or adapt the mesh to a set of criteria, notably:
<ul>
  <li><a href="https://doc.cgal.org/6.1/Polygon_mesh_processing/index.html#mesh3rem">CGAL::Polygon_mesh_processing::surface_Delaunay_remeshing()</a>, which remeshes a surface triangle mesh following a Delaunay refinement algorithm.</li>
  <li><a href="https://doc.cgal.org/6.1/Polygon_mesh_processing/index.html#isorem">CGAL::Polygon_mesh_processing::isotropic_remeshing()</a>, which uses atomic operations
  such as edge splits, edge collapses, edge flips, and Laplacian smoothing to adapt a mesh
  to a user-provided sizing field.</li>
  <li><a href="https://doc.cgal.org/6.1/Surface_mesh_simplification/index.html#Chapter_Triangulated_Surface_Mesh_Simplification">Triangulated Surface Mesh Simplification</a>, which regroups a family of methods that can be used to progressively prune a mesh using for example
  quadric error metrics.</li>
</ul>
</p>

<p>Recently, two new methods have been introduced to CGAL, with the purpose of generating coarser
versions of surface meshes:
<ul>
  <li><b><i>Approximated Discrete Centroidal Voronoi Diagram (ACVD) Remeshing</i></b>, which can be used to create high-quality feature-preserving surface meshes with a user-provided budget of vertices.</li>
  <li><b><i>Almost Planar Face Remeshing</i></b>, to be used when one desires to extract the coarsest
  possible mesh without sacrificing geometry.</li>
</ul>
</p>

<h3>Approximated Discrete Centroidal Voronoi Diagram (ACVD) Remeshing</h3>

<p>This remeshing algorithm uses clustering on polygonal meshes as to approximate a Centroidal Voronoi
Diagram construction. It is inspired by the method introduced by Valette and Chassery [1] and further
developed by Audette et al. [2] and Valette et al. [3]. The algorithm is similar to Lloyd's algorithm
(or k-means), where random input vertices are picked to initialize clusters of vertices, which are
then grown to minimize a particular energy, until convergence. Upon convergence, output vertices are
computed from the vertices of each cluster. The algorithm combines the robustness and theoretical
strength of Delaunay criteria with the efficiency of entirely discrete geometry processing,
with a low complexity (in terms of calculations and memory requirements),
allowing the processing of large meshes up to several million triangles.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/XXX.png"><img src="../../../../images/XXX.png" style="max-width:95%"/></a>
  <br><small>[IMPRESSIVE IMAGE ALGORITHM]</small>
</div>

<p>If the input mesh contains sharp features or corners, it is possible to use quadric error metrics to either move output vertices (fast, but can produce bad looking triangles), of to use quadric error metrics directly into the energy formulation of each cluster (slower, but produces better quality triangles). Additionally, adaptive remeshing based on surface curvature is possible.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/XXX.png"><img src="../../../../images/XXX.png" style="max-width:95%"/></a>
  <br><small>[IMAGE DIFFERENT STRATEGIES]</small>
</div>
<br>

<p>This implementation of the ACVD Remeshing method was the result of another successful
<a href="https://summerofcode.withgoogle.com/archive/2023/projects/VrwwMSuN">Google Summer of Code</a> project in CGAL,
contributed by <a href="https://www.linkedin.com/in/hossam-saeed-1abab91b3/">Hossam Saeed</a>
mentored by <a href="https://www.creatis.insa-lyon.fr/~valette/public/">Sébastien Valette</a>
and <a href="https://geometryfactory.com/who-we-are/">Sébastien Loriot</a>.</p>

<br><br>
<h3>Remeshing of (Almost) Planar Patches</h3>

<p>When many triangles are used to describe a planar region of a model, one might wish to simplify
the mesh in this region to use as few elements as possible, possibly event a single large polygonal face.
This can be achieved using the new function
<a href="https://doc.cgal.org/6.1/Polygon_mesh_processing/group__PMP__meshing__grp.html#ga7fca6fa2db94560ab6d32e6a77fc35b6">CGAL::Polygon_mesh_processing::remesh_planar_patches()</a>.
This function performs a detection of the planar regions using geometric predicates for coplanarity
and collinearity checks.</p>

<div style="text-align:center;">
  <a href="../../../../images/XXX.png"><img src="../../../../images/XXX.png" style="max-width:95%"/></a><br>
  <br><small>[IMPRESSIVE COPLANAR REMESHING IMAGES].</small>
</div>

<p>In real life, models often exhibit slight noise, which might cause regions to be unexpectedly
small when using exact predicates because faces are not exactly coplanar. To palliate this, it is possible to specify
a threshold on the angle between adjacent faces (resp. segments) such that they are considered coplanar (resp. collinear).
Individual functions are also provided for the different steps of the remeshing process (detection
of the planar regions, detection of the corners, ...) to enable fine tuning of the algorithm
and customization with user-specific criteria.</p>

<h4>Status</h4>

<p>All these additions already are integrated in CGAL's master branch on the
<a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>. Planar Remeshing has been
available since CGAL 6.0, and ACVD Remeshing will be officially released
in the upcoming version of CGAL, CGAL 6.1, scheduled for mid 2025.</p>

<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/6.1/Polygon_mesh_processing/index.html#acvdrem">Documentation section about ACVD Remeshing</a>
<br>
<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/6.1/Polygon_mesh_processing/index.html#decimate">Documentation section about Planar Remeshing</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
<br><br>

<h4>Bibliography</h4>

<p>
[1] Valette, S., & Chassery, J. M. (2004, September). Approximated centroidal voronoi diagrams for uniform polygonal mesh coarsening. In Computer Graphics Forum (Vol. 23, No. 3, pp. 381-389). Oxford, UK and Boston, USA: Blackwell Publishing, Inc.
<br>
[2] Audette, M., Rivière, D., Ewend, M., & Valette, S. (2010, September). Approach-guided controlled resolution brain meshing for fe-based interactive neurosurgery simulation. In Workshop on Mesh Processing in Medical Image Analysis.
<br>
[3] Valette, S., Chassery, J. M., & Prost, R. (2008). Generic remeshing of 3D triangular meshes with metric-dependent discrete Voronoi diagrams. IEEE Transactions on Visualization and Computer Graphics, 14(2), 369-381.
</p>
