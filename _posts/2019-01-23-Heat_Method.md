---
layout: post
title: "New in CGAL: The Heat Method "
description: "Introducing a new package to compute geodesic distances over triangulated surface meshes"
category:
tags: [""]
---
{% include JB/setup %}


<h3><a href="https://www.cs.cmu.edu/~kmcrane/">Keenan Crane</a>&#42;,
<a href="https://www.linkedin.com/in/cvaz2018">Christina Vaz</a>&#42;, and
<a href="https://geometryfactory.com/who-we-are/">Andreas Fabri</a>&deg;</h3>
<h4>&#42;<a href="https://www.csd.cs.cmu.edu/">Carnegie Mellon University</a>,
&deg;<a href="http://www.geometryfactory.com" target="_blank">GeometryFactory</a></h4>

<br>
Measuring distances in space and over manifolds is one of the most fundamental operations
in geometry. More practically, computing accurate geodesic distances over triangulated
surface meshes is also crucial to a number of applications in geometry processing, such as
mesh parameterization, mesh segmentation, or mesh editing. However, although measuring distances
in space is usually easy, measuring intrinsic distances over triangulated surfaces accurately
is much more difficult.

<br>
<h3>Geodesic and Heat</h3>

<p>Imagine touching a surface with a scorching hot needle. Over time heat will
spread out from the contact point to the rest of the domain. This process can be described by a function
called the <i>heat kernel</i>, which measures the heat transferred from a source to a destination
after a given time. A well-known relationship between heat and distance is
<a href="https://onlinelibrary.wiley.com/doi/abs/10.1002/cpa.3160200210" title="Varadhan’s formula">Varadhan’s formula</a>,
which says that the geodesic distance between any pair of points on a Riemannian manifold can be
recovered via a simple pointwise transformation of the heat kernel.</p>

<br>
<h3>The Heat Method</h3>

<p>The heat method is an algorithm that solves the single- or multiple-source shortest path problem
by returning an approximation of the geodesic distance for all vertices of a triangle mesh
to the closest vertex in a given set of source vertices.
It was introduced in a <a href="https://dl.acm.org/citation.cfm?id=3131280" title="The Heat Method for Distance Computation">paper</a>
published at the ACM SIGGRAPH conference in 2017, and co-authored by Keenan Crane,
<a href="https://de.linkedin.com/in/clarisse-weischedel-ph-d-009589b0" title="Clarisse Weischedel">Clarisse Weischedel</a>,
and <a href="http://num.math.uni-goettingen.de/~wardetzky/" title="Max Wardetzky">Max Wardetzky</a>,
and uses the heat kernel to compute geodesics, following an approach illustrated in the figure below.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/Heat_method_theory.png"><img src="../../../../images/Heat_method_theory.png" style="max-width:95%"/></a><br>
  <small> Outline of the heat method. (I) Heat is allowed to diffuse for a
  brief period of time (left). (II) The temperature gradient (center left) is
  normalized and negated to get a unit vector field (center right) pointing
  along geodesics. (III) A function whose gradient follows the vector field recovers the
  final distance is computed (right) <a href="https://dl.acm.org/citation.cfm?id=3131280">[1]</a>.</small>
</div>
<br>

<p>The heat method is highly efficient since the algorithm boils down to two standard sparse linear algebra
problems. It is especially useful in situations where one wishes to perform repeated distance queries
on a fixed domain, since precomputation done for the first query can be re-used.</p>

<br>
<h3>Heat Method : The Package</h3>

<br>
<p>The newest CGAL package, <b>Heat_method_3</b> implements the heat method.
This package is related to the package <a href="https://doc.cgal.org/latest/Manual/packages.html#PkgSurfaceMeshShortestPathSummary">
Triangulated Surface Mesh Shortest Paths</a> as both deal with geodesic distances. The heat method package computes for every vertex
of a mesh an approximate distance to one or several source vertices, whereas
the geodesic shortest path package computes the exact shortest path
between any two points on the surface.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/Heat_method_bunny.png"><img src="../../../../images/Heat_method_bunny.png" style="max-width:85%"/></a><br>
  <small> Geodesic distance on the Stanford Bunny. The heat method allows
  distance to be rapidly updated for new source points or curves.
  <a href="https://dl.acm.org/citation.cfm?id=3131280">[1]</a></small>
</div>
<br>

<br>
<p>The package <i>Heat_method_3</i> is the result of the work of Christina Vaz
during the <a href="https://github.com/CGAL/cgal/wiki/GSoC_2018" title="GSoC 2018">2018 season</a>
of the <a href="https://github.com/CGAL/cgal/wiki/Project-Ideas" title="CGAL GSoC">Google Summer of Code</a>,
mentored by Keenan Crane and Andreas Fabri. It is now available in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>,
and will be officially released in the upcoming version of CGAL, 4.14, scheduled for March 2019.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Heat_method_3/index.html#Chapter_HeatMethod">Documentation of the package Heat_Method_3</a> <br>

<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
