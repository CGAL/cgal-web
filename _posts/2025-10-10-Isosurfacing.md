---
layout: post
title: "New in CGAL: Isosurfacing"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Mael Rouxel-Labbé</a>&deg;,
<a href="https://www.lgdv.tf.fau.de/person/julian-stahl/">Julian Stahl</a>&dagger;,
<a href="https://daniel-zint.github.io/">Daniel Zint</a>&#42;,
<a href="https://www-sop.inria.fr/members/Pierre.Alliez/">Pierre Alliez</a>&#42;.
</h3>
<h4>&deg;<a href="https://geometryfactory.com/">GeometryFactory</a>,
    &dagger;<a href="https://www.fau.eu/">Friedrich-Alexander-Universität</a>,
    &#42;<a href="https://team.inria.fr/titane/">INRIA Sophia Antipolis</a></h4>

<br>
<div style="text-align:center;">
  <a href="../../../../images/isosurfacing_teaser.png"><img src="../../../../images/isosurfacing_teaser.png" style="max-width:50%"/></a>
</div>

<br>
<p>"Isosurfacing", also known as "isosurface extraction" or "contouring", is the process
of constructing the isosurface corresponding to a given value field and isovalue.
Isosurfacing is often needed for volume visualization and for the simulation of physical phenomena.<p>

<p>CGAL offers various packages and functions that can be used to generate meshes for various types of
input data (see chapter <a href="https://doc.cgal.org/latest/Manual/packages.html#PartMeshing"> Mesh Generation
</a>), most notably the package <a href="https://doc.cgal.org/latest/Manual/packages.html#PkgMesh3">3D Mesh Generation</a>,
which is able to generate surface and volume meshes of implicit functions, 3D images, polyhedral
domains, etc. This package is based on one of the most fundamental structures in computationa geometry,
the Delaunay triangulation. However, a large category of classical isosurfacing methods had been
missing from CGAL: the approaches based on contouring using volumetric grids.</p>

<br>
<h3>New Package: 3D Isosurfacing</h3>

<p>The initial version of the new package, <a href="https://doc.cgal.org/latest/Isosurfacing_3/index.html">3D Isosurfacing</a>
offers the following methods to extract isosurfaces from 3D value fields:</p>

<ul>
  <li><a href="https://doc.cgal.org/latest/Isosurfacing_3/index.html#SubSecMarchingCubes">Marching Cubes (MC)</a>:
  a simple and efficient method that generates a triangle mesh, with almost no guarantees.</li>
  <li><a href="https://doc.cgal.org/latest/Isosurfacing_3/index.html#SubSecTMC">Topologically Correct Marching Cubes (TMC)</a>:
  an extension to Marching Cubes that provides additional guarantees for the output.</li>
  <li><a href="https://doc.cgal.org/latest/Isosurfacing_3/index.html#SubSecDualContouring">Dual Contouring (DC)</a>:
  a method that generates a polygon mesh, with a focus on sharp features recovery.</li>
</ul>

<p>These contouring techniques rely on the partition of the 3D space and of the field to construct
an approximate representation of the isosurface. The 3D value field can be described through various
representations: an implicit function, an interpolated set of discrete sampling values, a 3D image,
etc. (see <a href="https://doc.cgal.org/latest/Isosurfacing_3/index.html#title8">the examples</a>
in the documentation). The isovalue is user-defined. The output is a polygon soup, made either
of triangles or quads depending on the method, and may consist of a single connected component,
or multiple, disjoint components. Each method offer tuning options to select specific strategies,
such as the placement at the center of the cell or optimized using Quadric Error Metrics (QEM)
for Dual Contouring.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/isosurfacing_MC_DC.png"><img src="../../../../images/isosurfacing_MC_DC.png" style="max-width:75%"/></a>
  <br><small>Contouring a simple implicit function with Marching Cubes (left) and Dual Contouring (DC).</small>
</div>

<br>
<h3>Topologically correct Marching Cubes</h3>

<p>Topologically Correct Marching Cubes is an extension to the Marching Cubes algorithm which provides
additional guarantees for the output [1]. More specifically, it generates a mesh
that is homeomorphic to the trilinear interpolant of the input value field inside each cube.
This means that the output mesh can accurately represent small complex features. For example,
a tunnel of the isosurface within a single cell is topologically resolved. To achieve this,
the algorithm can insert additional vertices within cells. Furthermore, the mesh is guaranteed
to be 2-manifold and watertight, as long as the isosurface does not intersect the domain boundaries..</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/isosurfacing_MC_TMC.png"><img src="../../../../images/isosurfacing_MC_TMC.png" style="max-width:95%"/></a>
  <br><small>Trilinearly interpolated surface (left), Marching Cubes (middle), and
  Topologically Correct Marching Cubes (right). The latter correctly recovers the topology of the surface.</small>
</div>

<h4>Status</h4>

<p>The package 3D Isosurfacing has been available since CGAL 6.1, released in the fall of 2025.</p>

<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/latest/Manual/packages.html#PkgIsosurfacing3">Documentation of the "3D Isosurfacing" package</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/main">CGAL "main" branch on GitHub</a>
<br><br>

<h4>Bibliography</h4>

<p>
[1] Roberto Grosso. Construction of topologically correct and manifold isosurfaces. In Computer Graphics Forum, volume 35, pages 187–196. Wiley Online Library, 2016.
</p>
