# Views & Covering Functions

Views are when we use a dependent type to view a data structure differently to how it is represented.
This is useful when pattern matching directly on the structure is cumbersome, or innefficient.

Take, for example, the list data type we can construct a view that presents the elements two at a time.
It is important to note that `Views` must cover all patterns, otherwise the data structure is a predicate.
Which is why we must also taken into account a list with an odd number of elements.


```idris
data View : (input : List a)
                  -> Type
  where
    Empty : View Nil
    One   : (x : a)
              -> View (x::Nil)

    Pair  : (x,y  : a)
         -> (rest : View xs)
                 -> View (x::y::xs)
```


We can then construct a _covering_ function to compute the view.


```idris
view : (input : List a)
             -> View input
view [] = Empty
view (x :: []) = One x
view (x :: (y :: xs)) with (view xs)
  view (x :: (y :: [])) | Empty = Pair x y Empty
  view (x :: (y :: [z])) | (One z) = Pair x y (One z)
  view (x :: (y :: (z :: (w :: xs)))) | (Pair z w rest) = Pair x y (Pair z w rest)
```
