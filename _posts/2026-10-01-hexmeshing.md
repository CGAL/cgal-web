---
layout: post
title: "New in CGAL: Hexahedral mesh generation"
description: "Generation of an hexahedral mesh from a surface"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://perso.liris.cnrs.fr/guillaume.damiand/">Guillaume Damiand</a></h3>
<h4><a href="https://cnrs.fr/">CNRS</a> / <a href="https://liris.cnrs.fr/">LIRIS</a></h4>
<br>

<div style="text-align:center;">
  <a href="../../../../images/hexmesh-bunny.png"><img src="../../../../images/hexmesh-bunny.png" style="max-width:40%"/></a>
  <a href="../../../../images/hexmesh-bunny-interior.png"><img src="../../../../images/hexmesh-bunny-interior.png" style="max-width:59%"/></a><br>
  <br><small>Result of hexmeshing method for bunny00.off, using 15 as initial grid size and 2 as number of two-refinement levels. (Right) View of the interior of the mesh.</small>
</div>
<br>
<p>The upcoming CGAL release 6.3, will introduce the method <a href="https://cgal.geometryfactory.com/CGAL/doc/main/Linear_cell_complex/index.html#Linear_cell_complexHexmeshing">Hexahedral Two-refinement</a>. It generates a pure 3D hexahedral mesh from a surface triangle mesh using the two-refinement algorithm described in the paper "A template-based approach for parallel hexahedral two-refinement" of Steven J. Owen, Ryan M. Shih and Corey D. Ernst.</p>

<p>The method starts to create a regular grid of voxels, then refines voxels intersected by the input surface using four simple refinement templates. Moreover, transitions are created between refined and non-refined voxels to guarantee that the final output is a pure hexadral mesh. The exterior mesh elements can be trimmed (removed from the mesh) or kept. A last optional step is the smoothing of the 3D mesh to project boundary vertices on the input surface.</p>

<p>The two parameters of the methods are the size of the initial grid of voxels, and the number of two-refinement levels applied. Be careful to not use too big numbers for these two parameters, since this can implies a huge number of hexahedra created, and possibly a crash of the method due to a filling up of the computer memory.</p>

<p>The code was developed during two successive google summer of code projects: firstly by Théo Bénard in 2024, then by Soichiro Yamazaki in 2025. For now, the method is sequential. The parallel version of the method is under developement.</p>

<br>
<h3>Status</h3>

<p>The method "Hexahedral Two-refinement" is already integrated in CGAL's "main" branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 6.3, scheduled for XXX 2026.</p>

<i class="bi bi-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/main/Linear_cell_complex/index.html#Linear_cell_complexHexmeshing">Documentation of the Hexahedral Two-refinement</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/main">CGAL "main" branch on GitHub</a>
