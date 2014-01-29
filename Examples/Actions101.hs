import CanvasHs
import CanvasHs.Data

type State = Int

width = 900
height = 600

initState = 0

main = installEventHandler handler 0

handler :: State -> Event -> (State, Output)
handler state (MouseClick (x,y) "download") = 
    (state, Out (Just drawAll, [downloadAction]))

handler state _ = (state, shape $ drawAll)
    

drawAll :: Shape
drawAll =
    Container width height [
            Event defaults{eventId="download", mouseClick=True} $
                Translate (width `div` 2) (height `div` 2) $ 
                    Offset (125, 25) $ 
                        Container 250 50  [
                            Fill colorNone $ 
                                Stroke colorBlack 2 $
                                    Rect (1,1) 248 48,
                            Text (125, 5) "Download" defaults{
                                size=40, 
                                alignment=AlignCenter
                            }
                        ]
            ]

downloadAction :: Action
downloadAction = Download "hello_world.txt" "Hello World!"

colorNone = (0, 0, 0, 0.0)
colorBlack = (0, 0, 0, 1.0)
