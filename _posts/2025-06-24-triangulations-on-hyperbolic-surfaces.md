---
layout: post
title: "New in CGAL: 2D Triangulations on Hyperbolic Surfaces"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<h3>
<a href="https://members.loria.fr/vincent.despre/">Vincent Despré</a>,
<a href="https://loic-dubois.github.io/">Loïc Dubois</a>,
<a href="https://members.loria.fr/MPouget/">Marc Pouget</a>, and
<a href="https://members.loria.fr/Monique.Teillaud/">Monique Teillaud</a>
</h3>
<h4>
<a href="https://www.inria.fr/fr/centre-inria-universite-lorraine ">INRIA Nancy - Grand Est</a>,
<a href="https://www.loria.fr/en/">LORIA</a>,
<a href="https://www.univ-gustave-eiffel.fr/en/">University Gustave Eiffel</a>
</h4>


<br> Triangulations, and in particular Delaunay triangulations, are among
the most important structures in computational geometry and have been part of
CGAL since its very first release. CGAL offers (Delaunay) triangulations in
Euclidean spaces in any dimensions. It also offers packages to compute Delaunay
triangulations of the flat torus in 2 and 3 dimensions, which can be seen as
periodic triangulations of the Euclidean space in 2 and 3 dimensions,
respectively. For non-Euclidean spaces, CGAL offers triangulations for the
sphere and two packages for hyperbolic geometry: one for the hyperbolic plane
and the other for the Bolza surface.

<p> The new package introduces a data structure and algorithms for
triangulations of closed orientable hyperbolic surfaces.  It is thus a
generalisation of the specific case of the Bolza surface, which is the most
symmetric hyperbolic surface of genus 2. The triangulation is represented by an
enriched CGAL::Combinatorial_map with complex number attributes on edges. Such a
triangulation can be constructed from a surface given by a convex fundamental
domain. A method is offered that randomly generates such domains for surfaces of
genus two. On the other hand, the package works for any genus surface that may
be provided by the user either as a fundamental domain or as an already computed
triangulation. Functionalities are offered such as the Delaunay flip algorithm
and the construction of a portion of the lift of the triangulation in the
Poincaré disk model of the hyperbolic plane.
</p>

<p>The package is already available in the master branch
of the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>,
and will be officially released in the upcoming version of CGAL
6.1.</p>

<div style="text-align:center;">
  <img src="../../../../images/triangulation-on-hyperbolic-surface.svg" width="50%"><br>
  <small>Delaunay triangulations of hyperbolic surfaces
  of genus 2 lifted in the Poincaré disk.</small>
</div>

<br>
<p> <b>Coming soon:</b> We are working on improving the generator of hyperbolic
surfaces to handle any genus. We will also add an epsilon-net algorithm to
uniformly sample a surface and thus ease the computation of distances. </p>


<i class="bi bi-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Triangulation_on_hyperbolic_surface_2/index.html">Documentation of the package 2D Triangulations on Hyperbolic Surfaces</a> <br>

<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>
