import CanvasHs
import CanvasHs.Data

-- Onze state is een getal
type State = Int

width = 900
height = 600

initState = 0

-- registreer jezelf bij Canvas.hs met de functie handler en de initiele state 0
main = installEventHandler handler initState

-- de functie die vanuit Canvas.hs aangeroepen wordt
handler :: State -> Event -> (State, Output)
handler state StartEvent = (state, shape $ 
    Container width height [
        Translate (width `div` 4) (height `div` 4) $ 
            Fill pastelRed $ mickey,
        Translate ((3 * width) `div` 4) (height `div` 4) $
            Rotate 90 $            
                Fill pastelGreen $ mickey,
        Translate ((3 * width) `div` 4) ((3 * height) `div` 4) $
            Rotate 180 $ 
                Fill pastelYellow $ mickey,
        Translate (width `div` 4) ((3 * height) `div` 4) $ 
            Rotate 270 $
                Fill pastelBlue $ mickey
    ])

handler state _ = (state, nothing)

-- een kleine hulpfunctie die een mickey mouse vorm teruggeeft
mickey :: Shape
mickey = 
    Offset (80, 65) $ Container 160 130 [
        Circle (30, 30) 30,
        Circle (80, 80) 50,
        Circle (130, 30) 30
    ]

pastelRed = (255, 64, 64, 1.0)
pastelGreen = (64, 255, 64, 1.0)
pastelBlue = (64, 64, 255, 1.0)
pastelYellow = (255, 255, 64 ,1.0)
