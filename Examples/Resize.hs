import CanvasHs
import CanvasHs.Data

-- Onze state is een getal
data State = State Int Int

-- De initiele state
initState = State 900 600

-- registreer jezelf bij Canvas.hs met de functie handler en de initiele state 0
main = installEventHandler handler initState

-- de functie die vanuit Canvas.hs aangeroepen wordt
handler :: State -> Event -> (State, Output)
handler state (KeyPress "F11" _) = (state, 
    Out (Just $ drawAll state, [DisplayType FullScreen]))

handler state (KeyPress "f" _) = (state, 
    Out (Just $ drawAll state, [DisplayType FullWindow]))

handler state (KeyPress "w" _) = (state, 
    Out (Just $ drawAll state, [DisplayType $ FixedSize 900 600]))

handler state (WindowResize w h) = (newState, shape $ drawAll newState)
    where
        newState = State w h

handler state _ = (state, shape $ drawAll state)

drawAll :: State -> Shape
drawAll (State width height) = 
    Container width height [
        Fill pastelGreen $ Circle (width `div` 2, height `div` 2) size
    ]
    where
        wSize = width `div` 10
        hSize = height `div` 10
        size = minimum [wSize, hSize]

pastelGreen = (64, 255, 64, 1.0)
