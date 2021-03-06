module Board exposing (..)

import Cell exposing (..)
import Matrix exposing (Matrix,Location,set)
import Snake exposing (..)


type alias Board =
    Matrix Cell


initMatrix : Board
initMatrix =
    Matrix.matrix 10 10 (\_ -> Absent)
        |> Matrix.set ( 1, 1 ) PresentFood
        >> addSnakeAndFood initSnake ( 1, 1 )


addSnakeAndFood : Snake -> Location -> Board -> Board
addSnakeAndFood snake food board =
    let
        aux location _ =
            if List.member location snake then
                PresentSnake
            else
                Absent
    in
    board
        |> Matrix.mapWithLocation aux
        >> Matrix.set food PresentFood
