{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts #-}
module Main where

import           Blockfrost.Client
import           System.Console.ANSI
import           System.IO
import           Control.Monad
import           Control.Monad.Reader
import           Control.Monad.State
import           Interface
import           ConfigManager
import           BFCalls


main :: IO ()
main = do
    -- do stuff
    setupUI
    myUI <- initUI
    putStrLn (someFrame myUI)
    getAccountAdaAndHosky

