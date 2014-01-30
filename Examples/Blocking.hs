import CanvasHs
import CanvasHs.Data

type State = Int

width = 900
height = 600

initState = 0

main = installEventHandler handler 0

handler :: State -> Event -> (State, Output)
-- Op het startevent gaan we een bestand lezen
handler state StartEvent = 
    (state, Block (LoadFileString "sometextfile.txt"))

handler state (FileLoadedString path string) = (state, shape $ 
    Container 900 600 [
        Text (100, 100) ("file: " ++ path ++ "\n" ++ string) defaults
    ])

handler state _ = (state, nothing)
