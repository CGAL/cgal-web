---
layout: post
title: "New in CGAL: 3D Generalized Barycentric Coordinates"
description: "Fast and closed-form generalized barycentric coordinates for convex simplicial polytopes"
category:
tags: [""]
---
{% include JB/setup %}

<h3>
<a href="https://www.linkedin.com/in/antonio-gomes-023019230/">Antonio Gomes</a>, 
<a href="https://www.linkedin.com/in/dmitry-anisimov/">Dmitry Anisimov</a></h3>

<br>
<p>The upcoming CGAL release 6.2, will introduce the package <a href="https://cgal.geometryfactory.com/CGAL/doc/main/Barycentric_coordinates_3/index.html">3D Generalized Barycentric Coordinates</a> which was developed during a <a href="https://summerofcode.withgoogle.com/">Google Summer of Code</a>. The 3D package complements the existing <a href="https://doc.cgal.org/latest/Barycentric_coordinates_2/index.html">2D package</a>. Barycentric coordinates are a fundamental tool in geometry processing, interpolation, and deformation. While classical barycentric coordinates are defined with respect to simplices, many modern applications require coordinates over more general polyhedral shapes. This package implements several widely used closed-form formulations, including Wachspress, discrete harmonic, and mean value coordinates, all adapted to convex 3D polyhedra with triangular faces.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/barycentric_overview.svg"><img src="../../../../images/barycentric_overview.svg" style="max-width:95%"/></a><br>
  <br><small>Wachspress, discrete harmonic, mean value, and harmonic coordinate functions for a convex polygon plotted with respect to the marked vertex.</small>
</div>
<br>

<p>One application of barycentric coordinates is shape deformation. The barycentric coordinates of vertex positions of an input object are calculated with respect to an enclosing convex polyhedron, e.g., a bounding box. The deformed object can then be obtained by retrieving the vertex positions deforming the enclosing polyhedron.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/barycentric_shape_deform.png"><img src="../../../../images/barycentric_shape_deform.png" style="max-width:95%"/></a><br>
  <br><small>A sphere deformed by using a deformed bounding box as reference.</small>
</div>

<br>
<h3>Status</h3>

<p>The package Barycentric_coordinates_3 is already integrated in CGAL's "main" branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 6.2, scheduled for June 2026.</p>

<i class="bi bi-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/main/Barycentric_coordinates_3/index.html">Documentation of the package Barycentric_coordinates_3</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/main">CGAL "main" branch on GitHub</a>

