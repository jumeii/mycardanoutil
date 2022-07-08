{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
module BFCalls where

import           Blockfrost.Client
import           System.Console.ANSI
import           System.IO
import           Data.Text as T
import           ConfigManager
import           Interface (renderUpdates,moveUnderHeader)
import           Data.Either


type ADABalance = Lovelaces
type HoskyBalance = Integer

data AccountBalance = AccountBalance { balance :: ADABalance, hoskyBalance :: HoskyBalance } deriving Show

getAccountAdaAndHosky :: IO ()-- returns Either (accountInfo json object                             ADA balance works hosky asset is failing on address format?
getAccountAdaAndHosky = do
  someStakeAddress <- initCurrent
  someHoskyPolicyId <- getHoskyPolicyId
  someHoskyAssetNameHex <- getHoskyAssetNameHex
  prj <- projectFromFile "config/blockfrosttoken" 
  res <- runBlockfrost prj $ getAccount (mkAddress (T.pack (someAddress someStakeAddress)))
  res2 <- runBlockfrost prj $ getAddressUtxosAsset (mkAddress (T.pack (someAddress someStakeAddress))) (mkAssetId (T.pack someHoskyPolicyId <> T.pack someHoskyAssetNameHex)) --not working? NOT OK
  renderUpdates
  putStr (someAddress someStakeAddress)
  moveUnderHeader
  print res
  print res2

sumHosky :: [Int] -> Int
sumHosky x = Prelude.foldr (+) 0 x














