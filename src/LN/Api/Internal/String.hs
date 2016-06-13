{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}

module LN.Api.Internal.String where




import Haskell.Api.Helpers
import Data.Int

import Data.Int
import LN.T hiding (Param(..), QueryParam, SortOrderBy(..), OrderBy(..), ParamTag(..))
import LN.T.Param.String


getUserSanitizedPack :: forall qp. QueryParam qp => [qp] -> [Char] -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack params user_nick = handleError <$> getAt params ["user_sanitized_pack", show user_nick]

getUserSanitizedPack' :: [Char] -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack' user_nick = handleError <$> getAt ([] :: [(String, String)]) ["user_sanitized_pack", show user_nick]

getOrganization :: forall qp. QueryParam qp => [qp] -> [Char] -> ApiEff (Either ApiError OrganizationResponse)
getOrganization params organization_name = handleError <$> getAt params ["organization", show organization_name]

getOrganization' :: [Char] -> ApiEff (Either ApiError OrganizationResponse)
getOrganization' organization_name = handleError <$> getAt ([] :: [(String, String)]) ["organization", show organization_name]

getOrganizationPack :: forall qp. QueryParam qp => [qp] -> [Char] -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack params organization_name = handleError <$> getAt params ["organization_pack", show organization_name]

getOrganizationPack' :: [Char] -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack' organization_name = handleError <$> getAt ([] :: [(String, String)]) ["organization_pack", show organization_name]

getTeam_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError TeamResponse)
getTeam_ByOrganizationId params team_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["team", show team_name]

getTeam_ByOrganizationId' :: [Char] -> Int64 -> ApiEff (Either ApiError TeamResponse)
getTeam_ByOrganizationId' team_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["team", show team_name]

getTeamPack_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError TeamPackResponse)
getTeamPack_ByOrganizationId params team_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["team_pack", show team_name]

getTeamPack_ByOrganizationId' :: [Char] -> Int64 -> ApiEff (Either ApiError TeamPackResponse)
getTeamPack_ByOrganizationId' team_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["team_pack", show team_name]

getGlobalGroup_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError GlobalGroupResponse)
getGlobalGroup_ByOrganizationId params global_group_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["global_group", show global_group_name]

getGlobalGroup_ByOrganizationId' :: [Char] -> Int64 -> ApiEff (Either ApiError GlobalGroupResponse)
getGlobalGroup_ByOrganizationId' global_group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["global_group", show global_group_name]

getGlobalGroupPack_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError GlobalGroupPackResponse)
getGlobalGroupPack_ByOrganizationId params global_group_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["global_group_pack", show global_group_name]

getGlobalGroupPack_ByOrganizationId' :: [Char] -> Int64 -> ApiEff (Either ApiError GlobalGroupPackResponse)
getGlobalGroupPack_ByOrganizationId' global_group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["global_group_pack", show global_group_name]

getGroup_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError GroupResponse)
getGroup_ByOrganizationId params group_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["group", show group_name]

getGroup_ByOrganizationId' :: [Char] -> Int64 -> ApiEff (Either ApiError GroupResponse)
getGroup_ByOrganizationId' group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["group", show group_name]

getGroupPack_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError GroupPackResponse)
getGroupPack_ByOrganizationId params group_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["group_pack", show group_name]

getGroupPack_ByOrganizationId' :: [Char] -> Int64 -> ApiEff (Either ApiError GroupPackResponse)
getGroupPack_ByOrganizationId' group_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["group_pack", show group_name]

getForum_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationId params forum_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forum", show forum_name]

getForum_ByOrganizationId' :: [Char] -> Int64 -> ApiEff (Either ApiError ForumResponse)
getForum_ByOrganizationId' forum_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forum", show forum_name]

getForumPack_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError ForumPackResponse)
getForumPack_ByOrganizationId params forum_name _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forum_pack", show forum_name]

getForumPack_ByOrganizationId' :: [Char] -> Int64 -> ApiEff (Either ApiError ForumPackResponse)
getForumPack_ByOrganizationId' forum_name _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forum_pack", show forum_name]

getBoard_ByForumId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId params board_name _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board", show board_name]

getBoard_ByForumId' :: [Char] -> Int64 -> ApiEff (Either ApiError BoardResponse)
getBoard_ByForumId' board_name _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board", show board_name]

getBoardPack_ByForumId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack_ByForumId params board_name _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board_pack", show board_name]

getBoardPack_ByForumId' :: [Char] -> Int64 -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack_ByForumId' board_name _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board_pack", show board_name]

getThread_ByBoardId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId params thread_name _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread", show thread_name]

getThread_ByBoardId' :: [Char] -> Int64 -> ApiEff (Either ApiError ThreadResponse)
getThread_ByBoardId' thread_name _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread", show thread_name]

getThreadPack_ByBoardId :: forall qp. QueryParam qp => [qp] -> [Char] -> Int64 -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack_ByBoardId params thread_name _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread_pack", show thread_name]

getThreadPack_ByBoardId' :: [Char] -> Int64 -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack_ByBoardId' thread_name _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread_pack", show thread_name]

-- footer