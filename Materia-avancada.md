
# Monads
* [[Monads]]

# fix 
usado no [[Lamda-Calculus]]
    do Control.Monad.Fix
    fix :: (a -> a) -> a
    fix f = let {x = f x} in x
Porque é que tentamos  fugir destes fix e do lambda calculus

# traverse
```Haskell
traverse :: Applicative f => (a -> f b) -> t a -> f (t b)
```
