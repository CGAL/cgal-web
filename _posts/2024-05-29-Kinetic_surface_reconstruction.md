---
layout: post
title: "New in CGAL: Kinetic Space Partition and Kinetic Surface Reconstruction"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Sven Oesau</a>,
<a href="https://www-sop.inria.fr/members/Florent.Lafarge/">Florent Lafarge</a>.
</h3>
<h4><a href="https://geometryfactory.com/">GeometryFactory</a>, <a href="https://team.inria.fr/titane/">INRIA Sophia Antipolis</a></h4>
<br>

<h3>Kinetic Surface Reconstruction</h3>

<div style="text-align:center;">
  <a href="../../../../images/KSR_meeting_room_outside.png"><img src="../../../../images/KSR_meeting_room_outside.png" style="max-width:95%"/></a><br>
  <br><small>Indoor LiDAR point cloud and low-polygonal mesh from Kinetic Surface Reconstruction.</small>
</div>

<p>Acquired point clouds suffer from various defects like noise, missing data and clutter. Reconstruction methods are required to fill in missing parts reasonably to provide a complete reconstruction. Common methods for reconstructing smooth surfaces, e.g., the <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Poisson_surface_reconstruction_3/index.html">Poisson Surface Reconstruction</a>, fit an implicit function to the point cloud and extract the level set. However, those methods have difficulties in reconstructing sharp features and piecewise-planar objects. In addition, they often provide a large number of triangles.</p>
<p>Having architecture and man-made objects with a piecewise-linear geometry in mind, a popular approach to guarantee a watertight volume is by creating a space partitioning. An occupancy labeling divides the cells of the partitioning into empty or occupied space and thus generates a closed surface. A typical choice to fill in unobserved parts of the object is to use the extensions of detected shapes in the point cloud.</p>
<p>The Kinetic Surface Reconstruction <code>CGAL::Kinetic_surface_reconstruction_3</code> provides a state of the art 3D reconstruction pipeline based on the <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Kinetic_space_partition/index.html">Kinetic Space Partition</a><code>CGAL::Kinetic_shape_partition_3</code>. While the Kinetic Space Partition is the core mechanism providing the geometry for the reconstruction, other steps are necessary to feed the partition with planar shapes and to extract the 3D surface from the partition. Our pipeline, based on <a href="https://inria.hal.science/hal-02924409/file/tog2020.pdf">Bauchet, J.-P., & Lafarge, F. (2020). Kinetic Shape Reconstruction. In ACM Transactions of Graphics, 39(5), 2020</a>, takes an oriented point cloud as input and generates a watertight 3D polygonal surface.</p>

<div style="text-align:center;">
  <a href="../../../../images/KSR_indoor_overlay.png"><img src="../../../../images/KSR_indoor_overlay.png" style="max-width:95%"/></a><br>
  <br><small>Indoor LiDAR point cloud and low-polygonal mesh from Kinetic Surface Reconstruction.</small>

</div>
<br>
<div style="text-align:center;">
  <a href="../../../../images/KSR_indoor_reconstruction.png"><img src="../../../../images/KSR_indoor_reconstruction.png" style="max-width:95%"/></a><br>
  <br><small>Polygon mesh only.</small>
</div>
<p>While the reconstruction pipeline has several parameters, which are directly passed to methods from the <a href="https://doc.cgal.org/latest/Shape_detection/index.html">Shape Detection package</a> and <a href="https://doc.cgal.org/latest/Shape_regularization/index.html">Shape Regularization package</a>, the Kinetic Space Partition and Kinetic Surface Reconstruction add a few parameters to give the user control over the reconstruction. The complexity of the surface can be adapted to favor simpler surfaces, i.e., with a lower polygon count.</p>
<p>
The occupancy labeling may consider the sides of the bounding boxes as empty space, e.g., for the reconstruction of objects, or individually as occupied space, e.g., the bottom or ground side in the case of aerial LiDAR. Also the bounding box for the space partition can be axis-aligned or oriented without transforming the input data.</p>

<p>All reconstructions shown here have been created with the example <a href="https://github.com/CGAL/cgal/blob/master/Kinetic_surface_reconstruction/examples/Kinetic_surface_reconstruction/ksr_parameters.cpp">ksr_parameters.cpp</a>. The used parameters are listed in the <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Kinetic_surface_reconstruction/index.html#title9">Performance</a> chapter in the user manual and the <a href="https://files.inria.fr/titane/KSR42_dataset.zip">datasets</a> can be found on the <a href="https://team.inria.fr/titane/">INRIA Titane webpage</a>.</p>

<div style="text-align:center;">
  <a href="../../../../images/KSR_church_parameters.png"><img src="../../../../images/KSR_church_parameters.png" style="max-width:95%"/></a><br>
  <br><small>Reconstruction of aerial LiDAR of a church with different complexity parameters (a) and (b). (c) shows the reconstruction with an axis-aligned bounding box and (d) sets the bottom bounding box face to be labeled as empty.</small>
</div>

<h3>Kinetic Space Partition</h3>
<p>The major challenges of space decomposition and labeling methods are high computational complexity and a large number of small cells which are caused by the often indefinite extension of planar shapes. The Kinetic Space Partition overcomes these limitations by following a kinetic approach. Planar input shapes are not extended indefinitely, but extend over time until they collide with other input shapes. A user-provided parameter to adjust the overall complexity of the partition limits the extension of shapes after a number of intersections with other shapes. Thus, the Kinetic Space Partition is a subset of a full plane arrangement and small input shapes are limited to only have a local impact on the partition.</p>
<p>A subdivision by using an octree allows to split up the input shapes into smaller Kinetic Space Partitions and thus provide a significant speedup. The mechanism is fully transparent as the smaller partitions are fused into one conformal partition.</p>
<div style="text-align:center;">
  <a href="../../../../images/KSP_horse_octree.png"><img src="../../../../images/KSP_horse_octree.png" style="max-width:95%"/></a><br>
  <br><small>Point cloud of a horse split into 127 kinetic space partitions using an octree.</small>
</div>
<h4>Performance</h4>
<p>The running time of the Kinetic Surface Reconstruction depends mostly on the Shape Detection and the Kinetic Space Partition. The use of Shape Regularization is optional, but can increase the performance and the quality of the reconstruction, particularly in the case of architecture and piecewise-planar objects. The indoor point cloud used in the first two figures has around 3 million points and the reconstruction of the model takes around 132 seconds. The church model has around 1.2 million points and was reconstructed in around 36s.</p>
<h4>Status</h4>
<p>The Kinetic Shape Partition and the Kinetic Surface Reconstruction are already integrated in CGAL's master branch on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be officially released in the upcoming version of CGAL, CGAL 6.0, scheduled for June 2024.</p>

<i class="bi bi-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Kinetic_surface_reconstruction/index.html">Documentation of the package Kinetic Surface Reconstruction</a><br>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Kinetic_space_partition/index.html">Documentation of the package Kinetic Space Partition</a> <br>

<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
