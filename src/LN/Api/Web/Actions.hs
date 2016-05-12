module LN.Api.Web.Actions (
--  runWith,
  apiOptionsAuth,
  apiOptions,
  apiGet,
  apiGet',
  apiPost,
  apiPost',
  apiPut,
  apiPut',
  apiDelete,
  apiDelete'
) where



import           Control.Monad
import           Control.Monad.IO.Class
import           Control.Monad.Trans.Reader

import           Control.Lens
import           Data.Aeson
import           Data.ByteString.Lazy       hiding (putStrLn)
import           Data.Monoid                ((<>))
import           Data.Text                  (Text)
import           Network.Wreq
import qualified Network.Wreq.Types         as WreqTypes

import           LN.Api.Web.Misc            (apiOptions, requireAuth)
import           LN.Api.Web.Types           (ApiHandler, ApiState (..))



apiOptionsAuth :: ReaderT ApiState IO Options
apiOptionsAuth = do
  key <- requireAuth
  return $ apiOptions & header "z-authorization" .~ [key]
--  return $ apiOptions & header "Authorization" .~ [key]



getOpts :: (Foldable t) => t (Text, Text) -> ApiHandler Options
getOpts params' = do

  mapi_key <- asks wsApiKey
  options'  <- asks wsApiOptions

  let
    opts = case mapi_key of
      Nothing        -> options'
      (Just api_key) -> options' & header "z-authorization" .~ [api_key]

    opts_with_params = Prelude.foldl (\acc (k, v) -> acc & param k .~ [v]) opts params'

  return $ opts_with_params



apiGetWith :: (Foldable t) => t (Text, Text) -> String -> ApiHandler ByteString
apiGetWith params' route = do

  base_url <- asks wsApiUrl
  opts <- getOpts params'

  r <- liftIO $ getWith opts (base_url <> route)
  return $ r ^. responseBody



apiGet :: (Foldable t) => t (Text, Text) -> String -> ApiHandler ByteString
apiGet params' route = do

  apiGetWith params' route



apiGet' :: String -> ApiHandler ByteString
apiGet' = apiGet []



apiPostWith :: (Foldable t, WreqTypes.Postable a) => t (Text, Text) -> String -> a -> ApiHandler ByteString
apiPostWith params' route body = do

  base_url <- asks wsApiUrl
  opts <- getOpts params'

  r <- liftIO $ postWith opts (base_url <> route) body
  return $ r ^. responseBody



apiPost :: (Foldable t, ToJSON a) => t (Text, Text) -> String -> a -> ApiHandler ByteString
apiPost params' route body = do

  apiPostWith params' route (toJSON body)



apiPost' :: (ToJSON a) => String -> a -> ApiHandler ByteString
apiPost' = apiPost []




apiPutWith :: (Foldable t, WreqTypes.Putable a) => t (Text, Text) -> String -> a -> ApiHandler ByteString
apiPutWith params' route body = do

  base_url <- asks wsApiUrl
  opts <- getOpts params'

  r <- liftIO $ putWith opts (base_url <> route) body
  return $ r ^. responseBody



apiPut :: (Foldable t, ToJSON a) => t (Text, Text) -> String -> a -> ApiHandler ByteString
apiPut params' route body = do

  apiPutWith params' route (toJSON body)



apiPut' :: (ToJSON a) => String -> a -> ApiHandler ByteString
apiPut' = apiPut []



apiDeleteWith :: (Foldable t) => t (Text, Text) -> String -> ApiHandler ()
apiDeleteWith params' route = do

  base_url <- asks wsApiUrl
  opts <- getOpts params'

  void $ liftIO $ deleteWith opts (base_url <> route)



apiDelete :: (Foldable t) => t (Text, Text) -> String -> ApiHandler ()
apiDelete params' route = do

  apiDeleteWith params' route



apiDelete' :: String -> ApiHandler ()
apiDelete' = apiDelete []
