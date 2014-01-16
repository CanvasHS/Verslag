import CanvasHs
import CanvasHs.Data

-- Onze state is een getal
type State = Int

-- De initiele state
initState = 0

colors = [pastelRed, pastelYellow, pastelBlue, pastelYellow]

-- registreer jezelf bij Canvas.hs met de functie handler en de initiele state 0
main = installEventHandler handler 0

data ChartData = ChartData [(String, Int)]
    deriving(Show, Eq, Read)

exampleChart = ChartData [
        ("Haskell", 57),
        ("CSS", 27),
        ("Javascript", 14),
        ("Shell", 2)
    ]
    

-- de functie die vanuit Canvas.hs aangeroepen wordt
handler :: State -> Event -> (State, Output)
handler state _ = (state, shape $ Container 900 600 [ 
        Text (20, 20) "Canvas.hs facts" defaults{font="Cantarell", size=50},
        Translate 0 70 $ Container 350 200 [
            Container 200 200 [
                Fill pastelRed $ Arc (100,100) 100 205,
                Fill pastelGreen $ Rotate 205 $ Arc (100,100) 100 95,
                Fill pastelBlue $ Rotate 300 $ Arc (100,100) 100 52,
                Fill pastelYellow $ Rotate 352 $ Arc (100,100) 100 8        
            ],
            Translate 200 0 $ Container 150 200 [
                createLegendaItem pastelRed "Haskell",
                Translate 0 30 $ createLegendaItem pastelGreen "CSS",
                Translate 0 60 $ createLegendaItem pastelBlue "Javascript",
                Translate 0 90 $ createLegendaItem pastelYellow "Shell"
            ]
        ]
    ])


drawGraph :: ChartData -> Shape
drawGraph (ChartData dataPoints) = Container 350 (minimum [200, 30 * (length dataPoints)]) [
        drawChart (ChartData dataPoints),
        Translate 200 0 $ drawLegenda (ChartData dataPoints)
    ]

drawChart :: ChartData -> Shape
drawChart (ChartData dataPoints) = map (\x -> Rotate x $ Arc (100, 100) 100 x)

drawLegenda :: ChartData -> Shape
drawLegenda (ChartData dataPoints) = 
    map (\x -> 
        Translate 0 (x * 30) $ 
            createLegendaItem (colors !! (x `mod` (length colors)) (fst (dataPoints !! x)))
        ) 
    [0..(length dataPoints)]

createLegendaItem :: Color -> String -> Shape
createLegendaItem c s = Container 150 30 [
                            Fill c $ Rect (10, 10) 10 10,
                            Text (30, 10) s defaults{font="Cantarell", size=20}
                        ]
pastelRed = (255, 64, 64, 1.0)
pastelGreen = (64, 255, 64, 1.0)
pastelBlue = (64, 64, 255, 1.0)
pastelYellow = (255, 255, 64 ,1.0)
