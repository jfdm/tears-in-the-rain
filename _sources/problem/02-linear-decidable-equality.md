# Linear-Time Decidable Equality.

This problem is about decidable equality.

```idris
import Decidable.Equality

%default total
```

Given the following data type:

```idris
data Fruit = Apple | Orange | Pear | Peach
```

creating a decidable equality instance `DecEq` requires pairwise comparison of each structure.
We can already reduce the number of contraditions using `negEqSym`

## Example

For example:

````{admonition} Click the button to reveal the contradictions!
:class: dropdown

```idris
appleNoOrange : Apple === Orange -> Void
appleNoOrange _ impossible

appleNoPear : Apple === Pear -> Void
appleNoPear _ impossible

appleNoPeach : Apple === Peach -> Void
appleNoPeach _ impossible

orangeNoPear : Orange === Pear -> Void
orangeNoPear _ impossible

orangeNoPeach : Orange === Peach -> Void
orangeNoPeach _ impossible

pearNoPeach : Pear === Peach -> Void
pearNoPeach _ impossible
```
````

```idris
DecEq Fruit where

  decEq Apple Apple  = Yes Refl
  decEq Apple Orange = No appleNoOrange
  decEq Apple Pear   = No appleNoPear
  decEq Apple Peach  = No appleNoPeach

  decEq Orange Apple  = No (negEqSym appleNoOrange)
  decEq Orange Orange = Yes Refl
  decEq Orange Pear   = No orangeNoPear
  decEq Orange Peach  = No orangeNoPeach

  decEq Pear Apple  = No (negEqSym appleNoPear)
  decEq Pear Orange = No (negEqSym orangeNoPear)
  decEq Pear Pear   = Yes Refl
  decEq Pear Peach  = No pearNoPeach

  decEq Peach Apple  = No (negEqSym appleNoPeach)
  decEq Peach Orange = No (negEqSym orangeNoPeach)
  decEq Peach Pear   = No (negEqSym pearNoPeach)
  decEq Peach Peach  = Yes Refl
```


This approach, however, still requires pairwise comparison of each structure.

## Solutions

Here we link to solutions that can solve this problem.
