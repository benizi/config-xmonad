module Superscripts
( superScript
, superScriptNum
, desuperScript
, desuperScriptNum
) where

import qualified Data.Map as Map

normalNums = "0123456789"
superScriptNums = "⁰¹²³⁴⁵⁶⁷⁸⁹"
superScripts :: Map.Map Char Char
superScripts = Map.fromList $ zip normalNums superScriptNums

desuperScripts :: Map.Map Char Char
desuperScripts = Map.fromList $ zip superScriptNums normalNums

lookupOrSelf :: Char -> Map.Map Char Char -> Char
lookupOrSelf c m = case Map.lookup c m of
  Just r -> r
  _ -> c

superScriptChar :: Char -> Char
superScriptChar c = lookupOrSelf c superScripts

superScript = map superScriptChar

desuperScriptChar :: Char -> Char
desuperScriptChar c = lookupOrSelf c desuperScripts

desuperScript = map desuperScriptChar

superScriptNum :: Int -> String
superScriptNum = superScript . show

desuperScriptNum :: Int -> String
desuperScriptNum = desuperScript . show
