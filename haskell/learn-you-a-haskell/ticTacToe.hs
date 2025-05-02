blankPieceName = "BLANK"
blankPieceSprite = ' '
blankPieceData = 0

xPieceName="X"
xPieceSprite='x'
xPieceData=1

oPieceName="O"
oPieceSprite='o'
oPieceData=2

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

-- Given a piece data, render its sprite.
renderPieceDataToSprite :: Int -> Char
renderPieceDataToSprite pieceData 
    | pieceData == blankPieceData   = blankPieceSprite
    | pieceData == xPieceData       = xPieceSprite
    | pieceData == oPieceData       = oPieceSprite
    | otherwise                     = '?'

-- Generate a board that's empty.
generateEmptyBoard :: [Int]
generateEmptyBoard = replicate 9 blankPieceData

-- Generate a board that looks like this:
--   x  
--   xoo
--   o x
generateSampleBoard :: [Int]
generateSampleBoard = [
    xPieceData, blankPieceData, blankPieceData,
    xPieceData, oPieceData,     oPieceData,
    oPieceData, blankPieceData, xPieceData]

-- TODO Mutate a board with a move
makeMoveOnBoard :: [Int] -> Int -> Int -> Int -> [Int]
makeMoveOnBoard board x y pieceData = (
    [0,0]) -- TODO

renderBoard :: [Int] -> String
renderBoard board = 
    let sprites = map renderPieceDataToSprite board

    -- format into rows with separators
        row1 = slice 0 2 sprites
        row2 = slice 3 5 sprites
        row3 = slice 6 8 sprites
        separator = "---"
    in row1 ++ "\n" ++ separator ++ "\n" ++ row2 ++ "\n" ++ separator ++ "\n" ++ row3 ++ "\n"

-- Get a single piece on a board given x,y coordinates.
getPieceOnBoard board x y = (board !! (calculateIndexOnBoard x y))

-- transform x,y to index our board
calculateIndexOnBoard x y = x + (3*y)