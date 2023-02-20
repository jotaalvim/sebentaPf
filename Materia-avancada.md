
# Monads
* [[Monads]]

# fix 
usado no [[Lamda-Calculus]]
    do Control.Monad.Fix
    fix :: (a -> a) -> a
    fix f = let {x = f x} in x
Porque é que tentamos  fugir destes fix e do lambda calculus


# fmap 
Aplica uma função um functor
```Haskell
fmap :: Functor f => (a -> b) -> f a -> f b
```
fmap infixo
```
>>> fmap (+6) (Just 6)
Just 12
>>> (+6) <$> (Just 6)
Just 12
```

# <\*>  Sequential application
```Haskell
(<*>) :: Applicative f => f (a -> b) -> f a -> f b
```
é um fmap mas agora a função está envolvida num funtor
```Haskell
Just (+3) <*> Just 6
Just 9
```
# traverse
Percorre um [[Funtor]] Aplicativo e **mapeia** uma função e no fim recolhe os resultados
```Haskell
traverse :: Applicative f => (a -> f b) -> t a -> f (t b)
```
	Ambos o apontador nulo ( Left, i1) e Nothing são elementos absorventes
```haskell
>>> traverse id [Right 1, Right 2, Right 3, Right 4]
Right [1,2,3,4]
>>> traverse id [Right 1, Right 2, Right 3, Right 4, Left 0]
Left 0
>>> traverse (fmap (+4)) [Right 1, Right 2, Right 3, Right 4]
Right [5,6,7,8]

```

# sequenceA
Percorre um [[Funtor]] Aplicativo e recolhe os resultados
```Haskell
sequenceA :: Applicative f => t (f a) -> f (t a)
```

```Haskell
sequenceA = traverse id
```

# mapM
um traverse mas a assinatura obriga a que só funcione com monads
```Haskell
mapM :: Monad m => (a -> m b) -> t a -> m (t b)
```

# Ta complicado

```haskell
>>> l = traverse (+2)
>>> :t l
l :: (Traversable t, Applicative f, Num (f b)) => t (f b) -> f (t b)
```

```Haskell
>>>(*) <$> [1,2,3] <*> [4,5,6]
[4,5,6,8,10,12,12,15,18]

	-- 1º [(*1),(*2),(*3)]
-- <*> agora é uma fmap mas com as funções dentro do monad lista por isso é preciso o cenos do aplicativo
>>> [(*1),(*2),(*3)] >>= (singleton . ($5))
[5,10,15]

>>> map ($10) $ (*) <$> [1,2,3]
[10,20,30]

```

