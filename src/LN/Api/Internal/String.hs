{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}

module LN.Api.Internal.String where




import Haskell.Api.Helpers
import Data.Text (Text)
import qualified Data.Text as T
import Data.Int


import LN.T

getUserSanitizedPack :: forall qp. QueryParam qp => [qp] -> Text -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack params user_nick = handleError <$> getAt params ["user_sanitized_pack", user_nick]

getUserSanitizedPack' :: Text -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack' user_nick = handleError <$> getAt ([] :: [(Text, Text)]) ["user_sanitized_pack", user_nick]

getOrganization :: forall qp. QueryParam qp => [qp] -> Text -> ApiEff (Either ApiError OrganizationResponse)
getOrganization params organization_name = handleError <$> getAt params ["organization", organization_name]

getOrganization' :: Text -> ApiEff (Either ApiError OrganizationResponse)
getOrganization' organization_name = handleError <$> getAt ([] :: [(Text, Text)]) ["organization", organization_name]

getOrganizationPack :: forall qp. QueryParam qp => [qp] -> Text -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack params organization_name = handleError <$> getAt params ["organization_pack", organization_name]

getOrganizationPack' :: Text -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack' organization_name = handleError <$> getAt ([] :: [(Text, Text)]) ["organization_pack", organization_name]

getTeam_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError TeamResponse)
getTeam_ByOrganizationId params team_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["team", team_name]

getTeam_ByOrganizationId' :: Text -> Int64 -> ApiEff (Either ApiError TeamResponse)
getTeam_ByOrganizationId' team_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["team", team_name]

getTeamPack_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError TeamPackResponse)
getTeamPack_ByOrganizationId params team_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["team_pack", team_name]

getTeamPack_ByOrganizationId' :: Text -> Int64 -> ApiEff (Either ApiError TeamPackResponse)
getTeamPack_ByOrganizationId' team_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["team_pack", team_name]

getGlobalGroup_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError GlobalGroupResponse)
getGlobalGroup_ByOrganizationId params global_group_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["global_group", global_group_name]

getGlobalGroup_ByOrganizationId' :: Text -> Int64 -> ApiEff (Either ApiError GlobalGroupResponse)
getGlobalGroup_ByOrganizationId' global_group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["global_group", global_group_name]

getGlobalGroupPack_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError GlobalGroupPackResponse)
getGlobalGroupPack_ByOrganizationId params global_group_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["global_group_pack", global_group_name]

getGlobalGroupPack_ByOrganizationId' :: Text -> Int64 -> ApiEff (Either ApiError GlobalGroupPackResponse)
getGlobalGroupPack_ByOrganizationId' global_group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["global_group_pack", global_group_name]

getGroup_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError GroupResponse)
getGroup_ByOrganizationId params group_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["group", group_name]

getGroup_ByOrganizationId' :: Text -> Int64 -> ApiEff (Either ApiError GroupResponse)
getGroup_ByOrganizationId' group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["group", group_name]

getGroupPack_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError GroupPackResponse)
getGroupPack_ByOrganizationId params group_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["group_pack", group_name]

getGroupPack_ByOrganizationId' :: Text -> Int64 -> ApiEff (Either ApiError GroupPackResponse)
getGroupPack_ByOrganizationId' group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["group_pack", group_name]

getForum_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationId params forum_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forum", forum_name]

getForum_ByOrganizationId' :: Text -> Int64 -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationId' forum_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forum", forum_name]

getForumPack_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError ForumPackResponse)
getForumPack_ByOrganizationId params forum_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forum_pack", forum_name]

getForumPack_ByOrganizationId' :: Text -> Int64 -> ApiEff (Either ApiError ForumPackResponse)
getForumPack_ByOrganizationId' forum_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forum_pack", forum_name]

getBoard_ByForumId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId params board_name _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board", board_name]

getBoard_ByForumId' :: Text -> Int64 -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId' board_name _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board", board_name]

getBoardPack_ByForumId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack_ByForumId params board_name _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board_pack", board_name]

getBoardPack_ByForumId' :: Text -> Int64 -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack_ByForumId' board_name _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board_pack", board_name]

getThread_ByBoardId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId params thread_name _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread", thread_name]

getThread_ByBoardId' :: Text -> Int64 -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId' thread_name _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread", thread_name]

getThreadPack_ByBoardId :: forall qp. QueryParam qp => [qp] -> Text -> Int64 -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack_ByBoardId params thread_name _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread_pack", thread_name]

getThreadPack_ByBoardId' :: Text -> Int64 -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack_ByBoardId' thread_name _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread_pack", thread_name]

-- footer