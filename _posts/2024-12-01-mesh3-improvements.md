---
layout: post
title: "Tetrahedral Mesh Generation Improvements"
description: "Tetrahedral Mesh Generation Improvements in CGAL-6.0.1"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Jane Tournois</a></h3>
<h4><a href="http://www.geometryfactory.com" target="_blank">GeometryFactory</a></h4>
<br>

<p>The CGAL component
<a href="https://doc.cgal.org/latest/Manual/packages.html#PkgMesh3" text="3D Mesh Generation">3D Mesh Generation</a>
is the primary component to generate isotropic simplicial meshes discretizing 3D domains with CGAL.
First introduced in CGAL-3.5 (2009!), this component has been constantly updated through the years
to improve its performance, its versatility, and the quality of the meshes it produces.</p>

<p>Recent releases of CGAL have once again introduced new enhancements that enable more accurate
representations of input surfaces, for a wider range of input data types. It is now possible to:
<ul>
<li>detect and recover sharp features in labeled images,</li>
<li>generate meshes of <i>weighted</i> labeled images,</li>
<li>control the maximum error on the approximation error of polyline features.</li>
</ul></p>


<br>
<h3>Recovery of Sharp Features in Labeled Images</h3>

<p>CGAL's tetrahedral mesh generation algorithm is able to generate tetrahedral meshes from 3D segmented images.
Regardless of input type, one-dimensional feature detection and construction must be performed before
the generation of the mesh.
In 3D segmented images, these features correspond to the intersections of the bounding box of the image with the surfaces
defined by the image, as well as polylines that lie at the intersection of three or more subdomains (including the outside).</p>

<p>The article
<a href="https://opus4.kobv.de/opus4-zib/frontdoor/index/index/docId/274"><i>Hege, H. C., Seebass, M., Stalling, D., & Zöckler, M. (1997),
A generalized marching cubes algorithm based on non-binary classifications</i></a> provides a classification
of possible voxel configurations.
This description has been generalized for tetrahedral mesh generation needs, and implemented in CGAL.</p>

<p>Following feature lines detection, polyline features are added to the feature graph of the domain
for feature protection, similarly to what is done for polyhedral surfaces.</p>

<p>Two new detection functors are introduced to support the protection of triple lines:
<ul>
  <li><code>CGAL::Detect_features_in_image()</code>: detect and construct all
    polylines lying at the intersection of three or more subdomains, and</li>
  <li><code>CGAL::Detect_features_on_image_bbox()</code>: detect and construct the polylines
    that lie at the intersection of two or more subdomains and the bounding box of the input labeled image.</li>
</ul>
</p>

<div style="text-align:center;">
  <a href="../../../../images/mesh3_triple_lines_protection.png"><img src="../../../../images/mesh3_triple_lines_protection.png" style="max-width:80%"/></a><br>
  <br><small>Mesh generation from labeled image without (left)
   and with triple lines detection and protection (right).
   Protection of the feature lines at the intersection of the three subdomains (pink, blue, outside)
   enables a much more faithful mesh, with fewer vertices.</small>
</div>


<br>
<h3>Weighted Labeled Images</h3>

<p>When a segmented image is given as input for tetrahedral mesh generation,
the generated mesh surface sometimes sticks too closely to the voxels surface, causing an aliasing effect.
A solution to generate a smooth and accurate output surface was described by Stalling et al. in
<a href="https://opus4.kobv.de/opus4-zib/frontdoor/index/index/docId/382"><i>Stalling, D., Zöckler, M., Sander, O., & Hege, H. C. (1998),
Weighted labels for 3D image segmentation</i></a>.
The approach consists in generating a second input image made of integer coefficients called <i>weights</i>,
and to use those weights to define smoother domain boundaries.

This addition has been added to CGAL, and the 3D image of weights can be generated using the new function
<code>CGAL::Mesh_3::generate_label_weights()</code>.</p>

<div style="text-align:center;">
  <a href="../../../../images/mesh3_weighted_images.png"><img src="../../../../images/mesh3_weighted_images.png" style="max-width:100%"/></a><br>
  <br><small>Mesh generation from labeled image without weights (left, 88,000 vertices)
   and with weights (right, 67,000 vertices).</small>
</div>

<br>
<p>The following example shows how to use weighted labeled images: <a href="https://doc.cgal.org/6.0.1/Mesh_3/Mesh_3_2mesh_3D_weighted_image_8cpp-example.html">mesh_3D_weighted_image.cpp</a>.</p>

<p>A new method combining triple line protection and weighted labels has been
designed and implemented in CGAL, achieving smooth and feature preserving meshes.
This method leverages the best of these two new functionalities.</p>

<br>
<h3>Approximation Criterion for Feature Edges</h3>

<p>Our Delaunay refinement algorithm is guided by meshing criteria (size, shape, etc.).
When these criteria are not honored, new vertices are inserted until the criteria are satisfied,
a process guaranteed to terminate.
The list of CGAL meshing criteria has been enriched with a new criterion that enables users to
define an upper bound on the distance between the input feature graph and the output feature edges,
providing finer control over the mesh features.</p>

<p>The example <a href="https://doc.cgal.org/6.0.1/Mesh_3/Mesh_3_2mesh_polyhedral_domain_with_edge_distance_8cpp-example.html">
mesh_polyhedral_domain_with_edge_distance.cpp</a> shows how to use this new criterion, called <code>edge_distance</code>.</p>

<div style="text-align:center;">
  <a href="../../../../images/mesh3_edge_distance_stool.png"><img src="../../../../images/mesh3_edge_distance_stool.png" style="max-width:65%"/></a><br>
  <br><small>Mesh generation from polyhedral surface with a varying <code>edge_distance</code> meshing criterion.
  The quality improvement is noticeable at the extremities of the stool legs.</small>
</div>


<h3>Status</h3>

<p>All these new improvements are part of CGAL-6.0.1, which has just been officially released.</p>

<i class="bi bi-book"></i>
<a href="https://www.cgal.org/2024/10/22/cgal601/">CGAL-6.0.1 announcement</a>
<br>
<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/latest/Manual/packages.html#PkgMesh3">Documentation of the Tetrahedral Mesh Generation package</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
