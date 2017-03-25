{-# LANGUAGE BangPatterns         #-}
{-# LANGUAGE DeriveGeneric        #-}
{-# LANGUAGE DeriveAnyClass       #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}
{-# LANGUAGE ScopedTypeVariables  #-}

module LN.Api.String where




import Data.Int                   (Int64)
import Data.Monoid                ((<>))
import Data.Text                  (Text)
import Haskell.Api.Helpers.Shared (ApiEff, ApiError, QueryParam, qp)
import Haskell.Api.Helpers        (SpecificApiOptions, handleError, getAt, putAt, postAt, deleteAt)
import Prelude


import LN.T

getUserSanitizedPack :: forall qp. QueryParam qp => [qp] -> Text -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedPackResponse)
getUserSanitizedPack params user_name = handleError <$> getAt params ["user_sanitized_pack", user_name]

getUserSanitizedPack' :: Text -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedPackResponse)
getUserSanitizedPack' user_name = handleError <$> getAt ([] :: [(Text, Text)]) ["user_sanitized_pack", user_name]

-- footer