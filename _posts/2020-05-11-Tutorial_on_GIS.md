---
layout: post
title: "New in CGAL: Tutorial on GIS"
description: "Demonstrating how to use CGAL packages for Geometric Information System applications"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://github.com/sgiraudot">Simon Giraudot</a></h3>
<h4><a href="https://geometryfactory.com/">GeometryFactory</a></h4>

<br>

<p>Geographic Information Systems (GIS) aim at modelizing, processing and storing geographic data. Many applications in GIS rely on specific data structures such as Triangulated Irregulator Network (TIN) or raster images. Some of these data structures can efficiently be computed and processed by the CGAL library.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/gis_tuto.jpg"><img src="../../../../images/gis_tuto.jpg" style="max-width:100%"/></a><br>
  <small>Two examples of GIS applications: Digital Surface Model and Classification of a LIDAR point cloud</small>
</div>
<br>

<br>
<h3>GIS using CGAL</h3>

<p>Although the CGAL library does not provide a GIS package per se, many of its existing algorithms and data structures can be used for GIS applications. For example, combining the 2D Delaunay Triangulation with projection traits makes the generation of TIN a very simple and straightforward operation.<p>

<p>Because applying the geometric tools of CGAL may not be such an obvious option to GIS developers, CGAL now offers a <a href="">Tutorial on GIS</a>. This tutorial covers many packages such as <a href="https://doc.cgal.org/latest/Triangulation_2/index.html#Chapter_2D_Triangulations">Delaunay Triangulations</a>, <a href="https://doc.cgal.org/latest/Classification/index.html#Chapter_Classification">Classification</a>, <a href="https://doc.cgal.org/latest/Point_set_processing_3/index.html#Chapter_Point_Set_Processing">Point Set</a> and <a href="https://doc.cgal.org/latest/Polygon_mesh_processing/index.html#Chapter_PolygonMeshProcessing">Polygon Mesh Processing</a>... It explains how to combine these various tools into efficient GIS applications: generating Digital Terrain Models (DTM) with ground estimation, rastering at any resolution wanted, contouring height isolevels, etc.</p>

<br>
<h3>Code Provided</h3>

<p>The whole tutorial is illustrated by screenshots of point clouds and meshes, and by code snippets. All of these code snippets form a complete program that is provided and that can be compiled and run by users.</p>

<br>
<div style="text-align:center;">
  <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Manual/tuto_gis.html"><img src="../../../../images/gis_tutorial.png" style="max-width:50%"/></a><br>
  <small>The new Tutorial on GIS.</small>
</div>
<br>

<i class="glyphicon glyphicon-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Manual/tuto_gis.html">Tutorial on GIS</a> <br>

<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
