import CanvasHs
import CanvasHs.Data

-- Onze state is een getal
type State = Int

width = 900
height = 600

middleX = (width `div` 2)
middleY = (height `div` 2)

-- De initiele state
initState = 0

-- registreer jezelf bij Canvas.hs met de functie handler en de initiele state 0
main = installEventHandler handler 0

-- de functie die vanuit Canvas.hs aangeroepen wordt
handler :: State -> Event -> (State, Output)
handler state StartEvent = (state, shape $ Container 900 600 [
    Text (middleX, middleY - 25) "Hello World!" defaults{alignment=AlignCenter, size=50},
    Rotate 90 $ Text (middleX, middleY + 16) "Bold" defaults{bold=True, size = 32},
    Text (middleX, middleY + 25) "Times New Roman" defaults{font="Times New Roman", size=42},
    Rotate (-90) $ Text (middleX + 140, middleY + 25) "Underline" defaults{underline=True, size=37},
    Text (middleX- 100, middleY - (25 + 44)) "Italic" defaults{size=44, italic=True}
 ])
