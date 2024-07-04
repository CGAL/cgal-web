---
layout: post
title: "Mesh_3 improvements"
description: "Mesh_3 improvements in CGAL-6.0"
category: "news"
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Jane Tournois</a></h3>
<h4><a href="http://www.geometryfactory.com" target="_blank">GeometryFactory</a></h4>

<br>
<p>Introduced in CGAL 3.5, the package
<a href="https://doc.cgal.org/latest/Manual/packages.html#PkgMesh3" text="3D Mesh Generation">3D Mesh Generation</a>
is designed to generate a isotropic simplicial meshes discretizing 3D domains.
Since then, multiple improvements in mesh quality, performances, and versatility have been made available in CGAL.
Lately, CGAL authors have focused more on the quality of the output mesh, the ability of the
mesh generation algorithm to represent the input surface in a more accurate way, for a wider range of input data types.
</p>

<!--
<div style="text-align:center;">
  <a href="../../../../images/christmas_wrap.png"><img src="../../../../images/christmas_wrap.png" style="max-width:95%"/></a><br>
  <br><small>Season's wrappings.</small>
</div>
-->

<br><br>
<p>Recent releases of CGAL have introduced improvements to the 3D Tetrahedral Mesh Generation package:
detection and protection of triple lines from labeled images,
use of weighted labeled images,
dealing with self-intersecting input surfaces,
and a new approximation error criterion for polyline features.</p>

<br>
<h3>Triple lines from labeled images</h3>

<p>CGAL's tetrahedral mesh generation algorithm is able to compute tetrahedral meshes from 3D segmented images.
For all types of inputs, detection and construction of one-dimensional features must be done a priori for the
feature protection algorithm to be able to represent them properly in the generated mesh.
In 3D segmented images, such features correspond to the intersections of the bounding box of the image with the surfaces defined by the image, as well as polylines that lie at the intersection of three or more subdomains (including the outside).</p>

<p>The article
<a href="https://opus4.kobv.de/opus4-zib/frontdoor/index/index/docId/274"><i>Hege, H. C., Seebass, M., Stalling, D., & Zöckler, M. (1997), A generalized marching cubes algorithm based on non-binary classifications</i></a>, provides a list of possible voxel configurations. This description has been generalized for tetrahedral mesh generation needs, and
implemented in CGAL.</p>

<p>After feature lines detection, similarly to what is done for polyhedral surfaces, the polyline features
are added to the feature graph of the domain for feature protection.</p>

<p>Two detection functors are provided :
<ul>
  <li><i>CGAL::Detect_features_in_image()</i>, that detects and constructs all
    polylines lying at the intersection of three or more subdomains, and</li>
  <li><i>CGAL::Detect_features_on_image_bbox()</i>, that detects and constructs the polylines
    that lie at the intersection of two or more subdomains and the bounding box of the input labeled image.</li>
</ul>
</p>

<br>
<h3>Weighted Labeled Images</h3>

<p>When a segmented image is given as input for tetrahedral mesh generation,
the generated mesh surface sometimes sticks too closely to the voxels surface, causing an aliasing effect. A solution to generate
a smooth and accurate output surface was described by Stalling et al in
<a href="https://opus4.kobv.de/opus4-zib/frontdoor/index/index/docId/382"><i>Stalling, D., Zöckler, M., Sander, O., & Hege, H. C. (1998), Weighted labels for 3D image segmentation</i></a>.
It consists in generating a second input image, made of integer coefficients called weights, and use those weights to define
smoother domain boundaries. The 3D image of weights can be generated using <i>CGAL::Mesh_3::generate_label_weights()</i>.</p>

<div style="text-align:center;">
  <a href="../../../../images/mesh3_weigthed_images.png"><img src="../../../../images/mesh3_weigthed_images.png" style="max-width:95%"/></a><br>
  <br><small>Mesh generation from labeled image without weights (left, 88,000 vertices)
   and with weights (right, 67,000 vertices).</small>
</div>

<br>
<p>The following example shows how to use weighted labeled images: <a href="https://doc.cgal.org/latest/Mesh_3/Mesh_3_2mesh_3D_weighted_image_8cpp-example.html">mesh_3D_weighted_image.cpp</a>.</p>

<p>Utilizing tetrahedral mesh generation from labeled images, incorporating both feature detection and weighted labels,
presents challenges. A new method that combines feature detection and weighted labels has been
designed and implemented in CGAL, achieving smooth and feature preserving output meshes.
This method leverages the best of these two new functionalities.</p>

<!--
<div style="text-align:center;">
  <a href="../../../../images/volumetric_wrap.png"><img src="../../../../images/volumetric_wrap.png" style="max-width:95%"/></a><br>
  <br><small>Volumetric mesh of the notoriously painful input <a href="https://ten-thousand-models.appspot.com/detail.html?file_id=996816">996816.stl</a> (Thingi10k). 380k cells in ~10s.</small>
</div>
-->



<br>
<h3>Self-intersecting input surfaces</h3>


<br>
<h3>Approximation Criterion on Feature Edges</h3>


<h3>Status</h3>

<p>All these new improvements are already integrated in CGAL's master branch on the
<a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and has just been officially released
in the latest version of CGAL, CGAL 6.0-beta1.</p>

<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/latest/Manual/packages.html#PkgMesh3">Documentation of the package Mesh_3</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
