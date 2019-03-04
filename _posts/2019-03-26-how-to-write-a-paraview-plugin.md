---
layout: post
title: "CGAL How-tos: Writing a CGAL Plugin for ParaView"
description: ""
category: 
tags: []
---
{% include JB/setup %}

[ParaView](https://www.paraview.org/) is an open-source, multi-platform data analysis and visualization software. Despite a large arrays of built-in tools, developers might wish to add new functionalities to ParaView, such as CGAL's polygon mesh processing algorithms. For that purpose, ParaView uses a plugin system.

The CGAL Project has published a new [Github repository](https://github.com/CGAL/cgal-paraview-plugins), with all necessary code to build a plugin that can call CGAL's [Isotropic Remeshing](https://doc.cgal.org/latest/Polygon_mesh_processing/group__PMP__meshing__grp.html#gad3d03890515ae8103bd32a30a3486412) algorithm directly within ParaView. Furthermore, a step-by-step description of the development of this plugin is available in the [README.md](https://github.com/CGAL/cgal-paraview-plugins/blob/master/README.md) of the repository, which can be used as an already-functional basis from which you can easily develop your own CGAL plugins for ParaView.

<center>
<br>
<figure>
<a href="../../../../images/bull_remeshed.png"><img src="../../../../images/bull_remeshed.png" style="max-width:85%"/></a><br>
<figcaption>Running CGAL's isotropic remeshing on the bull mesh, directly from ParaView.</figcaption>
</figure>
</center>

