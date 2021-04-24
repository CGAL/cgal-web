---
layout: post title: "New in CGAL: Orthtree"
description: "New Orthtree data structure for ..."
category:
tags: [""]
---
{% include JB/setup %}

<h3>
    <a href="https://github.com/JacksonCampolattaro">Jackson Campolattaro</a>,
    <a href="{{TODO}}">Simon Giraudot</a>,
    <a href="{{TODO}}">Cédric Portaneri</a>,
    <a href="{{TODO}}">Tong Zhao</a>,
    <a href="{{TODO}}">Pierre Alliez</a>
</h3>
<h4>
    <a href="https://geometryfactory.com/">GeometryFactory</a>,
    <a href="https://www.telecom-paris.fr/en/home">Telecom Paris</a>
    {{TODO Any other organizations}}
</h4>
<br>

Tree data structures for partitioning space are a common tool for improving the performance
of spatial searches and related tasks. 
CGAL provides a variety of tree structures suited to different purposes,
including the kD tree and the AABB tree, but until now it hasn't had an Octree or Quadtree package. 
The Orthtree is a generalization of Octrees and Quadtrees, and it can also be applied to higher ambient dimensions.

<h3>Orthtree Package</h3>

CGAL's Orthtree provides a collection of functions for building and refining trees,
performing traversals of their nodes, and performing searches using different queries.

Much of its functionality is provided by predicate functions which can be replaced
in order to change the behavior of the tree.
For example, the user can define their own patterns for traversal of the tree,
or criteria for refining its structure.

<img src=https://cgal.geometryfactory.com/CGAL/doc/master/Orthtree/orthtree.png>

An Orthtree is especially useful in scenarios where the kDTree isn't an option, 
for example when bounding boxes can't have high aspect-ratios.
The RANSAC algorithm used by
CGAL's [Shape Detection package](https://doc.cgal.org/latest/Shape_detection/index.html)
previously depended on its own Octree implementation for this reason,
and it now uses this package.

<p float="left">
    <img src="https://cgal.geometryfactory.com/CGAL/doc/master/Orthtree/construction_benchmark.png" size="400">
    <img src="https://cgal.geometryfactory.com/CGAL/doc/master/Orthtree/nearest_neighbor_benchmark.png" size="400">
</p>

{{TODO performance plots might not be relevant}}


Building a new Octree and refining it with the default criteria can be done with only a few lines of code:
```c++
#include <iostream>
#include <CGAL/Simple_cartesian.h>
#include <CGAL/Octree.h>

// Type Declarations
typedef CGAL::Simple_cartesian<double> Kernel;
typedef Kernel::Point_3 Point;
typedef std::list<Point> Point_vector;
typedef CGAL::Octree<Kernel, Point_vector> Octree;
typedef CGAL::Orthtrees::Preorder_traversal Preorder_traversal;

int main() {
  
    // Here, our point set is a vector
    Point_vector points;
    
    // Add a few points to the vector
    points.emplace_back(1, 1, 1);
    points.emplace_back(2, 1, -11);
    points.emplace_back(2, 1, 1);
    points.emplace_back(1, -2, 1);
    points.emplace_back(1, 1, 1);
    points.emplace_back(-1, 1, 1);
    
    // Create an octree from the points
    Octree octree(points);
    
    // Build the octree
    octree.refine(10, 20);
    
    // Print out the tree
    std::cout << octree;
    
    return EXIT_SUCCESS;
}
```

Once the tree is constructed, it's simple to perform queries:
```c++
...
// Find the 10 nearest points to the search point
auto search_point = new Point(1, -1, 0);
Point_vector neighbors;
octree.nearest_k_neighbors(search_point, 3, std::back_inserter(neighbors));
...
```

The tree can also be traversed manually, or with the help of a traversal function:
```c++
...
// Manual traversal to reach the fifth child of the first child of the root
std::cout << octree.root()[0][4];

// Automatic traversal using a pre-defined order
for (Octree::Node node : octree.traverse<Preorder_traversal>()) {
    std::cout << node << std::endl;
}
...
```

<h3>CGAL</h3>
<p>The package <em>Orthtree</em> is already integrated in CGAL's master branch
on the <a href="https://github.com/CGAL/cgal/">CGAL GitHub repository</a>, and will be
officially released in the upcoming version of CGAL, CGAL 5.3, scheduled for {{TODO Which month?}} 2021.</p>

<i class="glyphicon glyphicon-book"></i>
<a href="https://cgal.geometryfactory.com/CGAL/doc/master/Orthtree/index.html">Documentation of the package
Octree</a> <br>

<i class="glyphicon glyphicon-download"></i>
<a href="https://github.com/CGAL/cgal/tree/master">CGAL master branch on GitHub</a>