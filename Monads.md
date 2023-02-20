É um[[Funtor]] mas com 2 propriedades acrescentadas:
* unidade
* multiplicidade

## Bind
```Haskell
(>>=) :: Monad m => m a -> (a -> m b) -> m b
```
* retira da caixa
* aplica uma função
* junta tudo e coloca numa outra caixa

Outra defenição
```Haskell
(>>=) :: (a -> b) -> (b -> a -> c) -> a -> c
f >>= k = \ r -> k (f r) r
```

neste caso estamos a usar uma função ((->) r) como um monad, se substituirmos ((->) r) pelo m obtemos a defenição a cima

útil quando tempos replicação de um argumento: 
```Haskell
half l = splitAt (div (length l) 2) l

half = splitAt =<< flip div 2 . length
```
ou 
```Haskell
different l = nub l == l

different = nub >>= (==)
```

### Usos
No monad das listas a unidade, join é o concat
```Haskell
join = (>>= id)
concat = join
```
