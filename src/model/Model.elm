module Model exposing (..)

import Board exposing (..)
import Keyboard.Extra as KE exposing (Direction(..), Key, arrowsDirection)
import Matrix exposing (Location)
import Snake exposing (..)
import Status exposing (..)
import Time exposing (Time)


type Msg
    = Reset
    | KeyboardMsg KE.Msg
    | Food Location
    | Tick Time


type alias Model =
    { board : Board
    , status : Status
    , snake : Snake
    , pressedKeys : List Key
    , lastMove : Direction
    , foodLocation : Location
    }


init : ( Model, Cmd Msg )
init =
    ( { board = initMatrix
      , status = Moving
      , snake = initSnake
      , pressedKeys = []
      , lastMove = West
      , foodLocation = ( 1, 1 )
      }
    , Cmd.none
    )
