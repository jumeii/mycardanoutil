{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts #-}

module ConfigManager where

import           System.Console.ANSI
import           System.IO
import           Data.Text as T
import           Interface
import Data.Char (digitToInt)

type CustomAddress = String

newtype CurrentAddress       = CurrentAddress
  {
    someAddress :: CustomAddress 
  }
  deriving Show

-- init
initCurrent :: IO CurrentAddress
initCurrent = do
  myAddress <- chooseAddress
  return $ CurrentAddress
    {
      someAddress =     myAddress
    }

getAddresses :: IO String
getAddresses = do
  readFile "config/walletaddresses.config" --contains stake addr

getHoskyPolicyId :: IO String
getHoskyPolicyId = do
  readFile "config/hoskypolicyid.config" -- contains hosky token policyid

getHoskyAssetNameHex :: IO String
getHoskyAssetNameHex = do
  readFile "config/hoskyassetnamehex.config" -- contains hex of hosky assetname

chooseAddress :: IO String
chooseAddress = do
  moveUnderHeader

  someStakeAddress <- getAddresses
  let someListAddresses = Prelude.lines someStakeAddress
  putStrLn "Available Addresses"
  mapM_  putStrLn someListAddresses
  putStrLn "Pick address index"
  finalChoice <- getChar

  let finalChoiceOutput = someListAddresses !! digitToInt finalChoice
  return finalChoiceOutput













