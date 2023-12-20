---
layout: post
title: "New in CGAL: Improvements for 3D Alpha Wrapping"
description: "New features, and speed-up"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Mael Rouxel-Labbé</a></h3>
<h4><a href="http://www.geometryfactory.com" target="_blank">GeometryFactory</a></h4>

<br>
<p>Introduced in CGAL 5.5, the package
<a href="https://doc.cgal.org/latest/Manual/packages.html#PkgAlphaWrap3" text="3D Alpha Wrapping">3D Alpha Wrapping</a>
can be used to generate watertight, manifold surface triangle meshes from any given inputs provided we can compute distances
and intersections to this input. This enables the method to guarantee output properties,
and genericity with respect to the input format (triangles, polylines, ...).
In addition, it is guaranteed to strictly encloses the input, which is a mandatory property
for applications needing conservative distance queries, such as collision avoidance,
or motion planning. Finally, it is fully robust to defects in the input such as self-intersections,
degeneracies, non-manifoldness...</p>

<div style="text-align:center;">
  <a href="../../../../images/christmas_wrap.png"><img src="../../../../images/christmas_wrap.png" style="max-width:95%"/></a><br>
  <br><small>Season's wrappings.</small>
</div>

<br><br>
<p>In the upcoming CGAL release, CGAL 6.0, we introduce a few improvements to the 3D Alpha Wrapping package:
pause & resuming functionalities, fast "LOD" wrapping, generation of volumetric wraps, and some speed-ups.</p>

<br>
<h3>Resume and Restart Functionalities</h3>

<p>The main function of the package 3D Alpha Wrapping takes two input parameters: the size of the
the feature size (<i>alpha</i>), and the isosurface of the distance field on which new vertices are created
(offset, also named <i>delta</i>). The parameter alpha can be understood as the size of a spoon carving around the input.
A larger alpha will thus remove small features and fill large gaps, and a small alpha will preserve those features,
and enter the gaps and cavities (see also Section <a href="https://doc.cgal.org/latest/Alpha_wrap_3/index.html#title5">Choosing Parameters</a>
of the documentation). Although the physicality can be understood, it might be that one
is not exactly sure which value should be used; or, one might simply wish to create a wrap that is
as detailed as possible within a fixed amount of time.</p>

<p>This is now possible thanks to the addition of a visitor to the wrapping algorithm, which gives
more information and control to the user during the wrapping process. An example showing how to use
the visitor to pause and resume a wrapping process has been added:
<a href="https://github.com/CGAL/cgal/blob/master/Alpha_wrap_3/examples/Alpha_wrap_3/pause_and_resume_wrapping.cpp">pause_and_resume_wrapping.cpp</a>.</p>

<p>Another closely related feature being added is the possibility of generating multiple wraps for different
values of alpha for the same input, for example to generate different levels of detail (LODs).
One could of course simply launch the wrapping process from scratch as many times as needed, but
the resuming functionality improves greatly on this: by sorting the value of alpha in decreasing order
(coarse to fine), we can restart from a previous result to generate the next version.
By avoiding a recomputation from scratch, a lot of time is saved. Here is a new example
illustrating the process: <a href="https://github.com/CGAL/cgal/blob/master/Alpha_wrap_3/examples/Alpha_wrap_3/successive_wraps.cpp">successive_wraps.cpp</a>.</p>

<div style="text-align:center;">
  <a href="../../../../images/alpha_wrap.png"><img src="../../../../images/alpha_wrap.png" style="max-width:95%"/></a><br>
  <br><small>Wrapping of an engine piece with complex interior (left) for different values of alpha.</small>
</div>

<br>
<h3>Volumetric Meshing</h3>

<p>The wrapping algorithm constructs an underlying 3D triangulation of which the final wrap is a selected
set of faces. Thus, at the end of the algorithm, we have a tetrahedrization of the volume bounded
by the wrap. This tetrahedral mesh was totally unused so far, but a getter has been added.
By combining this with the recent package <a href="https://doc.cgal.org/latest/Manual/packages.html#PkgTetrahedralRemeshing" Text="Tetrahedral Remeshing">Tetrahedral Remeshing</a>,
one can generate high-quality volumetric tetrahedral meshes of the space enclosed by the wrap.</p>

<div style="text-align:center;">
  <a href="../../../../images/volumetric_wrap.png"><img src="../../../../images/volumetric_wrap.png" style="max-width:95%"/></a><br>
  <br><small>Volumetric mesh of the notoriously painful input <a href="https://ten-thousand-models.appspot.com/detail.html?file_id=996816">996816.stl</a> (Thingi10k). 380k vertices in ~10s.</small>
</div>

<br>
<p>The following example describes this process: <a href="https://github.com/CGAL/cgal/blob/master/Alpha_wrap_3/examples/Alpha_wrap_3/volumetric_wrap.cpp">volumetric_wrap.cpp</a>.</p>

<br>
<h3>Speed-up</h3>

<p>Finally, we always look for improvements while working on code. Various enhancements
to the wrapping algorithms have resulted in a 2x speed-up of the code since CGAL 5.6!</p>

<h3>Status</h3>

<p>All these new improvements are already integrated in CGAL's master branch on the
<a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be officially released
in the upcoming version of CGAL, CGAL 6.0, scheduled for June 2024.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://doc.cgal.org/latest/Manual/packages.html#PkgAlphaWrap3">Documentation of the package Alpha_wrap_3</a>
<br>
<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
