(import 
  (space-invaders)
  (ironscheme)
  (ironscheme random))

(list-ref (cdr (available-player-commands)) (random 5))
