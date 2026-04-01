---
layout: post
title: "CGAL Donor Portrait: AMI Labs"
description: "Make the driver intelligent, not the car"
category: "news"
tags: []
---
{% include JB/setup %}

<p>French artificial intelligence startup <a href="https://amilabs.xyz/">AMI Labs</a>
(standing for Advanced Machine Intelligence) raised $1 billion three weeks ago to develop
AI systems designed to understand the physical world "in the way animals and humans do",
unlike the language-based models behind chatbots such as ChatGPT.
</p>

<p>AMI Labs expects to produce "fairly universal intelligent systems" within five years,
a timeline that investors described as "ambitious but compatible with current funding conditions."</p>

<h3>Chauffeur</h3>

<p>In order to become profitable within twelve months, the first product milestone,
code-named <em>Chauffeur</em>, is a humanoid private driver designed to make autonomous driving
a reality much faster than most car manufacturers have ever envisioned.</p>

<p>Early profitability was a condition imposed by investors, among them Toyota Ventures,
which is pushing for solutions compatible with the existing global fleet of cars,
estimated at more than 1.4 billion vehicles.</p>

<blockquote>
<p>"Make the driver intelligent, not the car."</p>
<p><small>Yann LeCun</small></p>
</blockquote>

<p><em>Chauffeur</em> sits in the driver's seat, fastens the seatbelt,
adjusts the mirrors, and performs the usual pre-driving ritual familiar to human drivers.</p>

<p>It manipulates the pedals for the accelerator, brakes, and clutch with its feet,
inserts the key, changes gears, turns the steering wheel,
and operates dashboard controls with its hands.</p>

<p>The system can refuel at gas stations, pay for parking,
and in the event of a flat tire, replace the wheel using tools stored in the trunk.</p>

<p><em>Chauffeur</em> is powered directly by the vehicle,
drawing electricity from the cigarette lighter.</p>

<p>To reduce costs, the most basic version will consist of a lightweight skeletal frame
with minimal cosmetic elements.
An additional benefit is that it can fold itself away like a Transformer or a Brompton bicycle
and be stored in the trunk when five seats are required.</p>

<p>This version targets the European and US mass markets,
as well as the Global South, where many decommissioned cars enjoy a long second life.</p>

<p>A premium model will target the luxury segment,
with the explicit requirement that the <em>Chauffeur</em> be indistinguishable from a human driver.
Engineers describe the design goal as "Rheya in Tarkovsky's <em>Solaris</em>"</p>

<blockquote class="twitter-tweet"><p lang="fr" dir="ltr">Yann Le Cun ouvre une nouvelle page de l’intelligence artificielle. C’est la France des chercheurs, des bâtisseurs et des audacieux. Bravo ! <a href="https://t.co/hVxMMFoabJ">https://t.co/hVxMMFoabJ</a></p>&mdash; Emmanuel Macron (@EmmanuelMacron) <a href="https://twitter.com/EmmanuelMacron/status/2031288199503388717?ref_src=twsrc%5Etfw">March 10, 2026</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 


<h3>A Flying Start</h3>

<p>Because AMI Labs focuses primarily on software, the company has partnered with the Polish humanoid robotics
manufacurer <a href="https://www.clonerobotics.com/">Clone Robotics</a>, the first company
producing a biomorphic hand which is in form and function fully equivalent to the human hand.</p>

<p>On the software side, AMI Labs is developing <em>world models</em> that learn abstract representations of real-world sensor data,
ignoring unpredictable details, and making predictions in <em>representation space</em>.</p>

<p>Representation space means geometric entities, means triangle meshes, means CGAL, as well as other Open Source geometry libraries
such as <a href="https://github.com/BrunoLevy/geogram">Geogram</a> and <a href="https://dev.opencascade.org/">OpenCascade</a>,
but also simulation frameworks such as <a href="https://www.sofa-framework.org/">Sofa</a> and <a href="https://www.salome-platform.org/">Salome</a>,
and, last but not least, <a href="https://rocq-prover.org/">Rocq</a>, a trustworthy, industrial-strength interactive theorem prover
and dependently typed programming language for mechanised reasoning.
</p>

<p>For that reason, AMI Labs will actively apply a trickle-down funding approach and, over the next three years, 
donate 0.1% of the $1 billion raised to these Open Source projects.</p>

<blockquote>
<p>"Using Open Source software developed mainly in France, we stand on the shoulders of giants."</p>
<p><small>Alexandre Lebrun, CEO of AMI Labs</small></p>
</blockquote>

<p>What exactly will be used from CGAL is not yet fully clear, but point-cloud processing,
shape detection, and surface reconstruction are among the leading candidates for the
interior <em>perception system</em>. </p>

<p>Even when pre-trained on typical car interiors,
<em>Chauffeur</em> must remain capable of identifying objects
placed on the dashboard and deciding whether to ignore them,
move them aside, or comment on them politely.</p>

