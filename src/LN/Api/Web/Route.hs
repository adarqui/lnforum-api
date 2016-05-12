module LN.Api.Web.Route (
  route,
  tshow
) where



import           Data.List (intersperse)
import           Data.Text (Text)
import qualified Data.Text as T (pack)



route :: [String] -> String
route = concat . intersperse "/"



tshow :: Show a => a -> Text
tshow = T.pack . show
