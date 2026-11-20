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
  <br><small>Result of hexmeshing method for the model "bunny00.off", using 15 as initial grid size and 2 as number of two-refinement levels. (Right) View of the interior of the mesh.</small>
</div>
<br>
<p>In the upcoming CGAL release, CGAL 6.3, we introduce the method <a href="https://cgal.geometryfactory.com/CGAL/doc/main/Linear_cell_complex/index.html#Linear_cell_complexHexmeshing">Hexahedral Two-refinement</a>. It generates a pure 3D hexahedral mesh from a surface triangle mesh using the two-refinement algorithm described in the paper "A template-based approach for parallel hexahedral two-refinement" of Steven J. Owen, Ryan M. Shih and Corey D. Ernst.</p>

<p>The method starts by generating a regular grid of voxels around and within the object. Voxels which intersect by the input surface are refined using four simple refinement templates. Moreover, transitions are created between refined and non-refined voxels as to guarantee that the final output is a pure hexahedral mesh. Exterior mesh elements may be trimmed (i.e., removed from the mesh) or kept. A final, optional step is the smoothing of the 3D mesh to project boundary vertices on the input surface.</p>

<p>Two parameters govern the behavior of the method: the size of the initial grid of voxels, and the number of two-refinement levels applied. Due to the cubic nature of the grid scaling, users should not use overly large numbers for these two parameters, as this would rapidly create a huge number of hexahedra, and possibly a crash of the method due to a filling up of the computer memory.</p>

<p>The code was developed over two successive google summer of code projects: firstly by Théo Bénard in 2024, then by Soichiro Yamazaki in 2025. For now, the method is sequential. A parallel version of the method is under development.</p>

<br>
<h3>Status</h3>

<p>The method "Hexahedral Two-refinement" is already integrated in CGAL's "main" branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 6.3, scheduled for December 2026.</p>

<i class="bi bi-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/main/Linear_cell_complex/index.html#Linear_cell_complexHexmeshing">Documentation of the Hexahedral Two-refinement</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/main">CGAL "main" branch on GitHub</a>
