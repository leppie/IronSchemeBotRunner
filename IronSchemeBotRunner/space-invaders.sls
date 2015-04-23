(library (space-invaders)
  (export 
    init
    get-player
    get-opponent
    
    game-over?
    round-limit
    round-number
    match-result
    
    map-height
    map-width
    entity-at
        
    available-player-commands
    player-kills
    player-lives
    player-number
    player-missile-limit
    player-alien-wave-size
    player-has-missile-controller?
    player-has-alien-factory?
    player-respawn-timer
    player-last-command
    player-can-build-missile-controller?
    player-can-build-alien-factory?
    player-ship
    player-missiles
    player-missile-count

    entity-type
    entity-x
    entity-y
    entity-player-number
    entity-alive?
    entity-height
    entity-width
    alien-command
    alien-delta-x
    alien-delta-y)
  (import 
    (ironscheme)
    (ironscheme clr))

(clr-reference SpaceInvaders)

(clr-using SpaceInvaders.Core)
(clr-using SpaceInvaders.Entities)
(clr-using IronScheme.Runtime)

(define $match #f)
(define $map #f)
(define $player #f)
(define $opponent #f)

(define (init match map player opponent)
  (set! $match match)
  (set! $map map)
  (set! $player player)
  (set! $opponent opponent)
  
  ; do init shit  
)

(define (get-match) $match)
(define (get-map) $map)
(define (get-player) $player)
(define (get-opponent) $opponent)

; match procedures
(define (game-over?)
  (clr-call Match GameIsOver $match))

(define (round-limit)
  (clr-prop-get Match RoundLimit $match))

(define (round-number)
  (clr-prop-get Match RoundNumber $match))

(define (match-result)
  (clr-call Match GetResult $match))

; map procedures
(define (map-height)
  (clr-prop-get Map Height $map))

(define (map-width)
  (clr-prop-get Map Width $map))

(define (entity-at x y)
  (let ((e (clr-call Map GetEntity $map x y)))
    (and (not (null? e))
         e)))

; player procedures
(define (available-player-commands)
  '(Nothing
    MoveLeft
    MoveRight
    Shoot
    BuildAlienFactory
    BuildMissileController
    BuildShield))

(define (player-kills p)
  (clr-prop-get Player Kills p))

(define (player-lives p)
  (clr-prop-get Player Lives p))

(define (player-number p)
  (clr-prop-get Player PlayerNumber p))

(define (player-missile-limit p)
  (clr-prop-get Player MissileLimit p))

(define (player-alien-wave-size p)
  (clr-prop-get Player AlienWaveSize p))

(define (player-has-missile-controller? p)
  (not (null? (clr-prop-get Player MissileController p))))

(define (player-has-alien-factory? p)
  (not (null? (clr-prop-get Player AlienFactory p))))

(define (player-respawn-timer p)
  (clr-prop-get Player RespawnTimer p))

(define (player-last-command p)
  (let ((shp (player-ship p)))
    (if shp
        (clr-prop-get Ship LastCommand shp)
        'Nothing)))

(define (player-can-build-missile-controller? p)
  (and (not (player-has-missile-controller? p))
       (positive? (player-lives p))))

(define (player-can-build-alien-factory? p)
  (and (not (player-has-alien-factory? p))
       (positive? (player-lives p))))

(define (player-ship p)
  (let ((shp (clr-prop-get Player Ship p)))
    (and (not (null? shp))
         shp)))

(define (player-missiles p)
  (clr-static-call Cons FromList
    (clr-prop-get Player Missiles p)))

(define (player-missile-count p)
  (length (player-missiles p)))

; entity procedures
(define (entity-type e)
  (clr-prop-get Entity Type e))

(define (entity-x e)
  (clr-prop-get Entity X e))

(define (entity-y e)
  (clr-prop-get Entity Y e))

(define (entity-player-number e)
  (clr-prop-get Entity PlayerNumber e))

(define (entity-alive? e)
  (clr-prop-get Entity Alive e))

(define (entity-height e)
  (clr-prop-get Entity Height e))

(define (entity-width e)
  (clr-prop-get Entity Width e))

(define (alien-command a)
  (clr-prop-get Alien Command a))

(define (alien-delta-x a)
  (clr-prop-get Alien DeltaX a))

(define (alien-delta-y a)
  (clr-prop-get Alien DeltaY a)))
