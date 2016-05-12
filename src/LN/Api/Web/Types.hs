module LN.Api.Web.Types (
  ApiState (..),
  ApiHandler
) where

import           Control.Monad.Trans.Reader
import qualified Data.ByteString.Char8      as BSC
import           Data.Typeable              (Typeable)
import           GHC.Generics               (Generic)
import           Network.Wreq



data ApiState = ApiState {
  wsApiUrl     :: String,
  wsApiKey     :: Maybe BSC.ByteString,
  wsApiOptions :: Options
} deriving (Show, Generic, Typeable)



type ApiHandler = ReaderT ApiState IO
