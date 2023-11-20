---
layout: post
title: "New in CGAL: Interpolated Corrected Curvature Measures and Isotropic Remeshing with Sizing Field"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<p>
The CGAL project has been participating to 12 editions of the <a hef="https://summerofcode.withgoogle.com/">Google Summer of Code</a>
internship program. It is a great opportunity to welcome new members to our community, both contributors and mentors.
Today, we highlight the inclusion into the library of a 2022 contribution from <a href="https://github.com/hoskillua">Hossam Mohamed Seed</a>
mentored by <a href="https://perso.liris.cnrs.fr/david.coeurjolly/">David Coeurjolly</a>,
<a href="https://jacquesolivierlachaud.github.io/">Jacques-Olivier Lachaud</a> and <a href="https://geometryfactory.com/who-we-are/">Sébastien Loriot</a> on the one hand,
and of a 2023 contribution from <a href="https://3d.bk.tudelft.nl/ipaden/">Ivan Pađen</a> mentored by
<a href="https://geometryfactory.com/who-we-are/">Jane Tournois</a> and <a href="https://geometryfactory.com/who-we-are/">Sébastien Loriot</a> on the other hand.
The reason why we present them both together is because one is using the other one.

<br>
<h3>Interpolated Corrected Curvature Measures</h3>
Based on the article <a href="https://doi.org/10.1111/cgf.14067"><i>Lachaud, J.-O., Romon, P., Thibert, B. and Coeurjolly, D. (2020), Interpolated corrected curvature measures for polygonal surfaces. Computer Graphics Forum, 39: 41-54</i></a>,
the Polygon Mesh Processing package of CGAL now contains the function <code>interpolated_corrected_curvatures()</code>. This function
is able to compute the Gaussian curvature, the mean curvature, and the principal curvature and directions at every vertex (or a single one)
of a surface mesh. An additional parameter, the ball radius, is provided so that the curvature estimation is summed over the neigborhood within
a ball centered at each vertex (rather than using its 1-ring neighborhood) to accomodate for possible noise in the positions of vertices of
the surface mesh.   Additionally,  if the polygonal mesh has a user-prescribed normal vector field, as opposed to only relying solely on the geometric information
(e.g., post-processed normal vectors, normal vectors from normal maps), the corrected curvature measures can adapt accordingly.

<br>
<div style="text-align:center;">
  <a href="../../../../images/bimba_curvature.png"><img src="../../../../images/bimba_curvature.png" style="max-width:95%"/></a><br>
  <br><small> Mean curvature, Gaussian curvature, minimal principal curvature direction and maximal principal curvature direction on a mesh (ball radius set to 0.04).</small>
</div>
<br>
<br>

<h3>Isotropic Remeshing with Sizing Field</h3>

Almost since the introduction of the Polygon Mesh Processing package in CGAL, the function <code>isotropic_remeshing()</code>
provides a way to isotropically and uniformly remesh a triangle mesh, given a target edge length. This implementation
includes the preservation of (sharp) feature lines, as well as the possibility to only remesh a portion of the mesh.
Extending this work, a concept of sizing field as been incorporated in the function, and a first model has been
implemented following the article <a href="https://diglib.eg.org/handle/10.2312/conf.EG2013.short.029-032"><i>Dunyach, Marion, et al. "Adaptive remeshing for real-time mesh deformation." Eurographics 2013. The Eurographics Association, 2013.</i></a>
and using the Interpolated Corrected Curvature Measures function for curvature computation.

<br>
<div style="text-align:center;">
  <a href="../../../../images/david_comparison.png"><img src="../../../../images/david_comparison.png" style="max-width:95%"/></a><br>
  <br><small>Input Mesh (left), curvature based isotropic remeshing (right).</small>
</div>

<br>
<br>
<div style="text-align:center;">
  <a href="../../../../images/thorvaldsen_comparison.png"><img src="../../../../images/thorvaldsen_comparison.png" style="max-width:95%"/></a><br>
  <br><small>Input Mesh (left), curvature based isotropic remeshing (right).</small>
</div>
<br>


<h3>Status</h3>

<p>All these additions are already integrated in CGAL's master branch on the
<a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be officially released
in the upcoming version of CGAL, CGAL 6.0, scheduled for mid 2024.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://doc.cgal.org/5.6/Manual/packages.html#PkgPolygonMeshProcessing">Documentation of the package Polygon Mesh Processing</a>
<br>

<i class="glyphicon glyphicon-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Polygon_mesh_processing/index.html#title59">Documentation section of the master branch about <code>interpolated_corrected_curvatures()</code></a>
<br>

<i class="glyphicon glyphicon-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Polygon_mesh_processing/index.html#title8">Documentation section of the master branch about <code>isotropic_remeshing()</code></a>
<br>

<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
