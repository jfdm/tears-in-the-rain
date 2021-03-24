# Predicates

Predicates are when we use a dependent type to capture a decidable property over some data structure.
Such predicates are useful for reasoning about data structures.

For example, take a list.
We can construct a predicate to capture if the list is empty or not.

```idris
 data NonEmpty : (input : List a)
                     -> Type
  where
    YesNonEmpty : NonEmpty (x::xs)
```

Here the `YesNonEmpty` data constructor of `NonEmpty` presents the only case where a list is non-empty: When there is at least a single element in the list.

It is a good idea to construct the corresponding _decision procedure_ for the predicate.
Decision procedures are functions that construct the predicates using the given input.
These procedures will fail.

When constructing these procedures you can either use `Dec` to provide a formal decision procedure that provides evidence why the predicate failed, or use `Maybe` to skip the provision of evidence.

For example, here are two decision procedures for `NonEmpty`.

The first uses `Maybe`.

```idris
namespace UsingMaybe
  isEmpty :

namespace UsingMaybe

  isEmpty : (input : List a)
                  -> Maybe (NonEmpty input)
  isEmpty [] = Nothing
  isEmpty (x :: xs) = Just YesNonEmpty
```

The second uses `Dec`.

```idris
namespace UsingDec

  emptyList : NonEmpty Nil -> Void
  emptyList YesNonEmpty impossible

  isEmpty : (input : List a)
                  -> Dec (NonEmpty input)
  isEmpty [] = No emptyList
  isEmpty (x :: xs) = Yes YesNonEmpty
```
