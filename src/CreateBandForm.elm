module CreateBandForm exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  }


init : Model
init =
  Model "" "" ""



-- UPDATE


type Msg
  = Name String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ div [] [ text "Create Band"]
    , viewInput "text" "Name" model.name Name
    , button [] [ text "Submit" ]
    ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []