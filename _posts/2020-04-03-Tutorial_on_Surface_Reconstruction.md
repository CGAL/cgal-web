---
layout: post
title: "New in CGAL: Tutorial on Surface Reconstruction"
description: "Demonstrating different use cases of Point Set Processing and Reconstruction packages"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://github.com/sgiraudot">Simon Giraudot</a></h3>
<h4><a href="https://geometryfactory.com/">GeometryFactory</a></h4>

<br>

<p>Surface reconstruction from point clouds is a core topic in geometry processing. It is an ill-posed problem: there is an infinite number of surfaces that approximate a single point cloud and a point cloud does not define a surface in itself. Thus additional assumptions and constraints must be defined by the user and reconstruction can be achieved in many different ways.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/compare_reconstructions.png"><img src="../../../../images/compare_reconstructions.png" style="max-width:95%"/></a><br>
  <small>Comparison of reconstruction methods applied to the same input (full shape and close-up). From left to right: original point cloud; Poisson; advancing front; scale space.</small>
</div>
<br>

<br>
<h3>Reconstruction in CGAL</h3>

<p>Several surface reconstruction algorithms are provided by CGAL, namely <a href="https://doc.cgal.org/latest/Poisson_surface_reconstruction_3/index.html#Chapter_Poisson_Surface_Reconstruction">Poisson Surface Reconstruction</a>, <a href="https://doc.cgal.org/latest/Advancing_front_surface_reconstruction/index.html#Chapter_Advancing_Front_Surface_Reconstruction">Advancing Front Surface Reconstruction</a> and <a href="https://doc.cgal.org/latest/Scale_space_reconstruction_3/index.html#Chapter_Scale_space_reconstruction">Scale Space Surface Reconstruction</a> (in addition, <a href="https://doc.cgal.org/latest/Optimal_transportation_reconstruction_2/index.html#Chapter_Optimal_Transportation_Curve_Reconstruction">Optimal Transportation Curve Reconstruction</a> covers curve reconstructions in 2D while <a href="https://doc.cgal.org/latest/Polygonal_surface_reconstruction/index.html#Chapter_PolygonalSurfaceReconstruction">Polygonal Surface Reconstruction</a> implements a piecewise planar reconstruction algorithm specialized for urban processing). In addition, packages <a href="https://doc.cgal.org/latest/Point_set_processing_3/index.html#Chapter_Point_Set_Processing">Point Set Processing</a> and <a href="https://doc.cgal.org/latest/Spatial_searching/index.html#Chapter_dD_Spatial_Searching">Spatial Searching</a> can be used to preprocess point clouds.<p>

<p>Because such a diverse set of tools can be confusing for users, CGAL now offers a <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Manual/tuto_reconstruction.html">Tutorial on Surface Reconstruction from Point Clouds</a>. This tutorial explains how to choose the right algorithm, how to preprocess defect-laden data, how the different algorithm are expected to behave depending on the data and on parameters, and how to save and postprocess the output meshes.</p>

<br>
<h3>Code Provided</h3>

<p>The whole tutorial is illustrated by screenshots of point clouds and meshes and by code snippets. All of these code snippets form a full program that is provided and that can be compiled and runned by users.</p>

<br>
<div style="text-align:center;">
  <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Manual/tuto_reconstruction.html"><img src="../../../../images/reconstruction_tutorial.png" style="max-width:50%"/></a><br>
  <small>The new Tutorial on Surface Reconstruction from Point Clouds.</small>
</div>
<br>

<i class="glyphicon glyphicon-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Manual/tuto_reconstruction.html">Tutorial on Surface Reconstruction from Point Clouds</a> <br>

<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
