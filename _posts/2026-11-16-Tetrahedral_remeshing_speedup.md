---
layout: post
title: "New in CGAL 6.3: Tetrahedral Remeshing Is Almost Twice as Fast"
description: ""
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://geometryfactory.com/who-we-are/">Iason Manolas</a>,
<a href="https://geometryfactory.com/who-we-are/">Jane Tournois</a>
</h3>
<h4><a href="https://geometryfactory.com/">GeometryFactory</a></h4>

<br>
<p>In the upcoming CGAL 6.3, the
<a href="https://doc.cgal.org/latest/Tetrahedral_remeshing/index.html">Tetrahedral Remeshing</a> package runs
<strong>about 1.9× faster</strong> than in CGAL 6.2.1 (1.6× to 2.4×, depending on the mesh and settings). It
executes <strong>58% fewer CPU instructions</strong>, and peak memory drops by about 8% on average. No change in
user code is needed: existing calls to <code>tetrahedral_isotropic_remeshing()</code> simply run faster.</p>

<h3>Tetrahedral Remeshing</h3>

<p><code>tetrahedral_isotropic_remeshing()</code> improves the quality of a multi-material tetrahedral mesh by
repeatedly applying four local operations: edge split, edge collapse, edge flip and vertex
smoothing. Each pass removes badly shaped cells and moves the mesh towards a target edge length.
On meshes with millions of cells, this can take many minutes.</p>

<h3>Benchmarks</h3>

<p>We compared CGAL 6.2.1 with the current <code>main</code> branch on nine volume meshes generated with
<code>make_mesh_3</code>, including models from the <a href="https://ten-thousand-models.appspot.com/">Thingi10K</a>
dataset. Each mesh was remeshed with four combinations of target edge length, relative to the
input's average edge length, and number of iterations. These range from coarsening to producing
meshes of more than 3 million cells.</p>

<div style="text-align:center;">
  <a href="../../../../images/benchmark_meshes.png"><img src="../../../../images/speedup_tet_remeshing_benchmark_meshes.png" style="max-width:95%"/></a>
  <br><small>The nine input meshes.</small>
</div>
<br>

<p>The remeshing time drops by <strong>1.87× on average</strong> (geometric mean over the 35 runs). The speedup is
largest when coarsening, 1.98× at 1.5× the average edge length, and still 1.79× when refining to
0.25×.</p>

<div style="text-align:center;">
  <a href="../../../../images/speedup_per_mesh.png"><img src="../../../../images/speedup_tet_remeshing_per_mesh.png" style="max-width:95%"/></a>
  <br><small>Speedup per mesh and setting. Input cell counts are in parentheses.</small>
</div>
<br>
<div style="text-align:center;">
  <a href="../../../../images/runtime_before_after.png"><img src="../../../../images/speedup_tet_remeshing_runtime_before_after.png" style="max-width:85%"/></a>
  <br><small>Remeshing time at the most demanding setting. The longest run, armadillo, goes from 222 s to 121 s.</small>
</div>
<br>

<p><em>How this was measured.</em> CGAL 6.2.1 (<a href="https://github.com/CGAL/cgal/commit/28811b671a1"><code>28811b6</code></a>)
against <code>main</code> (<a href="https://github.com/CGAL/cgal/commit/a3c1b86d2b7"><code>a3c1b86</code></a>, November 2026). Release
build (Apple clang 21, <code>-O3</code>), Apple M2, one thread. Each mesh and setting ran twice per version
in before/after/after/before order, and the charts show the mean. The time covers only the call to
<code>tetrahedral_isotropic_remeshing()</code>. Results will differ on other hardware and compilers, and
bunny00 was not run at 0.25× because of this machine's memory.</p>

<h3>How the instructions were removed</h3>

<p>Nearly all of the reduction comes from seven pull requests, found by profiling with Intel VTune and
<code>perf</code>; other changes since 6.2.1 move the instruction count by less than 1%. Most of the savings
come from not doing work whose answer was already known. Each pull request's description has the
details and its own measurements.</p>

<ul>
<li><a href="https://github.com/CGAL/cgal/pull/9587">#9587</a>: decide most collapse candidates with a direct
dihedral-angle test, before copying their star into a scratch triangulation.</li>
<li><a href="https://github.com/CGAL/cgal/pull/9591">#9591</a>: replace repeated point-location, star and
sizing-field queries with information already at hand.</li>
<li><a href="https://github.com/CGAL/cgal/pull/9590">#9590</a>: collect the stars of a collapsed edge's endpoints
once, instead of up to four times.</li>
<li><a href="https://github.com/CGAL/cgal/pull/9594">#9594</a>: replace hash containers that hold about 20
elements at most with small inline vectors.</li>
<li><a href="https://github.com/CGAL/cgal/pull/9592">#9592</a>: stop evaluating a flip as soon as its angles can
no longer improve on the current ones.</li>
<li><a href="https://github.com/CGAL/cgal/pull/9588">#9588</a>: run a flip's cheap checks before its expensive
star walks.</li>
<li><a href="https://github.com/CGAL/cgal/pull/9676">#9676</a>: judge a flip's facets as they are visited, and
run its most expensive test only on candidates whose angles pass.</li>
</ul>

<h3>Mesh quality</h3>

<p>These optimizations do not change the remesher's decisions. On the four meshes we compared at 1×
edge length and 10 iterations, the output is byte-identical with and without these pull requests.</p>

<p>Other changes merged since 6.2.1 do change the output slightly, so 6.2.1 and 6.3 do not produce
identical files. The quality is equivalent: across the 35 runs, the mean dihedral angle differs by
at most 0.08°, and the number of output cells by at most 2.2% (in 26 of the 35 runs, by less than
0.1%). The minimum dihedral angle stays the same in most runs and moves by up to 2° in either
direction in the others.</p>

<br>
<h3>Status</h3>
<p>All these improvements are already integrated in CGAL's main branch on the
<a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be officially released in
CGAL 6.3.</p>

<p>This work was done by <a href="https://github.com/IasonManolas">Iason Manolas</a> during
<a href="https://summerofcode.withgoogle.com/programs/2026/projects/LDQLCNLF">Google Summer of Code 2026</a>,
mentored by <a href="https://geometryfactory.com/who-we-are/">Sébastien Loriot</a>,
<a href="https://geometryfactory.com/who-we-are/">Mael Rouxel-Labbé</a> and
<a href="https://geometryfactory.com/who-we-are/">Jane Tournois</a>.</p>

<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/latest/Tetrahedral_remeshing/index.html">Documentation about Tetrahedral Remeshing</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>
<br>
<i class="bi bi-file-earmark-text"></i>
<a href="https://github.com/IasonManolas/gsoc2026/blob/main/final_report.md">GSoC 2026 final report</a>
