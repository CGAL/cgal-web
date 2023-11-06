---
layout: post
title: "New in CGAL: Shape Detection enhancements"
description: "a new Generalized Region Growing algorithm enables much more genericity"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://www.tvhoang.com">Thien Hoang</a> and <a href="https://anisimovdmitry.com">Dmitry Anisimov</a></h3>
<h4><a href="https://www.inria.fr/en/centre/sophia">INRIA Sophia Antipolis</a></h4>

<br>
<p>Geometry processing pipelines often require detecting various shapes among user-defined items. The simplest examples are detecting planar shapes in an unstructured point cloud or on the surface of a polygon mesh. More specific use cases may show up in practice, too. For example, detecting lines in a 2D point cloud or detecting spheres in a 3D point cloud. CGAL already offers a <a href="https://doc.cgal.org/4.14/Point_set_shape_detection_3/index.html">shape detection algorithm</a> based on the 
<a href="https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1467-8659.2007.01016.x">*Efficient RANSAC (RANdom SAmple Consensus)*</a> method and a simple version of the *Region Growing (RG)* method for detecting planes in a 3D point cloud.</p>

<p>For the next CGAL release (5.0), we have completely reworked the RG-based shape detection algorithm such that it is now able to handle any user-defined items given the connectivity among them and a user-specified region type. In addition to the generic version of the algorithm, we have also added three particular instances: detecting lines in a 2D point cloud, detecting planes in a 3D point cloud, and detecting planes on a polygon mesh.</p>

<br>
<h3>Detecting Lines in a 2D Point Cloud </h3>

<p>Given a set of 2D points with the corresponding normals, the algorithm groups these points with respect to the quality of the local least squares 2D line fit. The connectivity among points is provided via a K-d tree.</p>

<div style="text-align:center;">
  <img src="../../../../images/2d-pc.png" width="100%"><br>
  <small>A 2D point set depicted with one color per detected line.</small>
</div>

<br>
<h3>Detecting Planes in a 3D Point Cloud</h3>

<p>Given a set of 3D points with the corresponding normals, the algorithm groups these points with respect to the quality of the local least squares 3D plane fit. The connectivity among points is provided via a K-d tree.</p>

<br>
<div style="text-align:center;">
  <img src="../../../../images/3d-pc.png" width="100%"><br>
  <small>A 3D point set depicted with one color per detected plane.</small>
</div>

<br>
<p>This type of detection can be used in conjunction with a new package added in the next version of CGAL, <a href="../../08/05/Polygonal_surface_reconstruction/">Polygonal Surface Reconstruction</a> to reconstruct piecewise planar surfaces from point clouds. An example of both features working together is available <a href="https://github.com/CGAL/cgal/blob/5220b7d26095f817f959ba412405b961d061bbb9/Polygonal_surface_reconstruction/examples/Polygonal_surface_reconstruction/polyfit_example_with_region_growing.cpp">here</a>.</p>

<br>
<h3>Detecting Planes on a Polygon Mesh</h3>

<p>Given a triangle surface mesh, the algorithm groups its faces with respect to the quality of the local least squares plane fit. The connectivity and normals are obtained directly from the mesh.</p>

<br>
<div style="text-align:center;">
  <img src="../../../../images/3d-pm.png" width="100%"><br>
  <small>A triangle surface mesh depicted with one color per detected plane.</small>
</div>

<br>
<p>This package is already available in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>,
and will be officially released in the upcoming version of CGAL, 5.0, scheduled for Autumn 2019.</p>

<i class="bi bi-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Shape_detection/index.html#Shape_detection_RegionGrowing">Documentation of the package Shape_detection</a> <br>

<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
