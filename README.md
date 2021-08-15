# Simplex circumsphere
`simplex-circumsphere` implements the computation of the n-simplex
circumsphere.

## Usage
**center-radius** vertices => center radius

Compute the center coordinates and radius of the simplex circumsphere
given its vertices.
* `vertices`: Array of vertices coordinates, eg `#(#(1 1) #(5 1) #(1 4))`
* `center`: Array of coordinates, eg `#(3 5/2)`
* `radius`: Radius of the circumsphere, eg `2.5`

Will return nil if the simplex is degenerate.

## Proof
I include a short note on the computation in a nice latex format
[here](doc/simplex-circumsphere.tex), this is adapted from Gautam Manohar [2].

## Dependencies
* `simplex-circumsphere`:
  * [lineq-solve](https://github.com/thomashoullier/lineq-solve)
* `simplex-circumsphere/test`:
  * [rove](https://github.com/fukamachi/rove)

## Test
Launch tests with:
```common-lisp
(asdf:test-system "simplex-circumsphere")
```

I used the nice Geogebra sample by Steve Phelps to generate a test
case for a tetrahedron [1].

## Further discussion
There is an alternate method for the simplex circumsphere highlighted
by Westendorp [3] from a work by Coxeter [5]. It involves the inverse
of the matrix used in the Cayley-Menger determinant (which is the
volume of a simplex [4]).

There is a fair bit of chance that this will be faster, I will
investigate.

## References
1. [Simplex circumsphere in Geogebra by Steve Phelps](https://www.geogebra.org/material/show/id/Ht8FrBuZ)
2. [Gautam Manohar: Inspheres and Circumspheres of Simplices](https://github.com/gcman/gcman.github.io/blob/master/simplex-sphere/index.html)
3. [G. Westendorp: A formula for the N-circumsphere of an N-simplex](https://westy31.home.xs4all.nl/Circumsphere/ncircumsphere.htm)
4. [Wikipedia: Cayley-Menger determinant](https://en.wikipedia.org/wiki/Cayley%E2%80%93Menger_determinant#Finding_the_circumradius_of_a_simplex)
5. H. S. M. Coxeter, “The Circumradius of the General Simplex,” The
   Mathematical Gazette 15(210), 229–231 (1930). [DOI](doi.org/10.2307/3607191)
  

