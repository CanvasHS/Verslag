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
handler state _ = (state, shape $ 
    Container width height [
        Fill pastelRed $ 
            Offset (25, 25) $ 
                Rect ((width `div` 4), (height `div` 4)) 50 50,
        Scale 2.0 2.0 $
            Fill pastelGreen $ 
                Offset (25, 25) $ 
                    Rect ((3 * width `div` 4), (height `div` 4)) 50 50,
        Rotate 45 $
            Fill pastelBlue $ 
                Offset (25, 25) $ 
                    Rect ((width `div` 4), (3 * height `div` 4)) 50 50,
        Rotate 45 $ 
            Scale 2.0 2.0 $
                Fill pastelYellow $ 
                    Offset (25, 25) $ 
                        Rect ((3 * width `div` 4), (3 * height `div` 4)) 50 50
    ])

pastelRed = (255, 64, 64, 1.0)
pastelGreen = (64, 255, 64, 1.0)
pastelBlue = (64, 64, 255, 1.0)
pastelYellow = (255, 255, 64 ,1.0)
