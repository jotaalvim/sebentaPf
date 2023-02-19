 Listas em compreensão

         { x | x ∈ N: x < 10} = {1,2,3,4,5,6,7,8,9}
         lista em compreensao  lista em extensao

      • fazer várias restrições de filtragem
      • fazer qualquer coisa com os elementos filtrados

      [elementos | dominio, restrição1, restrição2]



Prelude> [x | x <- [1..10]]
[1,2,3,4,5,6,7,8,9,10]

Prelude>  [ 2 * x | x <- [1..10]]
[2,4,6,8,10,12,14,16,18,20]


Prelude> [x | x <- [1..10], mod x 2 == 0 ]
[2,4,6,8,10]


Prelude> [x | x <- [1..20], mod x 2 == 0, mod x 5 == 0 , x > 10]
[20]


Prelude> [ [x,pred x..1] | x <- [1..5]]
[[1],[2,1],[3,2,1],[4,3,2,1],[5,4,3,2,1]]


filter c l = ...
map f l = ...

--converte string to int
si :: String -> Int
si = undefined


-- crivo de [2..n]
crivo [] = []
crivo (x:xs) = x : crivo [ n | n <- xs , mod n x /= 0 ]


seqFib = 0:1: [ a+b | (a,b) <- zip seqFib (tail seqFib)]
