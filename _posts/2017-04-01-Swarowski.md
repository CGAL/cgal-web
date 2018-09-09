---
layout: post
title: "CGAL User Portrait: Swarowski and the Ivanka Diagram"
description: "CGAL - simply wear it!"
category: "news"
tags: []
---
{% include JB/setup %}

<p><a href="http://www.swarowski.com/">Swarowski</a> designs
and manufactures the world's most beautiful jewelry for the
most beautiful people.</p>

<p>When Kmart, Sears, and Nordstrom decided to evict Ivanka Trump branded 
jewelry from their U.S. online stores, Swarowski seized the opportunity
and asked Ms. Trump to design exclusively for Swarowski for the next four 
years.</p>

<p>The upcoming Ivanka Trump jewelry collection uses quite disruptive
technology, namely (a) 3D printing which is a challenge as the material
used is gold powder, (b) <a href="https://www.rhino3d.com/gallery/4">Rhino</a> as a
design tool, and (c) Rhino plugins based on CGAL multiplicatively weighted
Voronoi diagrams (also called Apollonius graph), as well as
the CGAL Hilbert sort algorithm for producing space filling
curves.</p>.

<div style="text-align:center;">
  <img src="../../../../images/april2017.jpg"><br>
  <small>Left: Voronoi ring  Right: Space filling ear ring</small>
</div>

<h3>A Unified Naming Scheme</h3>
<p>Laure N.T. Rhino, the chief software architect at McNeel  who gave 
this most wonderful design software its name, contacted the CGAL Editorial 
Board, asking if it wouldn't be possible to rename the  <i>multiplicatively 
weighted Voronoi diagrams</i> to <i>Ivanka Diagram</i>, so that it 
has the same name as the plugin they produced exclusively for Swarowski. </p>

<blockquote>
<p>"With the CGAL Multiplicatively weighted Voronoi diagram  as a key routine 
of the <em>Ivanka</em> plugin, astonishing pieces can be designed at a fraction 
of the cost and time of traditional design methods.  It enables our designers 
to push the boundaries of how jewelery can look like in the 21st century"</p>

 <p><small>Sebastien L.O. Riot, Chief Technologist at Swarowki</small></p>
</blockquote>

<p>According to Swarowski and McNeel, we would do them a favor if the
collection, the tool, as well as the CGAL component had the same name.
This is somehow understandable, if we think about the naming mess 
of Visual Studio 2013, sitting in the directory Microsoft Visual Studio 12.0,
and having the version number MSC_VER = 18 in case you want to #if it
in your C++ code.</p>

<h3>Your Opinon is Important for Us </h3>

<p>Before making this move, we would like to gather feedback from 
the CGAL User Community, as first of all we are a software development
project run by developers for developers.</p>

<p>As the C++ programming language does only allow templated typedefs starting
with C++11, we are
reluctant to break backward compatibility, by just renaming the class 
<i>CGAL::Multiplicatively_weighted_voronoi_diagram_3</i> to <i>Ivanka_diagram</i>,
but there are maybe even non-technical issues we should take into account,
so maybe you can help us to add items to our pro and con list which
will be the base for the next Editorial Board meeting co-located with
<a href="http://geometry.cs.ucl.ac.uk/SGP2017/">SGP 2017</a> in London.</p>

<h2> Comments</h2>
<div class="container">
  <div class="row">
    <div class="col-sm-8">
      <div class="post-comments">
        <div class="comment-wrapper product-detail-info">
          It is just a query replace all, and a serious developer has
          derived her own class anyways, so renaming is not really an issue...
        </div><br>
        <div class="comment-wrapper product-detail-info">
          Don't do this!! You know who profits from viral marketing!
        </div><br>
        <div class="comment-wrapper product-detail-info">
          Open Source projects such as CGAL must stay politically neutral.
        </div><br>
        <div class="comment-wrapper product-detail-info">
          It must be an obsession of some people to tag things with their name:
          Obamacare, Ivanka diagram,...
          I am shocked to hear where the name of the Rhino software comes from!
        </div><br>
        <div class="comment-wrapper product-detail-info">
          As software developers tend towards the Democrats, this is not a clever move.
        </div><br>
        <div class="comment-wrapper product-detail-info">
          I appreciate, because you help to make America great again!!
        </div><br>
        <div class="comment-wrapper product-detail-info">
          You risk not to pass immigration when you fly into LAX for the next SIGGRAPH...
        </div><br>
        <div class="comment-wrapper product-detail-info">
          In 1000 years, educated people will still remember Apollonius.
        </div><br>
        <div class="comment-wrapper product-detail-info">
          If you call this stuff jewelry, then better call the class <i>Merkel_diagram</i>.
        </div><br>
      </div>
    </div>
  </div>
</div>
