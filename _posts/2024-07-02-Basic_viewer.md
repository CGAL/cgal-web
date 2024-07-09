---
layout: post
title: "New in CGAL: Basic Viewer"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://perso.liris.cnrs.fr/guillaume.damiand/">Guillaume Damiand</a>&deg;,
Mostafa Ashraf.
</h3>
<h4>&deg;<a href="https://liris.cnrs.fr/">LIRIS / CNRS</a></h4>
<br>

<p>Visualizing the data structures used by CGAL's algorithms can help understand and analyze results. Since CGAL 4.13, the global function <code>CGAL::draw(...)</code> can be used to visualize (almost) all CGAL data structures including point sets, polygon meshes, cell complexes, and straight skeletons. Calling <code>CGAL::draw(...)</code> opens an interactive window displaying the data structure, enabling users to navigate the scene, show or hide specific elements, and even view the interior of the model, if applicable.</p>

<br>
<p>The example below illustrates how we can use the function <code>CGAL::draw()</code> to visualize an OFF file loaded into a <code>CGAL::Surface_mesh</code> data structure.</p>

<pre><code>
#include &lt;CGAL/Simple_cartesian.h&gt;
#include &lt;CGAL/Surface_mesh.h&gt;
#include &lt;CGAL/draw_surface_mesh.h&gt;

int main(int argc, char* argv[])
{
  using Point=CGAL::Simple_cartesian&lt;double&gt;::Point_3;
  CGAL::Surface_mesh&lt;Point&gt; sm;
  CGAL::IO::read_polygon_mesh(argv[1], sm);
  CGAL::draw(sm);
  return EXIT_SUCCESS;
}
</code></pre>

<p>Unfortunately, this function had several limitations. Firstly, it was not easy to customize the drawing, for example changing the color or hiding of some elements. Secondly, it was not possible to draw different data structures simultaneously. Finally, it was not easy to add interaction with the drawing, or to use it in an higher level widget. All these limitations are solved with a new package: the CGAL Basic Viewer.

<h3>Basic viewer</h3>

<p>The goal of this package is:</p>

<ul>
<li>to enable easy customization of the drawing by using the <code>Graphics_scene_options</code> class;</li>
<li>to enable different data structures within the same window, by using the <code>Graphics_scene</code> class;</li>
<li>use the basic viewer in a full Qt application, thanks to the widget <code>CGAL::Qt::Basic_viewer</code>;</li>
<li>add some (limited) interaction with users, through different key pressed, by using the class <code>CGAL::Qt::QApplication_and_basic_viewer</code> which regroups a </code>Qt::QApplication and a <code>CGAL::Qt::Basic_viewer</code>.</li>
</ul>


<div style="text-align:center;">
  <a href="../../../../images/draw_surface_mesh_vcolor.png"><img src="../../../../images/draw_surface_mesh_vcolor.png" style="max-width:95%"/></a>
  <br><small>Example of tuned drawing of a 3D surface mesh where some vertex colors are changed.</small>
</div>

<br>
<div style="text-align:center;">
  <a href="../../../../images/draw_surface_height.png"><img src="../../../../images/draw_surface_height.png" style="max-width:95%"/></a>
  <br><small>Example of mesh drawing with a color for each face computed depending on its height.</small>
</div>

<br>
<div style="text-align:center;">
  <a href="../../../../images/draw_mesh_and_points.png"><img src="../../../../images/draw_mesh_and_points.png" style="max-width:95%"/></a>
  <br><small>Example of drawing of a point cloud and a polyhedron in a same viewer.</small>
</div>

<br>
<div style="text-align:center;">
  <a href="../../../../images/draw_several_windows.png"><img src="../../../../images/draw_several_windows.png" style="max-width:95%"/></a>
  <br><small>Example of drawing of two Basic_viewer side by side.</small>
</div>

<br>
<div style="text-align:center;">
  <a href="../../../../images/draw_surface_mesh_small_faces.png"><img src="../../../../images/draw_surface_mesh_small_faces.png" style="max-width:95%"/></a>
  <br><small>Two examples of drawing of a mesh with small faces in red. Left: With the initial threshold. Right: After having increased the threshold.</small>
</div>

<h4>Status</h4>
<p>The basic viewer package is already integrated in CGAL's master branch on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be officially released in the upcoming version of CGAL, CGAL 6.0. The code was started by Mostafa Ashraf during his 2022 GSoC project, then Guillaume Damiand, who mentored the project, reworked large parts of the package. As future work, a version based on GLFW is planned, avoiding the dependency to Qt</p>

<i class="bi bi-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Basic_viewer/index.html">Documentation of the Basic viewer package</a><br>

<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
