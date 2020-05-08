---
layout: post
title: "New in CGAL: Surface Mesh Topology"
description: "Toolbox for manipulating curves on a combinatorial surface from the topological point of view"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://perso.liris.cnrs.fr/guillaume.damiand/index.php?lang=en">Guillaume Damiand</a>, <a href="https://pagesperso.g-scop.grenoble-inp.fr/~lazarusf/">Francis Lazarus</a></h3>
<h4>CNRS, Liris - CNRS, G-Scop</h4>

<br>

<p>This package provides a toolbox for manipulating curves on a combinatorial surface from the topological point of view. Two main functionalities are proposed. One is the computation of shortest curves that cannot be continuously deformed to a point. This includes the computation of the so-called edge width and face width of the vertex-edge graph of a combinatorial surface. The other functionality is the homotopy test for deciding if two given curves on a combinatorial surface can be continuously deformed one into the other.<p>

<br>

<h3>Compute Shortest Non-contractible Cycle</h3>

<p>In this package, four algorithms are implemented:</p>

<ul>
<li>compute a shortest non-contractible cycle going through the source vertex of dh
(see <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Surface_mesh_topology/classCGAL_1_1Surface__mesh__topology_1_1Curves__on__surface__topology.html#a10cf61303431fd08fd6b79fb37d2756e">here</a>),</li>
<li>compute a shortest non-contractible cycle through every vertex and returns the shortest cycle among them, possibly with weights associated with edges
(see <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Surface_mesh_topology/classCGAL_1_1Surface__mesh__topology_1_1Curves__on__surface__topology.html#ab4a3ec02fe8bcfad6bb45a2b11046e95">here</a>),</li>
<li>compute the edge width of the mesh, (a shortest non-contractible cycle with unit weights)
(see <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Surface_mesh_topology/classCGAL_1_1Surface__mesh__topology_1_1Curves__on__surface__topology.html#ab3f9842e89ec2fa60efa90586ba8f75a">here</a>),</li>
<li>compute a shortest non-contractible topological curve described as a circular sequence of traversed faces alternating with the vertices it passes through
(see <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Surface_mesh_topology/classCGAL_1_1Surface__mesh__topology_1_1Curves__on__surface__topology.html#afc5fc6cdd80c7fb053cb959e9c534cc1">here</a>).</li>
</ul>

<br>
<div style="text-align:center;">
  <a href="../../../../images/edge-width.png"><img src="../../../../images/edge-width.png" style="max-width:45%"/></a>
  <a href="../../../../images/elephant-shortest-cycle.png"><img src="../../../../images/elephant-shortest-cycle.png" style="max-width:45%"/></a><br>
  <small><b>Left:</b> Pink cycle is the edge width of the mesh: the shortest (in number of edges) non contractible cycle. Green cycle is the shortest (in length) non contractible cycle. <b>Right:</b> The three shortest non-contractible cycles computed successively on elephant mesh.</small>
</div>
<br>

<h3>Homotopy Test</h3>

<p>In this package, three tests are available:</p>
<ul>
<li>test if a closed curve is contractible
(see <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Surface_mesh_topology/classCGAL_1_1Surface__mesh__topology_1_1Curves__on__surface__topology.html#a816ad97901765d303ee5fa50fc8a0d0b">here</a>),</li>
<li>test if two closed curves and are freely homotopic
(see <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Surface_mesh_topology/classCGAL_1_1Surface__mesh__topology_1_1Curves__on__surface__topology.html#a85fc4a1f20c84073814251af6912539d">here</a>),</li>
<li>test if two paths are homotopic with fixed endpoints
(see <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Surface_mesh_topology/classCGAL_1_1Surface__mesh__topology_1_1Curves__on__surface__topology.html#a05dba41f3012ec7747aa215e2af2f152">here</a>).</li>
</ul>

<br>
<div style="text-align:center;">
  <a href="../../../../images/free-vs-fixed-endpoints.svg"><img src="../../../../images/free-vs-fixed-endpoints.svg" style="max-width:95%"/></a><br>
  <small>On the upper left surface the green curve is contractible. The red and blue curves share the same (green) endpoint. (Being closed, their two endpoints coincide.) These last two curves are freely homotopic as shown by the suggested continuous transformation of the blue curve.</small>
</div>
<br>

<br>

<h3>Implementation in CGAL</h3>

<p>The package <em>Surface Mesh Topology</em> is already integrated in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 5.1, scheduled for July 2020.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Surface_mesh_topology/index.html">Documentation of the package Surface Mesh Topology</a> <br>

<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
