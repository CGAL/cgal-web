---
layout: post
title: "New in CGAL: Approximate Convex Decomposition"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Sven Oesau</a></h3>
<br>

<div style="text-align:center;">
  <a href="../../../../images/acd_results.jpg"><img src="../../../../images/acd_results.jpg" style="max-width:95%"/></a><br>
  <br><small>A camel mesh decomposed into 4, 8 and 12 convex volumes.</small>
</div>
<p>The upcoming CGAL release 6.2, will introduce the method <a href="https://cgal.geometryfactory.com/CGAL/doc/main/Convex_decomposition_3/index.html#title4">Approximate Convex Decomposition</a>. Convex decomposition of 3D objects have applications ranging from collision detection and rigid body simulation to motion planning and geometric approximation. While exact convex decomposition algorithms provide strong guarantees, they can produce a large number of components and can be NP-hard if the minimal number of components is required.</p>

<p>The approximate convex decomposition addresses these limitations by partitioning closed triangle meshes into a set of convex components while providing direct control over the approximation quality and the number of components. Instead of enforcing exact convexity, the algorithm iteratively detects highly concave regions and introduces cuts that reduce the overall concavity of the shape. The decomposition output is represented as a collection of submeshes that can easily be reused in applications relying on Surface_mesh or Polygon Mesh Processing.</p>

<p>The method employs a voxel grid to detect concave parts of the objects and follows a hierarchical splitting strategy to decompose the object into a larger number of convex volumes. The final desired number of convex volumes is obtained via an error-driven merging phase that recombines the smaller convex volumes while keeping the volumetric overhead as small as possible.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/acd_pipeline.jpg"><img src="../../../../images/acd_pipeline.jpg" style="max-width:95%"/></a><br>
  <br><small>From left to right: 1) Input mesh, 2) Voxelization, 3) Convex volumes after splitting phase, 4) Final 10 convex volumes.</small>
</div>

<br>
<h3>Status</h3>

<p>The method "Approximate Convex Decomposition" is already integrated in CGAL's "main" branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 6.2, scheduled for June 2026.</p>

<i class="bi bi-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/main/Convex_decomposition_3/index.html#title4">Documentation of the Approximate Convex Decomposition</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/main">CGAL "main" branch on GitHub</a>
