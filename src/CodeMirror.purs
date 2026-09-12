module CodeMirror
  ( Stream
  , Extension
  , Tag
  , HighlightStyle
  , KeyBinding
  , EditorState
  , EditorView
  , ViewUpdate
  , Line
  , Diagnostic
  , eatSpace
  , match
  , next
  , defineStreamLanguage
  , tag
  , defineHighlightStyle
  , syntaxHighlighting
  , lineNumbers
  , highlightActiveLineGutter
  , history
  , drawSelection
  , bracketMatching
  , indentOnInput
  , rectangularSelection
  , highlightActiveLine
  , defaultKeymap
  , historyKeymap
  , indentWithTab
  , keymap
  , lintGutter
  , oneDark
  , theme
  , updateListener
  , docChanged
  , updateState
  , createState
  , createView
  , state
  , documentText
  , documentLength
  , documentLines
  , documentLine
  , replaceRange
  , setDiagnostics
  , destroy
  ) where

import Prelude

import Data.Nullable (Nullable)
import Data.String.Regex (Regex)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2)
import Foreign.Object (Object)
import Web.DOM.Element (Element)

type Line = { from :: Int, to :: Int }

type Diagnostic =
  { from :: Int
  , to :: Int
  , severity :: String
  , message :: String
  }

foreign import data Stream :: Type
foreign import data Extension :: Type
foreign import data Tag :: Type
foreign import data HighlightStyle :: Type
foreign import data KeyBinding :: Type
foreign import data EditorState :: Type
foreign import data EditorView :: Type
foreign import data ViewUpdate :: Type

foreign import eatSpace :: Stream -> Effect Boolean
foreign import match :: Regex -> Stream -> Effect Boolean
foreign import next :: Stream -> Effect Unit
foreign import defineStreamLanguage
  :: forall state
   . { startState :: Effect state, token :: EffectFn2 Stream state (Nullable String) }
  -> Extension

foreign import tag :: String -> Tag
foreign import defineHighlightStyle :: Array { tag :: Tag, color :: String } -> HighlightStyle
foreign import syntaxHighlighting :: HighlightStyle -> Extension
foreign import lineNumbers :: Extension
foreign import highlightActiveLineGutter :: Extension
foreign import history :: Extension
foreign import drawSelection :: Extension
foreign import bracketMatching :: Extension
foreign import indentOnInput :: Extension
foreign import rectangularSelection :: Extension
foreign import highlightActiveLine :: Extension
foreign import defaultKeymap :: Array KeyBinding
foreign import historyKeymap :: Array KeyBinding
foreign import indentWithTab :: KeyBinding
foreign import keymap :: Array KeyBinding -> Extension
foreign import lintGutter :: Extension
foreign import oneDark :: Extension
foreign import theme :: Object (Object String) -> Extension
foreign import updateListener :: EffectFn1 ViewUpdate Unit -> Extension
foreign import docChanged :: ViewUpdate -> Boolean
foreign import updateState :: ViewUpdate -> EditorState
foreign import createState :: { doc :: String, extensions :: Array Extension } -> EditorState
foreign import createView :: { parent :: Element, state :: EditorState } -> Effect EditorView
foreign import state :: EditorView -> Effect EditorState
foreign import documentText :: EditorState -> String
foreign import documentLength :: EditorState -> Int
foreign import documentLines :: EditorState -> Int
foreign import documentLine :: Int -> EditorState -> Line
foreign import replaceRange :: EditorView -> { from :: Int, to :: Int, insert :: String } -> Effect Unit
foreign import setDiagnostics :: EditorView -> Array Diagnostic -> Effect Unit
foreign import destroy :: EditorView -> Effect Unit
