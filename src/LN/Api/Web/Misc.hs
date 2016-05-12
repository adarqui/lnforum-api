module LN.Api.Web.Misc (
  defaultApiState,
  requireAuth,
  apiOptions,
  runDefault,
  runWith,
  runWithAuthId
) where



import           Control.Monad.Trans.Reader (ReaderT (..), asks, runReaderT)
import qualified Data.ByteString.Char8      as BSC
import           LN.Api.Web.Types           (ApiHandler, ApiState (..))
import qualified Network.Connection         as Network
import qualified Network.HTTP.Conduit       as Conduit
import           Network.Wreq
import qualified Network.Wreq.Types         as WreqTypes



settings :: Conduit.ManagerSettings
settings = Conduit.mkManagerSettings (Network.TLSSettingsSimple True False False) Nothing



apiOptions :: WreqTypes.Options
apiOptions = defaults {
  WreqTypes.manager = Left settings -- Left tlsManagerSettings
}



defaultApiState :: ApiState
defaultApiState = ApiState {
  wsApiUrl = "https://leuro.adarq.org/api/",
  wsApiKey = Just "1",
  wsApiOptions = apiOptions
}



requireAuth :: ApiHandler BSC.ByteString
requireAuth = do
  key <- asks wsApiKey
  case key of
    Nothing -> error "Auth required"
    Just key' -> return key'



runDefault :: ReaderT ApiState m a -> m a
runDefault actions = runReaderT actions defaultApiState



runWith :: ReaderT ApiState m a -> ApiState -> m a
runWith actions state = runReaderT actions state



runWithAuthId :: ReaderT ApiState m a -> String -> m a
runWithAuthId actions string_id = runWith actions (defaultApiState { wsApiKey = Just $ BSC.pack string_id })
