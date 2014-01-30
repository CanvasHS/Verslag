import CanvasHs
import CanvasHs.Data

-- Onze state is een getal
type State = Int

-- De initiele state
initState = 0

-- registreer jezelf bij Canvas.hs met de functie handler en de initiele state 0
main = installEventHandler handler initState

-- de functie die vanuit Canvas.hs aangeroepen wordt
handler :: State -> Event -> (State, Output)
handler state StartEvent = (state, shape $ Container 900 600 [ Event defaults{scroll=True, eventId="hoi"} $ Circle (200, 200) 50 ])

handler state (Scroll "hoi" x y) = (state, shape $ Container 900 600 [ Scale 2.0 2.0 $ Circle (200, 200) 50])
handler state _ = (state, nothing)
