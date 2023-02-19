
# Monads
* [[Monads]]

# fix 
usado no [[Lamda-Calculus]]
    do Control.Monad.Fix
    fix :: (a -> a) -> a
    fix f = let {x = f x} in x
Porque é que tentamos  fugir destes fix e do lambda calculus

# traverse
Percorre um [[Funtor]] Aplicativo e mapeia uma função e no fim recolhe os resultados
```Haskell
traverse :: Applicative f => (a -> f b) -> t a -> f (t b)
```
	Ambos o apontador nulo ( Left, i1) e Nothing são elementos absorventes
```haskell
Prelude> traverse id [Right 1, Right 2, Right 3, Right 4]
Right [1,2,3,4]
Prelude> traverse id [Right 1, Right 2, Right 3, Right 4, Left 0]
Left 0
```	
