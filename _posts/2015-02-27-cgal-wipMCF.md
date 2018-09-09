---
layout: post
title: "Triangulated Surface Mesh Skeletonization"
description: "An implementation based on the mean curvature flow method"
category:
tags: ["WIP"]
---
{% include JB/setup %}

<h3>Xiang Gao, Sebastien Loriot, and Andrea Tagliasacchi</h3>
<h4> <a href="http://www.geometryfactory.com" target="_blank">GeometryFactory</a></h4>

<p>This new package provides a (1D) curve skeleton extraction algorithm for 
 a triangulated poylgonal mesh without borders based on the mean curvature flow.
 The particularity of this skeleton is that it has the same topology
 as the input mesh. For each skeleton vertex, one can obtain its location
 and its corresponding vertices of the input mesh. 
 The code is generic and works with any model of the `HalfedgeGraph` concept.
</p>

<p><b>Status:</b> Submitted to the Editorial Board and targeted for CGAL 4.7, Autumn 2015</p>

<h4>Bibliography</h4>
<p>
[1] Andrea Tagliasacchi, Ibraheem Alhashim, Matt Olson, and Hao Zhang. Mean curvature skeletons. Computer Graphics Forum (Proceedings of the Symposium on Geometry Processing), 31(5):1735–1744, 2012.
</p>
