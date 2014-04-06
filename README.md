## canvas-helper

A helper function for rendering data with canvas.

Concept:

* Auto sizing and resizing
* Scaling class included
* No external dependencies

##### Examples

Fill the canvas.

```js
$canvas(function(g, s) {
  g.fillStyle = "rgba(0,0,0,0.2)";
  g.fillRect(0, 0, s.width, s.height);
}, document.getElementById("el"));
```

The g argument is the 2d context of the canvas, and s is a scale object.

A line, which is scaled to the canvas:

```js
var data = [1,2,3,4,5,3,2,1];
$canvas(function(g, s) {
  s.auto(data); // fit to the data
  g.strokeStyle = "rgb(113,197,239)";
  g.moveTo(s.x(0), s.y(data[0]));
  for(var i = 0;i < data.length;i++) {
    g.lineTo(s.x(i), s.y(data[i]));
  }
  g.stroke();
}, document.getElementById("el"));
```

Scatter plot, scaled to canvas:

```js
var scatter = [
  [15, 20],
  [13, 30],
  [100, 7]
];

$canvas(function(g, s) {
  s.auto(scatter); // it fits 2d data as well
  g.fillStyle = "rgba(108,211,165,0.3)";
  for(var i = 0;i < scatter.length;i++) {
    var x = s.x(scatter[i][0]);
    var y = s.y(scatter[i][1]);
    g.fillRect(x - 2, y - 2, 4, 4);
  }
}, document.getElementById("el"));
```


##### Scale object

Fit a dataset to a pixel grid.  Inspired by d3, but not as robust.  Methods:

* x(v) - get canvas x position
* y(v) - get canvas y position, (flipped)
* w(v) - get pixel width for a given magnitude
* h(v) - get pixel height for a given range
* rx(v) - inverse of x(v)
* ry(v) - inverse of y(v)
* range(min, max) - set the range
* domain(min, max) - set the domain
* auto(data) - auto set domain and range

##### More

License: MIT
Contributing: Send a PR