module QuestionAnswerForm exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { question : String
  , answer1 : String
  , answer2 : String
  , answer3 : String
  , answer4 : String
  }


init : Model
init =
  Model "" "" "" "" ""



-- UPDATE


type Msg
  = Question String
  | Answer1 String
  | Answer2 String
  | Answer3 String
  | Answer4 String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Question question ->
      { model | question = question }

    Answer1 answer1 ->
      { model | answer1 = answer1 }
    
    Answer2 answer2 ->
        { model | answer2 = answer2 }
    
    Answer3 answer3 ->
        { model | answer3 = answer3 }

    Answer4 answer4 ->
        { model | answer4 = answer4 }


-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ div [] [ text "Create Question"]
    , viewInput "text" "Question" model.question Question
    , viewInput "text" "Answer 1" model.answer1 Answer1
    , viewInput "text" "Answer 2" model.answer2 Answer2
    , viewInput "text" "Answer 3" model.answer3 Answer3
    , viewInput "text" "Answer 4" model.answer4 Answer4
    , button [] [ text "Submit" ]
    ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []