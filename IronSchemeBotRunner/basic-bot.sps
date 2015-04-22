(import 
  (space-invaders)
  (ironscheme)
  (ironscheme random))

; tests
(define me (get-player))
(define op (get-opponent))
#|
(assert me)
(assert op)

(assert (= 25 (map-height)))
(assert (= 19 (map-width)))
(assert (= 33 (round-number)))

(assert (not (game-over?)))

(assert (eq? 'Tie (match-result)))

(displayln (player-number me))
(displayln (player-number op))

;(assert #f)
|#

(list-ref (cdr (available-player-commands)) (random 5))

;'Shoot
