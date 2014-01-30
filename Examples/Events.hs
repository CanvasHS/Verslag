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
handler state StartEvent = (state, shape $ Container 900 600 [Event defaults{eventId="circle", mouseClick=True} $ Circle (200, 200) 50])

{- 
    deze patternmatch wordt uitgevoerd als er een mouseclick met eventid circle is.
-}
handler state (MouseClick (x,y) "circle") = (state, shape $ Container 900 600 [ Event defaults{eventId="circle", mouseClick=True} $ Fill (255,0,0,1.0) $ Circle (200, 200) 50 ])

handler state _ = (state, nothing)
