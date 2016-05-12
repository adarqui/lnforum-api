{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}

module LN.Api.Internal.String where




import Haskell.Api.Helpers
import Data.Int

import LN.T
import Data.Int

getUserSanitizedPack :: forall qp. QueryParam qp => [qp] -> Text -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack params user_nick = handleError <$> getAt params ["user_sanitized_pack", user_nick]

getUserSanitizedPack' :: Text -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack' user_nick = handleError <$> getAt ([] :: [(String, String)]) ["user_sanitized_pack", user_nick]

getOrganization :: forall qp. QueryParam qp => [qp] -> Text -> ApiEff (Either ApiError OrganizationResponse)
getOrganization params organization_name = handleError <$> getAt params ["organization", organization_name]

getOrganization' :: Text -> ApiEff (Either ApiError OrganizationResponse)
getOrganization' organization_name = handleError <$> getAt ([] :: [(String, String)]) ["organization", organization_name]

getForum_ByOrganizationName :: forall qp. QueryParam qp => [qp] -> Text -> Text -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationName params forum_name _ByOrganizationName = handleError <$> getAt (map qp params ++ map qp [ByOrganizationName _ByOrganizationName]) ["forum", forum_name]

getForum_ByOrganizationName' :: Text -> Text -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationName' forum_name _ByOrganizationName = handleError <$> getAt [ByOrganizationName _ByOrganizationName] ["forum", forum_name]

getBoard_ByForumId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId params board_name _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board", board_name]

getBoard_ByForumId' :: Text -> Int64 -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId' board_name _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board", board_name]

getThread_ByBoardId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId params thread_name _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread", thread_name]

getThread_ByBoardId' :: Text -> Int64 -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId' thread_name _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread", thread_name]

-- footer