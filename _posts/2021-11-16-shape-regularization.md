---
layout: post
title: "New in CGAL: Shape Regularization package"
description: "A new block in CGAL's reconstruction pipeline"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Dmitry Anisimov</a>&deg;,
    <a href="https://sytov.net/about/">Gennadii Sytov</a>,
    <a href="https://geometryfactory.com/who-we-are/">Simon Giraudot</a>&deg;,
    <a href="https://www-sop.inria.fr/members/Jean-Philippe.Bauchet/">Jean-Philippe Bauchet</a>&#42;,
    <a href="https://www-sop.inria.fr/members/Florent.Lafarge/">Florent Lafarge</a>&#42;</h3>
<h4>&deg;<a href="http://www.geometryfactory.com" target="_blank">GeometryFactory</a>,
    &#42;<a href="https://www.inria.fr">INRIA Sophia Antipolis</a></h4>

<br>
<p>A typical reconstruction pipeline from a point set includes a *shape regularization* step.
During this step, geometric shapes, which have been detected in the previous steps,
such as lines and planes, are being regularized. Usually, three types of regularities
among these shapes are reinforced:</p>

<ul>
<li>*Parallelism* where near parallel shapes are made exactly parallel.</li>
<li>*Orthogonality* where near orthogonal shapes are made exactly orthogonal.</li>
<li>*Collinearity* where near collinear shapes are made exactly collinear.</li>
</ul>

With the next CGAL release, a new package will add one more step towards a robust and component-based reconstruction pipeline.

<br>
<h3> The Shape Regularization Package</h3>

<br>
<div style="text-align:center;">
  <a href="../../../../images/shape_regularisation/80.1.svg"><img src="../../../../images/shape_regularisation/80.1.svg" style="max-width:50%"/></a><br>
</div>

<br>
<p>This new CGAL package enables to regularize a set of segments and open or closed contours in 2D
and a set of planes in 3D such that all input objects are rotated and aligned with respect
to user-specified conditions. In addition, it provides a global regularization framework
that can be adjusted to user needs and for any type of geometric objects.
This package can also be used in conjunction with the <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Shape_detection/index.html">Shape Detection</a> package.</p>

<br>
<h4>Segments</h4>

<p>Given a set of unordered 2D segments, users can reinforce the three types of regularities above
among these segments. This regularization component is based on the global regularization framework.
We call this framework *QP Regularization* because at its core is a *Quadratic Programming (QP)* global
regularization algorithm. Segments are regularized twofold. The first two types of regularities:
parallelism and orthogonality make a part of so-called *angle-based regularization* because angles
are being adjusted while the third regularity: collinearity makes a part of so-called *offset-based
regularization* because the distance between segments is adjusted. The offset regularization
is performed after angle regularization. In the figure below, a set of 2D segments before (red)
and after (green) the angle and offset regularization are depicted.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/shape_regularisation/80.2.svg"><img src="../../../../images/shape_regularisation/80.2.svg" style="max-width:50%"/></a><br>
</div>

<br>
<p>The example below illustrates how to achieve the result from this figure using shape regularization in CGAL.</p>

<pre><code>
#include &lt;CGAL/Simple_cartesian.h&gt;
#include &lt;CGAL/Shape_regularization/regularize_segments.h&gt;

using Kernel = CGAL::Simple_cartesian&lt;double&gt;;
using Point_2 = typename Kernel::Point_2;
using Segment_2 = typename Kernel::Segment_2;

int main()
{
  // Create input segments.
  std::vector&lt;Segment_2&gt; segments =
  {
    Segment_2(Point_2(0.2, 0.0), Point_2(1.2, 0.0)),
    Segment_2(Point_2(1.2, 0.1), Point_2(2.2, 0.1)),
    Segment_2(Point_2(2.2, 0.0), Point_2(2.0, 2.0)),
    Segment_2(Point_2(2.0, 2.0), Point_2(1.0, 2.0)),
    Segment_2(Point_2(1.0, 1.9), Point_2(0.0, 1.9)),
    Segment_2(Point_2(0.0, 2.0), Point_2(0.2, 0.0))
  };

  // Regularize all segments: both angles and offsets.
  CGAL::Shape_regularization::Segments::regularize_segments(segments);

  return EXIT_SUCCESS
}
</code></pre>

<br>
<h4>Contours</h4>

<p>Given a set of ordered 2D points connected by segments, which form a *contour*, closed or open,
users can reinforce the three regularities above among consecutive edges of this contour.
When regularizing contours, we assume that each contour has at least one principal direction
that is a reference direction towards which the contour edges are rotated.
Given a set of such directions either estimated or user-specified, each edge is made either parallel
or orthogonal to these direction(s). In the figure below, a closed contour
before (red) and after (green)regularization is depicted. The principal direction
is the direction of the longest edge.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/shape_regularisation/80.13.svg"><img src="../../../../images/shape_regularisation/80.13.svg" style="max-width:50%"/></a><br>
</div>

<br>
<p>The example below shows the most straightforward entry point to the CGAL algorithm,
where we regularize a simple closed contour.</p>

<pre><code>
#include &lt;CGAL/Simple_cartesian.h&gt;
#include &lt;CGAL/Shape_regularization/regularize_contours.h&gt;

using Kernel = CGAL::Simple_cartesian&lt;double&gt;;
using Point_2 = typename Kernel::Point_2;

int main()
{
  // Create input contour.
  const std::vector&lt;Point_2&gt; contour =
  {
    Point_2(0.00,  0.00),
    Point_2(0.50, -0.05),
    Point_2(1.00,  0.00),
    Point_2(1.05,  0.50),
    Point_2(1.00,  1.00),
    Point_2(0.00,  1.00)
  };

  // Regularize this contour.
  std::vector&lt;Point_2&gt; regularized;
  CGAL::Shape_regularization::Contours::regularize_closed_contour(contour, std::back_inserter(regularized));

  return EXIT_SUCCESS;
}
</code></pre>

<br>
<h4>Planes</h4>

<p>An old hierarchical plane regularization algorithm that has been a part of CGAL
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Shape_detection/index.html">Shape Detection</a>
component is refactored and its API is improved. The algorithm enables to regularize a set of planes in 3D.</p>

<br>
<h4>Performance</h4>

<p>The performance of the shape regularization for segments based on the global QP regularization framework
mostly depends on the used QP solver. The plot below shows how the computation time depends on the number
of input segments when using the external <a href="https://cgal.geometryfactory.com/CGAL/doc/master/Manual/thirdparty.html#thirdpartyOSQP">OSQP</a>) solver.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/shape_regularisation/80.10.svg"><img src="../../../../images/shape_regularisation/80.10.svg" style="max-width:50%"/></a><br>
</div>

<br>
<p>Time in seconds to regularize angles (solid red) and offsets (solid green) without regrouping input segments
and with the groups of 10 segments for angles (dashed red) and offsets (dashed green).</p>

<p>The contour regularization algorithms, both closed and open, have, in practice, a near-linear time behavior
with respect to the number of contour vertices as it can be seen from the plot below.</p>

<br>
<div style="text-align:center;">
  <a href="../../../../images/shape_regularisation/80.16.svg"><img src="../../../../images/shape_regularisation/80.16.svg" style="max-width:50%"/></a><br>
</div>

<br>
<p>Time in seconds to regularize closed (red) and open (green) contours.</p>

<br>
<h3>Status</h3>

<p>The package Shape_Regularization is already integrated in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 5.4, scheduled for December 2021.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://doc.cgal.org/5.3/Manual/packages.html#PkgShapeRegularization">Documentation of the package Shape_Regularization</a>
<br>
<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
