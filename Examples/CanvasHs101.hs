import CanvasHs
import CanvasHs.Data

-- Onze state is een getal
type State = Int

-- De initiele state
initState = 0

-- registreer jezelf bij Canvas.hs met de functie handler en de initiele state 0
main = installEventHandler handler 0

-- de functie die vanuit Canvas.hs aangeroepen wordt
handler :: State -> Event -> (State, Output)
handler state StartEvent = (state, shape $ Container 900 600 [ Circle (200, 200) 50 ])
