---
layout: post
title: "New in CGAL: Wrappers for Registration Libraries"
description: "Introducing wrappers for OpenGR and Pointmatcher for point cloud registration"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="http://www.necipyildiran.com/">Necip Fazil Yildiran</a>, <a href="https://www.irit.fr/recherches/STORM/MelladoNicolas/">Nicolas Mellado</a> and <a href="https://github.com/sgiraudot">Simon Giraudot</a></h3>
<h4><a href="https://www.irit.fr/STORM/site/">STORM, IRIT</a> and <a href="https://geometryfactory.com/">GeometryFactory</a></h4>

<br>
<p>Digitizing large objects or scenes often is often performed by scanning from several points of view and merging the scans together afterwards. If the sensors used for acquisition do not have a way to spatially organize these scans, a registration algorithm should be applied in order to produce a unified point cloud that is spatially consistent; even if the sensors used do produce localization and orientation information, these might still suffer from noise and imprecision and require a registration processing.</p>

<p>CGAL now offers wrappers for two registration libraries: <em><a href="https://storm-irit.github.io/OpenGR/">OpenGR</a></em> and <em><a href="https://github.com/ethz-asl/libpointmatcher">Pointmatcher</a></em>, enabling the combination of these tools with the diverse algorithms of CGAL (<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Point_set_processing_3/index.html">Point set processing</a>, <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Manual/packages.html#PartReconstruction">Shape Reconstruction</a>, <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Shape_detection/index.html#Chapter_Shape_Detection">Shape Detection</a>, <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Classification/index.html#Chapter_Classification">Classification</a>, ...) in a seamless and efficient manner.</p>

<br>
<h3>OpenGR</h3>

<p><em>OpenGR</em> is a collection of C++ libraries for 3D Global Registration released under the terms of the APACHE V2 licence. The algorithm used is Super4PCS.</p>

<p>From two arbitrarily located and arbitrarily oriented point clouds, <em>OpenGR</em> computes a global registration transformation: applying this transformation to the second point cloud makes it coarsely registered with the first one.</p>

<br>
<h3>Pointmatcher</h3>

<p><em>Pointmatcher</em> is a modular library implementing the Iterative Closest Point (ICP) algorithm for aligning point clouds, released under the terms of the BSD license.</p>

<p>From point clouds roughly registered (for example, using the output of <em>OpenGR</em>), <em>Pointmatcher</em> computes a fine registration transformation: applying this transformation to the second point cloud makes it finely registered with the first one.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/Registration.png"><img src="../../../../images/Registration.png" style="max-width:95%"/></a><br>
  <small>Registration pipeline. From left to right: input point cloud, output of coarse registration with <em>OpenGR</em>, output of fine registration using <em>Pointmatcher</em>.</small>
</div>
<br>

Both wrappers are part of the <b>Point set processing</b> package; two new examples (<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Point_set_processing_3/Point_set_processing_3_2registration_with_OpenGR_8cpp-example.html">one for OpenGR</a>, and <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Point_set_processing_3/Point_set_processing_3_2registration_with_pointmatcher_8cpp-example.html">one for Pointmatcher</a>) have been added to get you quickly started.

<i class="bi bi-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Point_set_processing_3/index.html">Documentation of the package Point_set_processing_3</a> <br>

<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
