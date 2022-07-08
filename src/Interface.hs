{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts #-}
module Interface where

import           System.Console.ANSI
import           System.IO
import           Control.Monad
import           Control.Monad.Reader
import           Control.Monad.State

-- types
type Frame   = String

newtype UI       = UI
  {
    someFrame :: Frame -- simple header to show current address
  }
  deriving Show

-- init
initUI :: IO UI
initUI = return $ UI
  {
    someFrame =     "########   ##############  ##############  ##############  ##########  #\n" ++
                    "           Current Address:                                             \n" ++
                    "           Current ADA Balance:                                         \n" ++
                    "           Current Hosky Balance:                                       \n" ++
                    "########   ##############  ##############  ##############  ##########  #\n"
  }

setupUI :: IO ()
setupUI = do

  setNoBuffering

  clearScreen
  setTitle "My Cardano Util written in Haskell"
  setSGR [ SetConsoleIntensity NormalIntensity
      , SetColor Foreground Vivid Green
      , SetColor Background Vivid Black
      ]
  setCursorPosition 0 0
  

returnCursorToDefaultLocation :: IO ()
returnCursorToDefaultLocation = do
  setCursorPosition 0 0

setNoBuffering :: IO ()
setNoBuffering = do
    hSetBuffering stdin NoBuffering
    hSetBuffering stdout NoBuffering

moveUnderHeader :: IO ()
moveUnderHeader = do
  setCursorPosition 6 0

renderUpdates :: IO ()
renderUpdates = do
  setCursorPosition 1 30