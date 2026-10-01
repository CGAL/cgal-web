---
layout: post
title: "New in CGAL: 3D Mesh Volume Smoothing"
description: "Efficient, robust, and boundary-aware smoothing"
category:
tags: [""]
---
{% include JB/setup %}

<h3><a href="https://fprotais.github.io/">François Protais</a></h3>
<h4><a href="https://www.inria.fr">INRIA Sophia Antipolis</a></h4>

<br>

<div style="text-align:center;">
  <a href="../../../../images/mesh_smoothing_3_implicit.png">
    <img src="../../../../images/mesh_smoothing_3_implicit.png"
         style="max-width:95%"/>
  </a>
  <br>
  <small>
    Smoothing and feature recovery on a mesh generated from an implicit domain.
    The mesh connectivity is preserved while its vertices are optimized and fitted
    to the target geometry. It is possible to zoom by clicking on the image
    for more details.
  </small>
</div>

<br>

Poorly shaped elements can affect the robustness and accuracy of numerical
computations. Therefore, mesh generation approaches have to balance
element quality with the fidelity to the prescribed geometry. Additional
optimization steps are frequently required to produce adequate meshes,
as mentioned in the <a href="https://doc.cgal.org/latest/Mesh_3/index.html#Mesh_3OptimizationPhase">3D Mesh Generation package</a>.


In many applications, however, changing the connectivity is not desirable.
Cells can carry material labels or simulation data, and their indices and
adjacency may already be used by downstream software. In these situations,
remeshing operations such as edge splits, collapses, or flips are inappropriate.


The new <a href="https://doc.cgal.org/latest/Manual/packages.html#PkgMeshSmoothing3">3D Mesh Volume Smoothing package</a> package addresses this problem by **optimizing the
positions of mesh vertices without modifying the mesh connectivity**. It combines
volumetric mesh quality improvement with geometric fitting of surfaces, curves,
and constrained points.

<h3>Volume Mesh Optimization</h3>

At the core of Mesh Smoothing package is a nonlinear optimization of the mesh vertex
positions. Element quality is measured using a conformal distortion energy,
designed to favor well-shaped tetrahedra and improve their dihedral angles.

The energy includes a barrier against element inversion. Consequently, when the
input mesh is valid, the optimization maintains positively oriented
tetrahedra. The same framework can also be used to attempt to untangle meshes
that initially contain inverted elements.

Importantly, only vertex coordinates are modified. Cell connectivity, cell
indices, patch identifiers, material labels, and other data attached to the
mesh remain unchanged.

<h3>Fitting the Mesh to Geometry</h3>

Improving element quality alone is generally insufficient for boundary
vertices: moving them freely would deform the represented shape.

The 3D Mesh Smoothing therefore couples mesh quality optimization with geometric
fitting. Rather than requiring one particular representation of the target
geometry, the package uses a simple abstraction that associates constrained
vertices with local tangent spaces.

Depending on the geometric dimension, these constraints can represent:

<ul>
  <li>a tangent plane for a surface;</li>
  <li>a tangent direction for a curve;</li>
  <li>a fixed position for a corner or constrained point.</li>
</ul>

These geometric constraints are integrated directly into the optimization.
They are generally treated as soft constraints, allowing the optimizer to
balance element quality and geometric accuracy, while selected vertices,
edges, or facets can also be explicitly locked.

Changes in the target tangent spaces can additionally be used to recover and
preserve sharp features.

<h3>Several Geometric Representations</h3>

The optimization algorithm is deliberately separated from the representation
of the target geometry.

The package provides ready-to-use projectors for fitting a mesh to another
CGAL `C3t3`, to polyhedral mesh domains, to polyhedral domains containing
feature curves, and to implicit surfaces represented through signed-distance
functions.

Applications can also implement their own tangent-space constructions. This
makes it possible to optimize meshes whose boundaries combine several types of
geometry.

<br>

<div style="text-align:center;">
  <a href="../../../../images/mesh_smoothing_3_hybrid.png">
    <img src="../../../../images/mesh_smoothing_3_hybrid.png"
         style="max-width:95%"/>
  </a>
  <br>
  <small>
    Smoothing of a hybrid domain combining polyhedral and implicit boundary
    representations. The same optimization process can fit the different
    geometric components and their interface. Close-ups highlight that
    a given topology may not be adequate to fit a geometric target.
  </small>
</div>

<br>

This separation between mesh optimization and geometric representation is also
useful when the input mesh and the geometry used for fitting are different. A
coarse or distorted volume mesh can, for example, be optimized against a more
accurate reference geometry without changing its connectivity.

<h3>A Compact Interface</h3>

The main entry point is `CGAL::boundary_aware_mesh_smoothing()`. This function
can be used with the various projectors or with a user-defined geometric
oracle. As an example, we can smooth a mesh with its own boundary as a target:

<pre><code>
auto c3t3 = make_mesh_3();
CGAL::boundary_aware_mesh_smoothing(
    c3t3,
    CGAL::Mesh_smoothing_3::C3t3_mesh_projector(c3t3));
</code></pre>

Named parameters control, among other options, constrained vertices, edges and
facets, stopping criteria, verbosity, and the execution policy. The
implementation supports sequential execution as well as parallel execution
when the corresponding backend is available.

<h3>Smoothing or Remeshing?</h3>

This package is intended for applications where the existing mesh
connectivity must be retained.

When changes to the number of vertices, mesh resolution, or connectivity are
required, <a href="https://doc.cgal.org/latest/Manual/packages.html#PkgTetrahedralRemeshing">CGAL's tetrahedral remeshing</a>  functionality remains the appropriate
tool. The two operations therefore address complementary use cases:
remeshing modifies the discretization, whereas smoothing optimizes the
embedding of a fixed discretization.

One consequence of keeping connectivity fixed is that properties depending on
the current vertex positions and connectivity simultaneously are not
preserved. In particular, smoothing a Delaunay or regular triangulation may
invalidate its Delaunay property.

<h3>Status</h3>

<p>The package Mesh_smoothing_3 is already integrated in CGAL's "main" branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 6.3, scheduled for December 2026.</p>

<i class="bi bi-book"></i>
<a href="https://doc.cgal.org/6.3/Manual/packages.html#PkgMeshSmoothing3">Documentation of the package Mesh_smoothing_3</a>
<br>
<i class="bi bi-arrow-down-circle"></i>
<a href="https://github.com/CGAL/cgal/tree/main">CGAL "main" branch on GitHub</a>