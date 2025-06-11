---
layout: post
title: "New in CGAL: Polygon Repair"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://3d.bk.tudelft.nl/ken/en/">Ken Arroyo Ohori</a>&#42;,
<a href="https://geometryfactory.com/who-we-are/">Andreas Fabri</a>&deg;, and
<a href="https://geometryfactory.com/who-we-are/">Sébastien Loriot</a>&deg;
</h3>
<h4>&#42;<a href="https://www.tudelft.nl/en/">TU Delft</a>,
&deg;<a href="https://geometryfactory.com/">GeometryFactory</a></h4>

<br>
<p>Polygons are one the standard representations of geometric data, and are extensively used
in various fields, and in particular visualisation and Geographic Information Systems (GIS).
Within CGAL, 2D polygons (possibly with holes) are used in various packages such as
<a href="https://doc.cgal.org/6.1/Manual/packages.html#PkgPartition2">2D Polygon Partitioning</a>,
<a href="https://doc.cgal.org/6.1/Manual/packages.html#PkgStraightSkeleton2"> 2D Straight Skeleton and Polygon Offsetting</a>,
<a href="https://doc.cgal.org/6.1/Manual/packages.html#PkgMinkowskiSum2"> 2D Minkowski Sums</a>,
<a href="https://doc.cgal.org/6.1/Manual/packages.html#PkgPolylineSimplification2">2D Polyline Simplification</a>,
or <a href="https://doc.cgal.org/6.1/Manual/packages.html#PkgVisibility2">2D Visibility Computation</a>.
Whether for CGAL or external algorithms, a <i>valid</i> polygon is generally required as input.
Unfortunately, although the validation of polygons has now been comprehensively studied,
sanitization of error-laden inputs has received much less attention, and no solution existed within CGAL
until recently.</p>

<p>The package <a href="https://doc.cgal.org/6.1/Manual/packages.html#PkgPolygonRepair">2D Polygon Repair</a>
is one the lastest additions to CGAL, and provides automatic repair of invalid polygons with a fast and generic
implementation, with immediate compatibility with other polygon-based CGAL packages.</p>

<br>
<h3>A Triangulation-based Approach to Automatic Polygon Repair</h3>

<p>This new package implements different polygon repair methods. Starting from possibly invalid inputs
in the form of a polygon, polygon with holes or multipolygon with holes, the method computes an arrangement
of the input edges, labels each face according to what it represents (exterior, polygon interior, or hole),
and reconstructs the polygon(s) represented by the arrangement. The method returns valid output stored
in a multipolygon with holes, and calling it as simple as:</p>
```cpp
  ...
  std::ifstream in("data/bridge-edge.wkt");
  CGAL::Polygon_with_holes_2<Kernel> pwh;
  CGAL::IO::read_polygon_WKT(in, pwh);
  Multipolygon_with_holes_2 mp = CGAL::Polygon_repair::repair(pwh);
  ...
```

<br>
<div style="text-align:center;">
  <a href="../../../../images/non_zero_departments.png"><img src="../../../../images/non_zero_departments.png" style="max-width:95%"/></a>
  <br><small>Turning the multipolygon of metropolitan french departments into two polygons using the non-zero rule</small>
</div>

<br>
<h3>Repair Strategies</h3>

<p>For a given invalid polygon inputs, multiple solutions might exist. Consequently, different
labeling heuristics are possible. Four strategies are currently offered by the new package:</p>
<ul>
  <li>the <b>even-odd</b> rule. In this strategy, areas are alternately assigned as polygon interiors
  and exterior/holes each time that an input edge is passed. It does not distinguish between edges
  that are part of outer boundaries from those of inner boundaries;</li>
  <li>the <b>non-zero</b> rule, which keeps areas with a non-zero winding number;</li>
</ul>

<div style="text-align:center;">
  <img
    src="../../../../images/PolygonRepair_WindingNonZeroDifferent.svg"
    alt="triangle with all three sides equal"
    height="200"/>
  <br><small>Input (left), non-zero (middle) even-odd (right).</small>
</div>

<br>
<ul>
  <li>the <b>union</b> rule, which keeps areas that are contained in at least one of the input polygons (with holes);</li>
  <li>the <b>intersection</b> rule, which keeps areas that are contained in all input polygons (with holes).</li>
</ul>

<div style="text-align:center;">
  <img
    src="../../../../images/PolygonRepair_UnionIntersection.svg"
    alt="triangle with all three sides equal"
    height="200"/>
  <br><small>Union (top) and Intersection (bottom). </small>
</div>

<br>
<p>The choice of strategy will generally depend on the input polygon type, and on the downstream application(s).
For example, the "union" and "intersection" rules are useful when given two or more similar valid
polygons with holes or to obtain an approximation from outside and inside.</p>


<br>
<h4>Status</h4>

<p>The initial CGAL 6.0 implementation of the Polygon Repair package providing only the "even-odd" rule
was the result of a successful <a href="https://summerofcode.withgoogle.com/archive/2023/projects/ivuH5hxv">Google Summer of Code</a> project,
contributed by <a href="https://3d.bk.tudelft.nl/ken/en/">Ken Arroyo Ohori</a>
mentored by <a href="https://geometryfactory.com/who-we-are/">Andreas Fabri</a>
and <a href="https://geometryfactory.com/who-we-are/">Sébastien Loriot</a>, and based on the
work of Ledoux, Ohori, and Meijers [1].
Non-zero, union, and intersection strategies were added in CGAL 6.1 by Andreas Fabri.</p>

<p>All these additions are already integrated in CGAL's master branch on the
<a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>. Polygon repair has been
available since CGAL 6.0, and the new even-odd rule as well as the Boolean operations
will be officially released in the upcoming version of CGAL, CGAL 6.1, scheduled for mid 2025.</p>

<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/6.1/Polygon_repair">Documentation of the "2D Polygon Repair" package</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
<br><br>

<h4>Bibliography</h4>

<p>
[1] Ledoux, H., Ohori, K. A., & Meijers, M. (2014). A triangulation-based approach to automatically repair GIS polygons. Computers & Geosciences, 66, 121-131.
</p>