---
layout: post
title: "New in CGAL: Surface Mesh Topology"
description: "Toolbox for manipulating curves on a combinatorial surface from the topological viewpoint"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://perso.liris.cnrs.fr/guillaume.damiand/index.php?lang=en">Guillaume Damiand</a>, <a href="https://pagesperso.g-scop.grenoble-inp.fr/~lazarusf/">Francis Lazarus</a></h3>
<h4>CNRS, Liris - CNRS, G-Scop</h4>

<br>

<p>This package provides a toolbox for manipulating curves on a combinatorial surface from the topological viewpoint. Two main functionalities are proposed. One is the computation of shortest curves that cannot be continuously deformed to a point. This includes the computation of the so-called edge width and face width of the vertex-edge graph of a combinatorial surface. The other functionality is the homotopy test for deciding if two given curves on a combinatorial surface can be continuously deformed one into the other.<p>

<br>

<h3>Compute Shortest Non-contractible Cycle</h3>

<p>In this package, four methods are implemented:</p>

<ul>
<li><code>compute_shortest_non_contractible_cycle_with_base_point(dh, weight_functor)</code> to compute a shortest non-contractible cycle going through the source vertex of dh,</li>
<li><code>compute_shortest_non_contractible_cycle(weight_functor)</code> to compute a shortest non-contractible cycle through every vertex and returns the shortest cycle among them,</li>
<li><code>compute_edge_width()</code> to compute the edge width of the mesh, equivalent to compute_shortest_non_contractible_cycle( Unit_weight_functor()).</li>
<li><code>compute_face_width()</code> to compute the sequence of dart handles as described above and returns an std::vector of dart handles, where each dart represents a traversed face followed by an incident vertex.</li>
</ul>

<br>
<div style="text-align:center;">
  <a href="../../../../images/edge-width.png"><img src="../../../../images/edge-width.png" style="max-width:95%"/></a><br>
  <small>Pink cycle is the edge width of the mesh: the shortest (in number of edges) non contractible cycle. Green cycle is the shortest (in length) non contractible cycle. </small>
</div>
<br>

<h3>Homotopy Test</h3>

<p>In this package, three tests are available:</p>
<ul>
<li><code>is_contractible( \(p_1\))</code> to test if the closed curve \(p_1\) is contractible,</li>
<li><code>are_freely_homotopic( \(p_1\), \(p_2\))</code> to test if the closed curves \(p_1\) and \(p_2\) are freely homotopic,</li>
<li><code>are_homotopic_with_fixed_endpoints( \(p_1\), \(p_2\))</code> to test if the paths \(p_1\) and \(p_2\) are homotopic with fixed endpoints.</li>
</ul>

<br>
<div style="text-align:center;">
  <a href="../../../../images/free-vs-fixed-endpoints.svg"><img src="../../../../images/free-vs-fixed-endpoints.svg" style="max-width:95%"/></a><br>
  <small>On the upper left surface the green curve is contractible. The red and blue curves share the same (green) endpoint. (Being closed, their two endpoints coincide.) These last two curves are freely homotopic as shown by the suggested continuous transformation of the blue curve.</small>
</div>
<br>

<br>

<h3>implementation in CGAL</h3>

<p>The package <em>Surface Mesh Topology</em> is already integrated in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 5.1, scheduled for July 2020.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Surface_mesh_topology/index.html">Documentation of the package Surface Mesh Topology</a> <br>

<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
