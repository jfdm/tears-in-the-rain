# Collecting Dependent Types

Given the following dependently typed data structure:

```idris
data Vect : (size : Nat)
         -> (type : Type)
                 -> Type
  where
    Empty : Vect Z type
    Cons  : (head : type)
         -> (tail : Vect    size  type)
                 -> Vect (S size) type
```

The definition of `Vect` is parameterised by the size of the vector and indexed by its type.
This makes collecting `Vect` data structures harder.
If we use `List` or `Vect` we introduce an invariant that all the lists must have the same type.

For example:

```idris

vs : List (Vect 1 Nat)
vs = [(Cons 1 Empty), (Cons 2 Empty)]

ms : Vect 2 (Vect 1 Nat)
ms = Cons (Cons 1 Empty)
          (Cons (Cons 2 Empty)
                Empty)
```


A question arises how to collect these types in a collection?

## Solutions

Here we link to solutions that can solve this problem.
