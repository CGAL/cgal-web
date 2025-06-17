---
layout: post
title: "New in CGAL: Resolving Self-Intersections in a Surface Mesh, now with Snap Rounding"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Sébastien Loriot</a> & <a href="https://geometryfactory.com/who-we-are/">Léo Valque</a></h3>
<h4><a href="https://geometryfactory.com/">GeometryFactory</a></h4>

<br>
<h3>History of 3D Boolean Operations in CGAL</h3>

<p>In December 2004, CGAL 3.1 was released with the package <a href="https://doc.cgal.org/latest/Nef_3">3D Boolean Operations on Nef Polyhedra</a>
It provided a robust way to compute Boolean Operations on Nef Polyhedra. In particular, it allows users to do some Boolean operations
on solids bounded by surface meshes, but also on models with non-manifold features and 1D features. Even today, this package is probably
the only one in the open source world to allow this kind of operations. All this genericity comes at a price. Indeed the algorithm used
needs to compute and maintain an arrangement of circles on a sphere at each vertex of the Nef Polyhedra in order to enable those operations.
This representation also requires that the intersection points computed are coplanar with the polygongal faces they describe, implying the
use of a Kernel with exact constructions.</p>

<p>As all this genericity is not required for all applications, we decided to work on an alternative method that would be restricted to solids
being bounded by triangle meshes, and such that the output is manifold. In October 2012, we released an undocumented version of a new code
based of corefinement of triangles meshes. With the feedback of early adopters, we officially released with CGAL 4.10 in May 2017 inside
the <a href="https://doc.cgal.org/latest/Polygon_mesh_processing">Polygon Mesh Processing</a> package a rewrite of the original 3D Boolean operations through
corefinement. One of the key features of this code is the ability to compute several type of operations in one run (union and intersection
for example), and the possibility to store the result in a new mesh or directly update one of the input meshes to avoid recopying the entire
mesh if only a small portion is affected. When it comes to robustness, exact constructions are used under the hood to guarantee an output
with the correct topology. To show the robustness and the speed of the method, we posted a <a href="https://www.linkedin.com/pulse/benchmarking-mesh-union-using-cgal-libigl-sebastien-loriot/">benchmark</a>
on the <a href="https://ten-thousand-models.appspot.com/">Thingi10k data set</a> testing the code on thousands of models.</p>

<p>A question that was often asked by users was the possibility to use that code to resolve self-intersections in triangle meshes
and more particularly in solids. This gave us the idea to modify the corefinement code to write an autorefinement version
that would refine triangles from the same mesh that are intersecting along segments not in the input. Then, using those intersection
edges apply a self-union to resolve self-intersections of the solid.
</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/cylinder_autorefine.png"><img src="../../../../images/cylinder_autorefine.png" style="max-width:95%"/></a>
  <br><small>Left: A triangle mesh genererated by sweeping a circle along a spiral curve;
             Right: A triangle mesh free from self-intersection bounding the same volume as in the left picture;
             On the bottom, we see the intersection curve of a plane with the triangle meshes.</small>
</div>
<br>


In CGAL 4.11 (April 2018), we released an undocumented version of this autorefinement code. The code was however limited to
meshes where only pairs of triangles were intersecting along the same segment (as an underlying requirement of the code is
a pairwise intersection). In order to officially release that code, we needed to over come this limitation. Over the years,
we have tried to improve the code but we were limited by the notion of pairwise intersection.
As a new year resolution, on the 2nd of January 2023 we started a new from scratch implementation of an autorefinement
code of triangle soups, that was officially release in September 2024 with CGAL 6.0 (CGAL 5.6 being released in July 2023
we could not match the feature freeze of April even if the code was already working).

<h3>A Robust and Fast Method to Resolve Intersections in Triangle Soups</h3>

<p>The function <a href="https://doc.cgal.org/6.0/Polygon_mesh_processing/group__PMP__corefinement__grp.html#gaec85370aa0b2acc0919e5f8406cfb74c">CGAL::Polygon_mesh_processing::autorefine_triangle_soup()</a>
takes as input a triangle soup (a range of points and a range of triple of integers representing triangles using points indices), and resolves all
intersections among the triangles by refining the triangles no triangle intersects but along a shared edge or a shared vertex. The function operates
on a triangle soup and not a triangle mesh to be able to handle all kind of nasty input (including degenerate faces and non-manifoldness), but
also to be able to get non-manifold output. Indeed, even for two triangles intersecting along a line, after refining them to resolve the intersection
you end up with four triangles sharing the same edge.

In order to show the robustness and the runtime efficiency of the function, we ran it over all 10,000 models from the Thingi10k repository.
The computer used for the benchmark runs a x86_64 Debian GNU/Linux 6.1.0-12-amd64 and features a 2016 Intel(R) Xeon(R) CPU E5-1650 v4 @ 3.60GHz with 6 threads/12 hyperthreads.
The values of memory are the maximum resident set size (given using `/usr/bin/time` command).
</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/autoref_runtime.png"><img src="../../../../images/autoref_runtime.png" style="max-width:95%"/></a>
</div>
<br>
<div style="text-align:center;">
  <a href="../../../../images/autoref_mem.png"><img src="../../../../images/autoref_mem.png" style="max-width:95%"/></a>
</div>


<p>Even if exact computations are used internally, if the input is using double coordinates, then the output point coordinates are also rounded to double coordinates.
As a matter of fact, this naive rounding to double implies that out the 9997 valid input files, only 9425 were free from self-intersection after autorefine and naive rounding.
So we are left with 572 files still featuring self-intersections while the purpose of calling the autorefine function was to resolve them.</p>

<br>
<h3>A New Snapping Strategy</h3>

<p>
Based on [1], CGAL 6.1 introduces the new parameter `apply_iterative_snap_rouding()` to the autorefine function to activate a snapping strategy in order
to avoid self-intersections produced while rounding the coordinates to double.
With the default values of the parameters for this method, all the models but one could be rounded with one call.
The remaining model required a few more iterations.

The main idea behind the method is a loop that rounds coordinates of triangles involved in a self-intersections onto a floating point number type, eliminate degenerate
elements, and resolve again the self-intersections, until a maximum number of iterations is reached or all self-intersections are resolved.
Even if there is no theoretical guarantee for successful termination, it has good experimental results.

This result will be presented at <a href="https://sgp2025.my.canva.site/">SGP 2025</a> in Bilbao.

<br>
<h4>Status</h4>

<p>All methods are already integrated in CGAL's master branch on the
<a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a> and
will be officially released in the upcoming version of CGAL, CGAL 6.1, scheduled for summer 2025.</p>

<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/6.1/Polygon_mesh_processing/group__PMP__corefinement__grp.html#gaec85370aa0b2acc0919e5f8406cfb74c">Documentation of the function <em>CGAL::Polygon_mesh_processing::autorefine_triangle_soup()</em></a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
<br><br>

<h4>Bibliography</h4>
[1] Sylvain Lazard and Leo Valque. Removing self-intersections in 3D meshes while preserving floating-point coordinates. Computer Graphics Forum. Vol. XX. No. X. 2025.
