import CanvasHs
import CanvasHs.Data

type State = Int

width = 900
height = 600

initState = 0

main = installEventHandler handler initState

handler :: State -> Event -> (State, Output)
handler i StartEvent = (i, actions [Timer 100 "counter"])
handler i (Tick "counter") = (i+1, shape $ drawAll $ i+1)
handler i _ = (i, nothing)
    

drawAll :: State -> Shape
drawAll i =
    Container width height [
            Translate (width `div` 2) (height `div` 2) $ 
                Offset (125, 25) $ 
                    Container 250 50  [
                        Fill colorNone $ 
                            Stroke colorBlack 2 $
                                Rect (1,1) 248 48,
                        Text (125, 5) (show i) defaults{
                            size=40, 
                            alignment=AlignCenter
                        }
                    ]
            ]

colorNone = (0, 0, 0, 0.0)
colorBlack = (0, 0, 0, 1.0)
