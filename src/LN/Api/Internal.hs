{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}

module LN.Api.Internal where




import Haskell.Api.Helpers
import Data.Int

import LN.T
import Data.Int

getEmptys :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError EmptyResponses)
getEmptys params = handleError <$> getAt params ["emptys"]

getEmptys' :: ApiEff (Either ApiError EmptyResponses)
getEmptys'  = handleError <$> getAt ([] :: [(String, String)]) ["emptys"]

postEmpty :: forall qp. QueryParam qp => [qp] -> EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
postEmpty params empty_request = handleError <$> postAt params ["empty"] empty_request

postEmpty' :: EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
postEmpty' empty_request = handleError <$> postAt ([] :: [(String, String)]) ["empty"] empty_request

getEmpty :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError EmptyResponse)
getEmpty params empty_id = handleError <$> getAt params ["empty", show empty_id]

getEmpty' :: Int64 -> ApiEff (Either ApiError EmptyResponse)
getEmpty' empty_id = handleError <$> getAt ([] :: [(String, String)]) ["empty", show empty_id]

putEmpty :: forall qp. QueryParam qp => [qp] -> Int64 -> EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
putEmpty params empty_id empty_request = handleError <$> putAt params ["empty", show empty_id] empty_request

putEmpty' :: Int64 -> EmptyRequest -> ApiEff (Either ApiError EmptyResponse)
putEmpty' empty_id empty_request = handleError <$> putAt ([] :: [(String, String)]) ["empty", show empty_id] empty_request

deleteEmpty :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteEmpty params empty_id = handleError <$> deleteAt params ["empty", show empty_id]

deleteEmpty' :: Int64 -> ApiEff (Either ApiError ())
deleteEmpty' empty_id = handleError <$> deleteAt ([] :: [(String, String)]) ["empty", show empty_id]

getApis :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError ApiResponses)
getApis params = handleError <$> getAt params ["apis"]

getApis' :: ApiEff (Either ApiError ApiResponses)
getApis'  = handleError <$> getAt ([] :: [(String, String)]) ["apis"]

postApi :: forall qp. QueryParam qp => [qp] -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
postApi params api_request = handleError <$> postAt params ["api"] api_request

postApi' :: ApiRequest -> ApiEff (Either ApiError ApiResponse)
postApi' api_request = handleError <$> postAt ([] :: [(String, String)]) ["api"] api_request

getApi :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ApiResponse)
getApi params api_id = handleError <$> getAt params ["api", show api_id]

getApi' :: Int64 -> ApiEff (Either ApiError ApiResponse)
getApi' api_id = handleError <$> getAt ([] :: [(String, String)]) ["api", show api_id]

putApi :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
putApi params api_id api_request = handleError <$> putAt params ["api", show api_id] api_request

putApi' :: Int64 -> ApiRequest -> ApiEff (Either ApiError ApiResponse)
putApi' api_id api_request = handleError <$> putAt ([] :: [(String, String)]) ["api", show api_id] api_request

deleteApi :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteApi params api_id = handleError <$> deleteAt params ["api", show api_id]

deleteApi' :: Int64 -> ApiEff (Either ApiError ())
deleteApi' api_id = handleError <$> deleteAt ([] :: [(String, String)]) ["api", show api_id]

getBoards :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError BoardResponses)
getBoards params = handleError <$> getAt params ["boards"]

getBoards' :: ApiEff (Either ApiError BoardResponses)
getBoards'  = handleError <$> getAt ([] :: [(String, String)]) ["boards"]

getBoards_ByBoardsIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError BoardResponses)
getBoards_ByBoardsIds params _ByBoardsIds = handleError <$> getAt (map qp params ++ map qp [ByBoardsIds _ByBoardsIds]) ["boards"]

getBoards_ByBoardsIds' :: [Int64] -> ApiEff (Either ApiError BoardResponses)
getBoards_ByBoardsIds' _ByBoardsIds = handleError <$> getAt [ByBoardsIds _ByBoardsIds] ["boards"]

getBoards_ByForumId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError BoardResponses)
getBoards_ByForumId params _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["boards"]

getBoards_ByForumId' :: Int64 -> ApiEff (Either ApiError BoardResponses)
getBoards_ByForumId' _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["boards"]

postBoard :: forall qp. QueryParam qp => [qp] -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
postBoard params board_request = handleError <$> postAt params ["board"] board_request

postBoard' :: BoardRequest -> ApiEff (Either ApiError BoardResponse)
postBoard' board_request = handleError <$> postAt ([] :: [(String, String)]) ["board"] board_request

getBoard :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError BoardResponse)
getBoard params board_id = handleError <$> getAt params ["board", show board_id]

getBoard' :: Int64 -> ApiEff (Either ApiError BoardResponse)
getBoard' board_id = handleError <$> getAt ([] :: [(String, String)]) ["board", show board_id]

putBoard :: forall qp. QueryParam qp => [qp] -> Int64 -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
putBoard params board_id board_request = handleError <$> putAt params ["board", show board_id] board_request

putBoard' :: Int64 -> BoardRequest -> ApiEff (Either ApiError BoardResponse)
putBoard' board_id board_request = handleError <$> putAt ([] :: [(String, String)]) ["board", show board_id] board_request

deleteBoard :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteBoard params board_id = handleError <$> deleteAt params ["board", show board_id]

deleteBoard' :: Int64 -> ApiEff (Either ApiError ())
deleteBoard' board_id = handleError <$> deleteAt ([] :: [(String, String)]) ["board", show board_id]

getBoardStats :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError BoardStatResponses)
getBoardStats params = handleError <$> getAt params ["board_stats"]

getBoardStats' :: ApiEff (Either ApiError BoardStatResponses)
getBoardStats'  = handleError <$> getAt ([] :: [(String, String)]) ["board_stats"]

getBoardStat :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError BoardStatResponse)
getBoardStat params board_id = handleError <$> getAt params ["board_stat", show board_id]

getBoardStat' :: Int64 -> ApiEff (Either ApiError BoardStatResponse)
getBoardStat' board_id = handleError <$> getAt ([] :: [(String, String)]) ["board_stat", show board_id]

getUsersCount :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError CountResponses)
getUsersCount params = handleError <$> getAt params ["users_count"]

getUsersCount' :: ApiEff (Either ApiError CountResponses)
getUsersCount'  = handleError <$> getAt ([] :: [(String, String)]) ["users_count"]

getOrganizationsCount :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError CountResponses)
getOrganizationsCount params = handleError <$> getAt params ["organizations_count"]

getOrganizationsCount' :: ApiEff (Either ApiError CountResponses)
getOrganizationsCount'  = handleError <$> getAt ([] :: [(String, String)]) ["organizations_count"]

getTeamsCount :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError CountResponses)
getTeamsCount params = handleError <$> getAt params ["teams_count"]

getTeamsCount' :: ApiEff (Either ApiError CountResponses)
getTeamsCount'  = handleError <$> getAt ([] :: [(String, String)]) ["teams_count"]

getForumsCount :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError CountResponses)
getForumsCount params = handleError <$> getAt params ["forums_count"]

getForumsCount' :: ApiEff (Either ApiError CountResponses)
getForumsCount'  = handleError <$> getAt ([] :: [(String, String)]) ["forums_count"]

getBoardsCount :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError CountResponses)
getBoardsCount params = handleError <$> getAt params ["boards_count"]

getBoardsCount' :: ApiEff (Either ApiError CountResponses)
getBoardsCount'  = handleError <$> getAt ([] :: [(String, String)]) ["boards_count"]

getThreadsCount :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError CountResponses)
getThreadsCount params = handleError <$> getAt params ["threads_count"]

getThreadsCount' :: ApiEff (Either ApiError CountResponses)
getThreadsCount'  = handleError <$> getAt ([] :: [(String, String)]) ["threads_count"]

getThreadsCount_ByBoardId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError CountResponses)
getThreadsCount_ByBoardId params _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["threads_count"]

getThreadsCount_ByBoardId' :: Int64 -> ApiEff (Either ApiError CountResponses)
getThreadsCount_ByBoardId' _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["threads_count"]

getThreadPostsCount :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError CountResponses)
getThreadPostsCount params = handleError <$> getAt params ["thread_posts_count"]

getThreadPostsCount' :: ApiEff (Either ApiError CountResponses)
getThreadPostsCount'  = handleError <$> getAt ([] :: [(String, String)]) ["thread_posts_count"]

getThreadPostsCount_ByThreadId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError CountResponses)
getThreadPostsCount_ByThreadId params _ByThreadId = handleError <$> getAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["thread_posts_count"]

getThreadPostsCount_ByThreadId' :: Int64 -> ApiEff (Either ApiError CountResponses)
getThreadPostsCount_ByThreadId' _ByThreadId = handleError <$> getAt [ByThreadId _ByThreadId] ["thread_posts_count"]

getResourcesCount :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError CountResponses)
getResourcesCount params = handleError <$> getAt params ["resources_count"]

getResourcesCount' :: ApiEff (Either ApiError CountResponses)
getResourcesCount'  = handleError <$> getAt ([] :: [(String, String)]) ["resources_count"]

getLeuronsCount :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError CountResponses)
getLeuronsCount params = handleError <$> getAt params ["leurons_count"]

getLeuronsCount' :: ApiEff (Either ApiError CountResponses)
getLeuronsCount'  = handleError <$> getAt ([] :: [(String, String)]) ["leurons_count"]

getForums :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError ForumResponses)
getForums params = handleError <$> getAt params ["forums"]

getForums' :: ApiEff (Either ApiError ForumResponses)
getForums'  = handleError <$> getAt ([] :: [(String, String)]) ["forums"]

getForums_ByOrganizationName :: forall qp. QueryParam qp => [qp] -> Text -> ApiEff (Either ApiError ForumResponses)
getForums_ByOrganizationName params _ByOrganizationName = handleError <$> getAt (map qp params ++ map qp [ByOrganizationName _ByOrganizationName]) ["forums"]

getForums_ByOrganizationName' :: Text -> ApiEff (Either ApiError ForumResponses)
getForums_ByOrganizationName' _ByOrganizationName = handleError <$> getAt [ByOrganizationName _ByOrganizationName] ["forums"]

getForums_ByForumsIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError ForumResponses)
getForums_ByForumsIds params _ByForumsIds = handleError <$> getAt (map qp params ++ map qp [ByForumsIds _ByForumsIds]) ["forums"]

getForums_ByForumsIds' :: [Int64] -> ApiEff (Either ApiError ForumResponses)
getForums_ByForumsIds' _ByForumsIds = handleError <$> getAt [ByForumsIds _ByForumsIds] ["forums"]

getForums_ByOrganizationId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ForumResponses)
getForums_ByOrganizationId params _ByOrganizationId = handleError <$> getAt (map qp params ++ map qp [ByOrganizationId _ByOrganizationId]) ["forums"]

getForums_ByOrganizationId' :: Int64 -> ApiEff (Either ApiError ForumResponses)
getForums_ByOrganizationId' _ByOrganizationId = handleError <$> getAt [ByOrganizationId _ByOrganizationId] ["forums"]

postForum :: forall qp. QueryParam qp => [qp] -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
postForum params forum_request = handleError <$> postAt params ["forum"] forum_request

postForum' :: ForumRequest -> ApiEff (Either ApiError ForumResponse)
postForum' forum_request = handleError <$> postAt ([] :: [(String, String)]) ["forum"] forum_request

getForum :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ForumResponse)
getForum params forum_id = handleError <$> getAt params ["forum", show forum_id]

getForum' :: Int64 -> ApiEff (Either ApiError ForumResponse)
getForum' forum_id = handleError <$> getAt ([] :: [(String, String)]) ["forum", show forum_id]

putForum :: forall qp. QueryParam qp => [qp] -> Int64 -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
putForum params forum_id forum_request = handleError <$> putAt params ["forum", show forum_id] forum_request

putForum' :: Int64 -> ForumRequest -> ApiEff (Either ApiError ForumResponse)
putForum' forum_id forum_request = handleError <$> putAt ([] :: [(String, String)]) ["forum", show forum_id] forum_request

deleteForum :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteForum params forum_id = handleError <$> deleteAt params ["forum", show forum_id]

deleteForum' :: Int64 -> ApiEff (Either ApiError ())
deleteForum' forum_id = handleError <$> deleteAt ([] :: [(String, String)]) ["forum", show forum_id]

getForumStats :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError ForumStatResponses)
getForumStats params = handleError <$> getAt params ["forum_stats"]

getForumStats' :: ApiEff (Either ApiError ForumStatResponses)
getForumStats'  = handleError <$> getAt ([] :: [(String, String)]) ["forum_stats"]

getForumStat :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ForumStatResponse)
getForumStat params forum_id = handleError <$> getAt params ["forum_stat", show forum_id]

getForumStat' :: Int64 -> ApiEff (Either ApiError ForumStatResponse)
getForumStat' forum_id = handleError <$> getAt ([] :: [(String, String)]) ["forum_stat", show forum_id]

getLeurons :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError LeuronResponses)
getLeurons params = handleError <$> getAt params ["leurons"]

getLeurons' :: ApiEff (Either ApiError LeuronResponses)
getLeurons'  = handleError <$> getAt ([] :: [(String, String)]) ["leurons"]

postLeuron :: forall qp. QueryParam qp => [qp] -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
postLeuron params leuron_request = handleError <$> postAt params ["leuron"] leuron_request

postLeuron' :: LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
postLeuron' leuron_request = handleError <$> postAt ([] :: [(String, String)]) ["leuron"] leuron_request

getLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError LeuronResponse)
getLeuron params leuron_id = handleError <$> getAt params ["leuron", show leuron_id]

getLeuron' :: Int64 -> ApiEff (Either ApiError LeuronResponse)
getLeuron' leuron_id = handleError <$> getAt ([] :: [(String, String)]) ["leuron", show leuron_id]

putLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
putLeuron params leuron_id leuron_request = handleError <$> putAt params ["leuron", show leuron_id] leuron_request

putLeuron' :: Int64 -> LeuronRequest -> ApiEff (Either ApiError LeuronResponse)
putLeuron' leuron_id leuron_request = handleError <$> putAt ([] :: [(String, String)]) ["leuron", show leuron_id] leuron_request

deleteLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteLeuron params leuron_id = handleError <$> deleteAt params ["leuron", show leuron_id]

deleteLeuron' :: Int64 -> ApiEff (Either ApiError ())
deleteLeuron' leuron_id = handleError <$> deleteAt ([] :: [(String, String)]) ["leuron", show leuron_id]

getMe :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError UserResponse)
getMe params = handleError <$> getAt params ["me"]

getMe' :: ApiEff (Either ApiError UserResponse)
getMe'  = handleError <$> getAt ([] :: [(String, String)]) ["me"]

getMePack :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError UserPackResponse)
getMePack params = handleError <$> getAt params ["me_pack"]

getMePack' :: ApiEff (Either ApiError UserPackResponse)
getMePack'  = handleError <$> getAt ([] :: [(String, String)]) ["me_pack"]

getOrganizations :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError OrganizationResponses)
getOrganizations params = handleError <$> getAt params ["organizations"]

getOrganizations' :: ApiEff (Either ApiError OrganizationResponses)
getOrganizations'  = handleError <$> getAt ([] :: [(String, String)]) ["organizations"]

postOrganization :: forall qp. QueryParam qp => [qp] -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
postOrganization params organization_request = handleError <$> postAt params ["organization"] organization_request

postOrganization' :: OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
postOrganization' organization_request = handleError <$> postAt ([] :: [(String, String)]) ["organization"] organization_request

getOrganization :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError OrganizationResponse)
getOrganization params organization_id = handleError <$> getAt params ["organization", show organization_id]

getOrganization' :: Int64 -> ApiEff (Either ApiError OrganizationResponse)
getOrganization' organization_id = handleError <$> getAt ([] :: [(String, String)]) ["organization", show organization_id]

putOrganization :: forall qp. QueryParam qp => [qp] -> Int64 -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
putOrganization params organization_id organization_request = handleError <$> putAt params ["organization", show organization_id] organization_request

putOrganization' :: Int64 -> OrganizationRequest -> ApiEff (Either ApiError OrganizationResponse)
putOrganization' organization_id organization_request = handleError <$> putAt ([] :: [(String, String)]) ["organization", show organization_id] organization_request

deleteOrganization :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteOrganization params organization_id = handleError <$> deleteAt params ["organization", show organization_id]

deleteOrganization' :: Int64 -> ApiEff (Either ApiError ())
deleteOrganization' organization_id = handleError <$> deleteAt ([] :: [(String, String)]) ["organization", show organization_id]

getOrganizationStats :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError OrganizationStatResponses)
getOrganizationStats params = handleError <$> getAt params ["organization_stats"]

getOrganizationStats' :: ApiEff (Either ApiError OrganizationStatResponses)
getOrganizationStats'  = handleError <$> getAt ([] :: [(String, String)]) ["organization_stats"]

getOrganizationStat :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError OrganizationStatResponse)
getOrganizationStat params organization_id = handleError <$> getAt params ["organization_stat", show organization_id]

getOrganizationStat' :: Int64 -> ApiEff (Either ApiError OrganizationStatResponse)
getOrganizationStat' organization_id = handleError <$> getAt ([] :: [(String, String)]) ["organization_stat", show organization_id]

getPms :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError PmResponses)
getPms params = handleError <$> getAt params ["pms"]

getPms' :: ApiEff (Either ApiError PmResponses)
getPms'  = handleError <$> getAt ([] :: [(String, String)]) ["pms"]

postPm :: forall qp. QueryParam qp => [qp] -> PmRequest -> ApiEff (Either ApiError PmResponse)
postPm params pm_request = handleError <$> postAt params ["pm"] pm_request

postPm' :: PmRequest -> ApiEff (Either ApiError PmResponse)
postPm' pm_request = handleError <$> postAt ([] :: [(String, String)]) ["pm"] pm_request

getPm :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError PmResponse)
getPm params pm_id = handleError <$> getAt params ["pm", show pm_id]

getPm' :: Int64 -> ApiEff (Either ApiError PmResponse)
getPm' pm_id = handleError <$> getAt ([] :: [(String, String)]) ["pm", show pm_id]

putPm :: forall qp. QueryParam qp => [qp] -> Int64 -> PmRequest -> ApiEff (Either ApiError PmResponse)
putPm params pm_id pm_request = handleError <$> putAt params ["pm", show pm_id] pm_request

putPm' :: Int64 -> PmRequest -> ApiEff (Either ApiError PmResponse)
putPm' pm_id pm_request = handleError <$> putAt ([] :: [(String, String)]) ["pm", show pm_id] pm_request

deletePm :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deletePm params pm_id = handleError <$> deleteAt params ["pm", show pm_id]

deletePm' :: Int64 -> ApiEff (Either ApiError ())
deletePm' pm_id = handleError <$> deleteAt ([] :: [(String, String)]) ["pm", show pm_id]

getPmIns :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError PmInResponses)
getPmIns params = handleError <$> getAt params ["pm_ins"]

getPmIns' :: ApiEff (Either ApiError PmInResponses)
getPmIns'  = handleError <$> getAt ([] :: [(String, String)]) ["pm_ins"]

postPmIn :: forall qp. QueryParam qp => [qp] -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
postPmIn params pm_in_request = handleError <$> postAt params ["pm_in"] pm_in_request

postPmIn' :: PmInRequest -> ApiEff (Either ApiError PmInResponse)
postPmIn' pm_in_request = handleError <$> postAt ([] :: [(String, String)]) ["pm_in"] pm_in_request

getPmIn :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError PmInResponse)
getPmIn params pm_in_id = handleError <$> getAt params ["pm_in", show pm_in_id]

getPmIn' :: Int64 -> ApiEff (Either ApiError PmInResponse)
getPmIn' pm_in_id = handleError <$> getAt ([] :: [(String, String)]) ["pm_in", show pm_in_id]

putPmIn :: forall qp. QueryParam qp => [qp] -> Int64 -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
putPmIn params pm_in_id pm_in_request = handleError <$> putAt params ["pm_in", show pm_in_id] pm_in_request

putPmIn' :: Int64 -> PmInRequest -> ApiEff (Either ApiError PmInResponse)
putPmIn' pm_in_id pm_in_request = handleError <$> putAt ([] :: [(String, String)]) ["pm_in", show pm_in_id] pm_in_request

deletePmIn :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deletePmIn params pm_in_id = handleError <$> deleteAt params ["pm_in", show pm_in_id]

deletePmIn' :: Int64 -> ApiEff (Either ApiError ())
deletePmIn' pm_in_id = handleError <$> deleteAt ([] :: [(String, String)]) ["pm_in", show pm_in_id]

getPmOuts :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError PmOutResponses)
getPmOuts params = handleError <$> getAt params ["pm_outs"]

getPmOuts' :: ApiEff (Either ApiError PmOutResponses)
getPmOuts'  = handleError <$> getAt ([] :: [(String, String)]) ["pm_outs"]

postPmOut :: forall qp. QueryParam qp => [qp] -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
postPmOut params pm_out_request = handleError <$> postAt params ["pm_out"] pm_out_request

postPmOut' :: PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
postPmOut' pm_out_request = handleError <$> postAt ([] :: [(String, String)]) ["pm_out"] pm_out_request

getPmOut :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError PmOutResponse)
getPmOut params pm_out_id = handleError <$> getAt params ["pm_out", show pm_out_id]

getPmOut' :: Int64 -> ApiEff (Either ApiError PmOutResponse)
getPmOut' pm_out_id = handleError <$> getAt ([] :: [(String, String)]) ["pm_out", show pm_out_id]

putPmOut :: forall qp. QueryParam qp => [qp] -> Int64 -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
putPmOut params pm_out_id pm_out_request = handleError <$> putAt params ["pm_out", show pm_out_id] pm_out_request

putPmOut' :: Int64 -> PmOutRequest -> ApiEff (Either ApiError PmOutResponse)
putPmOut' pm_out_id pm_out_request = handleError <$> putAt ([] :: [(String, String)]) ["pm_out", show pm_out_id] pm_out_request

deletePmOut :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deletePmOut params pm_out_id = handleError <$> deleteAt params ["pm_out", show pm_out_id]

deletePmOut' :: Int64 -> ApiEff (Either ApiError ())
deletePmOut' pm_out_id = handleError <$> deleteAt ([] :: [(String, String)]) ["pm_out", show pm_out_id]

getResources :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError ResourceResponses)
getResources params = handleError <$> getAt params ["resources"]

getResources' :: ApiEff (Either ApiError ResourceResponses)
getResources'  = handleError <$> getAt ([] :: [(String, String)]) ["resources"]

postResource :: forall qp. QueryParam qp => [qp] -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
postResource params resource_request = handleError <$> postAt params ["resource"] resource_request

postResource' :: ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
postResource' resource_request = handleError <$> postAt ([] :: [(String, String)]) ["resource"] resource_request

getResource :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ResourceResponse)
getResource params resource_id = handleError <$> getAt params ["resource", show resource_id]

getResource' :: Int64 -> ApiEff (Either ApiError ResourceResponse)
getResource' resource_id = handleError <$> getAt ([] :: [(String, String)]) ["resource", show resource_id]

putResource :: forall qp. QueryParam qp => [qp] -> Int64 -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
putResource params resource_id resource_request = handleError <$> putAt params ["resource", show resource_id] resource_request

putResource' :: Int64 -> ResourceRequest -> ApiEff (Either ApiError ResourceResponse)
putResource' resource_id resource_request = handleError <$> putAt ([] :: [(String, String)]) ["resource", show resource_id] resource_request

deleteResource :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteResource params resource_id = handleError <$> deleteAt params ["resource", show resource_id]

deleteResource' :: Int64 -> ApiEff (Either ApiError ())
deleteResource' resource_id = handleError <$> deleteAt ([] :: [(String, String)]) ["resource", show resource_id]

getTeams :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError TeamResponses)
getTeams params = handleError <$> getAt params ["teams"]

getTeams' :: ApiEff (Either ApiError TeamResponses)
getTeams'  = handleError <$> getAt ([] :: [(String, String)]) ["teams"]

postTeam :: forall qp. QueryParam qp => [qp] -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
postTeam params team_request = handleError <$> postAt params ["team"] team_request

postTeam' :: TeamRequest -> ApiEff (Either ApiError TeamResponse)
postTeam' team_request = handleError <$> postAt ([] :: [(String, String)]) ["team"] team_request

getTeam :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError TeamResponse)
getTeam params team_id = handleError <$> getAt params ["team", show team_id]

getTeam' :: Int64 -> ApiEff (Either ApiError TeamResponse)
getTeam' team_id = handleError <$> getAt ([] :: [(String, String)]) ["team", show team_id]

putTeam :: forall qp. QueryParam qp => [qp] -> Int64 -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
putTeam params team_id team_request = handleError <$> putAt params ["team", show team_id] team_request

putTeam' :: Int64 -> TeamRequest -> ApiEff (Either ApiError TeamResponse)
putTeam' team_id team_request = handleError <$> putAt ([] :: [(String, String)]) ["team", show team_id] team_request

deleteTeam :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteTeam params team_id = handleError <$> deleteAt params ["team", show team_id]

deleteTeam' :: Int64 -> ApiEff (Either ApiError ())
deleteTeam' team_id = handleError <$> deleteAt ([] :: [(String, String)]) ["team", show team_id]

getThreads :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError ThreadResponses)
getThreads params = handleError <$> getAt params ["threads"]

getThreads' :: ApiEff (Either ApiError ThreadResponses)
getThreads'  = handleError <$> getAt ([] :: [(String, String)]) ["threads"]

postThread_ByBoardId :: forall qp. QueryParam qp => [qp] -> Int64 -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
postThread_ByBoardId params _ByBoardId thread_request = handleError <$> postAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread"] thread_request

postThread_ByBoardId' :: Int64 -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
postThread_ByBoardId' _ByBoardId thread_request = handleError <$> postAt [ByBoardId _ByBoardId] ["thread"] thread_request

getThread :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadResponse)
getThread params thread_id = handleError <$> getAt params ["thread", show thread_id]

getThread' :: Int64 -> ApiEff (Either ApiError ThreadResponse)
getThread' thread_id = handleError <$> getAt ([] :: [(String, String)]) ["thread", show thread_id]

putThread :: forall qp. QueryParam qp => [qp] -> Int64 -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
putThread params thread_id thread_request = handleError <$> putAt params ["thread", show thread_id] thread_request

putThread' :: Int64 -> ThreadRequest -> ApiEff (Either ApiError ThreadResponse)
putThread' thread_id thread_request = handleError <$> putAt ([] :: [(String, String)]) ["thread", show thread_id] thread_request

deleteThread :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteThread params thread_id = handleError <$> deleteAt params ["thread", show thread_id]

deleteThread' :: Int64 -> ApiEff (Either ApiError ())
deleteThread' thread_id = handleError <$> deleteAt ([] :: [(String, String)]) ["thread", show thread_id]

getThreadStats :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError ThreadStatResponses)
getThreadStats params = handleError <$> getAt params ["thread_stats"]

getThreadStats' :: ApiEff (Either ApiError ThreadStatResponses)
getThreadStats'  = handleError <$> getAt ([] :: [(String, String)]) ["thread_stats"]

getThreadStat :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadStatResponse)
getThreadStat params thread_id = handleError <$> getAt params ["thread_stat", show thread_id]

getThreadStat' :: Int64 -> ApiEff (Either ApiError ThreadStatResponse)
getThreadStat' thread_id = handleError <$> getAt ([] :: [(String, String)]) ["thread_stat", show thread_id]

getThreadPosts :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError ThreadPostResponses)
getThreadPosts params = handleError <$> getAt params ["thread_posts"]

getThreadPosts' :: ApiEff (Either ApiError ThreadPostResponses)
getThreadPosts'  = handleError <$> getAt ([] :: [(String, String)]) ["thread_posts"]

getThreadPosts_ByThreadId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadPostResponses)
getThreadPosts_ByThreadId params _ByThreadId = handleError <$> getAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["thread_posts"]

getThreadPosts_ByThreadId' :: Int64 -> ApiEff (Either ApiError ThreadPostResponses)
getThreadPosts_ByThreadId' _ByThreadId = handleError <$> getAt [ByThreadId _ByThreadId] ["thread_posts"]

postThreadPost_ByThreadId :: forall qp. QueryParam qp => [qp] -> Int64 -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
postThreadPost_ByThreadId params _ByThreadId thread_post_request = handleError <$> postAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["thread_post"] thread_post_request

postThreadPost_ByThreadId' :: Int64 -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
postThreadPost_ByThreadId' _ByThreadId thread_post_request = handleError <$> postAt [ByThreadId _ByThreadId] ["thread_post"] thread_post_request

getThreadPost :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadPostResponse)
getThreadPost params thread_post_id = handleError <$> getAt params ["thread_post", show thread_post_id]

getThreadPost' :: Int64 -> ApiEff (Either ApiError ThreadPostResponse)
getThreadPost' thread_post_id = handleError <$> getAt ([] :: [(String, String)]) ["thread_post", show thread_post_id]

putThreadPost :: forall qp. QueryParam qp => [qp] -> Int64 -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
putThreadPost params thread_post_id thread_post_request = handleError <$> putAt params ["thread_post", show thread_post_id] thread_post_request

putThreadPost' :: Int64 -> ThreadPostRequest -> ApiEff (Either ApiError ThreadPostResponse)
putThreadPost' thread_post_id thread_post_request = handleError <$> putAt ([] :: [(String, String)]) ["thread_post", show thread_post_id] thread_post_request

deleteThreadPost :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteThreadPost params thread_post_id = handleError <$> deleteAt params ["thread_post", show thread_post_id]

deleteThreadPost' :: Int64 -> ApiEff (Either ApiError ())
deleteThreadPost' thread_post_id = handleError <$> deleteAt ([] :: [(String, String)]) ["thread_post", show thread_post_id]

getThreadPostStats_ByThreadPostsIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError ThreadPostStatResponses)
getThreadPostStats_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_stats"]

getThreadPostStats_ByThreadPostsIds' :: [Int64] -> ApiEff (Either ApiError ThreadPostStatResponses)
getThreadPostStats_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_stats"]

getThreadPostStat :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadPostStatResponse)
getThreadPostStat params thread_post_id = handleError <$> getAt params ["thread_post_stat", show thread_post_id]

getThreadPostStat' :: Int64 -> ApiEff (Either ApiError ThreadPostStatResponse)
getThreadPostStat' thread_post_id = handleError <$> getAt ([] :: [(String, String)]) ["thread_post_stat", show thread_post_id]

getThreadPostLikes :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError ThreadPostLikeResponses)
getThreadPostLikes params = handleError <$> getAt params ["thread_post_likes"]

getThreadPostLikes' :: ApiEff (Either ApiError ThreadPostLikeResponses)
getThreadPostLikes'  = handleError <$> getAt ([] :: [(String, String)]) ["thread_post_likes"]

getThreadPostLikes_ByThreadPostLikesIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError ThreadPostLikeResponses)
getThreadPostLikes_ByThreadPostLikesIds params _ByThreadPostLikesIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostLikesIds _ByThreadPostLikesIds]) ["thread_post_likes"]

getThreadPostLikes_ByThreadPostLikesIds' :: [Int64] -> ApiEff (Either ApiError ThreadPostLikeResponses)
getThreadPostLikes_ByThreadPostLikesIds' _ByThreadPostLikesIds = handleError <$> getAt [ByThreadPostLikesIds _ByThreadPostLikesIds] ["thread_post_likes"]

getThreadPostLikes_ByThreadPostsIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError ThreadPostLikeResponses)
getThreadPostLikes_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_likes"]

getThreadPostLikes_ByThreadPostsIds' :: [Int64] -> ApiEff (Either ApiError ThreadPostLikeResponses)
getThreadPostLikes_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_likes"]

getThreadPostLikes_ByThreadPostId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadPostLikeResponses)
getThreadPostLikes_ByThreadPostId params _ByThreadPostId = handleError <$> getAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["thread_post_likes"]

getThreadPostLikes_ByThreadPostId' :: Int64 -> ApiEff (Either ApiError ThreadPostLikeResponses)
getThreadPostLikes_ByThreadPostId' _ByThreadPostId = handleError <$> getAt [ByThreadPostId _ByThreadPostId] ["thread_post_likes"]

postThreadPostLike_ByThreadPostId :: forall qp. QueryParam qp => [qp] -> Int64 -> ThreadPostLikeRequest -> ApiEff (Either ApiError ThreadPostLikeResponse)
postThreadPostLike_ByThreadPostId params _ByThreadPostId thread_post_like_request = handleError <$> postAt (map qp params ++ map qp [ByThreadPostId _ByThreadPostId]) ["thread_post_like"] thread_post_like_request

postThreadPostLike_ByThreadPostId' :: Int64 -> ThreadPostLikeRequest -> ApiEff (Either ApiError ThreadPostLikeResponse)
postThreadPostLike_ByThreadPostId' _ByThreadPostId thread_post_like_request = handleError <$> postAt [ByThreadPostId _ByThreadPostId] ["thread_post_like"] thread_post_like_request

getThreadPostLike :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadPostLikeResponse)
getThreadPostLike params thread_post_like_id = handleError <$> getAt params ["thread_post_like", show thread_post_like_id]

getThreadPostLike' :: Int64 -> ApiEff (Either ApiError ThreadPostLikeResponse)
getThreadPostLike' thread_post_like_id = handleError <$> getAt ([] :: [(String, String)]) ["thread_post_like", show thread_post_like_id]

putThreadPostLike :: forall qp. QueryParam qp => [qp] -> Int64 -> ThreadPostLikeRequest -> ApiEff (Either ApiError ThreadPostLikeResponse)
putThreadPostLike params thread_post_like_id thread_post_like_request = handleError <$> putAt params ["thread_post_like", show thread_post_like_id] thread_post_like_request

putThreadPostLike' :: Int64 -> ThreadPostLikeRequest -> ApiEff (Either ApiError ThreadPostLikeResponse)
putThreadPostLike' thread_post_like_id thread_post_like_request = handleError <$> putAt ([] :: [(String, String)]) ["thread_post_like", show thread_post_like_id] thread_post_like_request

deleteThreadPostLike :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteThreadPostLike params thread_post_like_id = handleError <$> deleteAt params ["thread_post_like", show thread_post_like_id]

deleteThreadPostLike' :: Int64 -> ApiEff (Either ApiError ())
deleteThreadPostLike' thread_post_like_id = handleError <$> deleteAt ([] :: [(String, String)]) ["thread_post_like", show thread_post_like_id]

getThreadPostLikeStats_ByThreadPostsIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError ThreadPostLikeStatResponses)
getThreadPostLikeStats_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_like_stats"]

getThreadPostLikeStats_ByThreadPostsIds' :: [Int64] -> ApiEff (Either ApiError ThreadPostLikeStatResponses)
getThreadPostLikeStats_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_like_stats"]

getThreadPostLikeStats_ByThreadPostLikesIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError ThreadPostLikeStatResponses)
getThreadPostLikeStats_ByThreadPostLikesIds params _ByThreadPostLikesIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostLikesIds _ByThreadPostLikesIds]) ["thread_post_like_stats"]

getThreadPostLikeStats_ByThreadPostLikesIds' :: [Int64] -> ApiEff (Either ApiError ThreadPostLikeStatResponses)
getThreadPostLikeStats_ByThreadPostLikesIds' _ByThreadPostLikesIds = handleError <$> getAt [ByThreadPostLikesIds _ByThreadPostLikesIds] ["thread_post_like_stats"]

getThreadPostLikeStat :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadPostLikeStatResponse)
getThreadPostLikeStat params thread_post_like_id = handleError <$> getAt params ["thread_post_like_stat", show thread_post_like_id]

getThreadPostLikeStat' :: Int64 -> ApiEff (Either ApiError ThreadPostLikeStatResponse)
getThreadPostLikeStat' thread_post_like_id = handleError <$> getAt ([] :: [(String, String)]) ["thread_post_like_stat", show thread_post_like_id]

getUsers :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError UserResponses)
getUsers params = handleError <$> getAt params ["users"]

getUsers' :: ApiEff (Either ApiError UserResponses)
getUsers'  = handleError <$> getAt ([] :: [(String, String)]) ["users"]

getUsers_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["users"]

getUsers_ByUsersIds' :: [Int64] -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["users"]

getUsers_ByUsersNicks :: forall qp. QueryParam qp => [qp] -> [String] -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersNicks params _ByUsersNicks = handleError <$> getAt (map qp params ++ map qp [ByUsersNicks _ByUsersNicks]) ["users"]

getUsers_ByUsersNicks' :: [String] -> ApiEff (Either ApiError UserResponses)
getUsers_ByUsersNicks' _ByUsersNicks = handleError <$> getAt [ByUsersNicks _ByUsersNicks] ["users"]

postUser :: forall qp. QueryParam qp => [qp] -> UserRequest -> ApiEff (Either ApiError UserResponse)
postUser params user_request = handleError <$> postAt params ["user"] user_request

postUser' :: UserRequest -> ApiEff (Either ApiError UserResponse)
postUser' user_request = handleError <$> postAt ([] :: [(String, String)]) ["user"] user_request

getUser :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError UserResponse)
getUser params user_id = handleError <$> getAt params ["user", show user_id]

getUser' :: Int64 -> ApiEff (Either ApiError UserResponse)
getUser' user_id = handleError <$> getAt ([] :: [(String, String)]) ["user", show user_id]

putUser :: forall qp. QueryParam qp => [qp] -> Int64 -> UserRequest -> ApiEff (Either ApiError UserResponse)
putUser params user_id user_request = handleError <$> putAt params ["user", show user_id] user_request

putUser' :: Int64 -> UserRequest -> ApiEff (Either ApiError UserResponse)
putUser' user_id user_request = handleError <$> putAt ([] :: [(String, String)]) ["user", show user_id] user_request

deleteUser :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ())
deleteUser params user_id = handleError <$> deleteAt params ["user", show user_id]

deleteUser' :: Int64 -> ApiEff (Either ApiError ())
deleteUser' user_id = handleError <$> deleteAt ([] :: [(String, String)]) ["user", show user_id]

getUsersSanitized :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized params = handleError <$> getAt params ["users_sanitized"]

getUsersSanitized' :: ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized'  = handleError <$> getAt ([] :: [(String, String)]) ["users_sanitized"]

getUsersSanitized_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["users_sanitized"]

getUsersSanitized_ByUsersIds' :: [Int64] -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["users_sanitized"]

getUsersSanitized_ByUsersNicks :: forall qp. QueryParam qp => [qp] -> [String] -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersNicks params _ByUsersNicks = handleError <$> getAt (map qp params ++ map qp [ByUsersNicks _ByUsersNicks]) ["users_sanitized"]

getUsersSanitized_ByUsersNicks' :: [String] -> ApiEff (Either ApiError UserSanitizedResponses)
getUsersSanitized_ByUsersNicks' _ByUsersNicks = handleError <$> getAt [ByUsersNicks _ByUsersNicks] ["users_sanitized"]

getUserSanitized :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError UserSanitizedResponse)
getUserSanitized params user_id = handleError <$> getAt params ["user_sanitized", show user_id]

getUserSanitized' :: Int64 -> ApiEff (Either ApiError UserSanitizedResponse)
getUserSanitized' user_id = handleError <$> getAt ([] :: [(String, String)]) ["user_sanitized", show user_id]

getUserSanitizedStats :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats params = handleError <$> getAt params ["user_sanitized_stats"]

getUserSanitizedStats' :: ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats'  = handleError <$> getAt ([] :: [(String, String)]) ["user_sanitized_stats"]

getUserSanitizedStats_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_sanitized_stats"]

getUserSanitizedStats_ByUsersIds' :: [Int64] -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStats_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_sanitized_stats"]

getUserSanitizedStat :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStat params user_id = handleError <$> getAt params ["user_sanitized_stat", show user_id]

getUserSanitizedStat' :: Int64 -> ApiEff (Either ApiError UserSanitizedStatResponse)
getUserSanitizedStat' user_id = handleError <$> getAt ([] :: [(String, String)]) ["user_sanitized_stat", show user_id]

getBoardPacks :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks params = handleError <$> getAt params ["board_packs"]

getBoardPacks' :: ApiEff (Either ApiError BoardPackResponses)
getBoardPacks'  = handleError <$> getAt ([] :: [(String, String)]) ["board_packs"]

getBoardPacks_ByForumId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByForumId params _ByForumId = handleError <$> getAt (map qp params ++ map qp [ByForumId _ByForumId]) ["board_packs"]

getBoardPacks_ByForumId' :: Int64 -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByForumId' _ByForumId = handleError <$> getAt [ByForumId _ByForumId] ["board_packs"]

getBoardPacks_ByBoardsIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByBoardsIds params _ByBoardsIds = handleError <$> getAt (map qp params ++ map qp [ByBoardsIds _ByBoardsIds]) ["board_packs"]

getBoardPacks_ByBoardsIds' :: [Int64] -> ApiEff (Either ApiError BoardPackResponses)
getBoardPacks_ByBoardsIds' _ByBoardsIds = handleError <$> getAt [ByBoardsIds _ByBoardsIds] ["board_packs"]

getBoardPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack params board_id = handleError <$> getAt params ["board_pack", show board_id]

getBoardPack' :: Int64 -> ApiEff (Either ApiError BoardPackResponse)
getBoardPack' board_id = handleError <$> getAt ([] :: [(String, String)]) ["board_pack", show board_id]

getOrganizationPacks :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks params = handleError <$> getAt params ["organization_packs"]

getOrganizationPacks' :: ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks'  = handleError <$> getAt ([] :: [(String, String)]) ["organization_packs"]

getOrganizationPacks_ByOrganizationsIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks_ByOrganizationsIds params _ByOrganizationsIds = handleError <$> getAt (map qp params ++ map qp [ByOrganizationsIds _ByOrganizationsIds]) ["organization_packs"]

getOrganizationPacks_ByOrganizationsIds' :: [Int64] -> ApiEff (Either ApiError OrganizationPackResponses)
getOrganizationPacks_ByOrganizationsIds' _ByOrganizationsIds = handleError <$> getAt [ByOrganizationsIds _ByOrganizationsIds] ["organization_packs"]

getOrganizationPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack params organization_id = handleError <$> getAt params ["organization_pack", show organization_id]

getOrganizationPack' :: Int64 -> ApiEff (Either ApiError OrganizationPackResponse)
getOrganizationPack' organization_id = handleError <$> getAt ([] :: [(String, String)]) ["organization_pack", show organization_id]

getThreadPacks :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks params = handleError <$> getAt params ["thread_packs"]

getThreadPacks' :: ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks'  = handleError <$> getAt ([] :: [(String, String)]) ["thread_packs"]

getThreadPacks_ByThreadsIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByThreadsIds params _ByThreadsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadsIds _ByThreadsIds]) ["thread_packs"]

getThreadPacks_ByThreadsIds' :: [Int64] -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByThreadsIds' _ByThreadsIds = handleError <$> getAt [ByThreadsIds _ByThreadsIds] ["thread_packs"]

getThreadPacks_ByBoardId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByBoardId params _ByBoardId = handleError <$> getAt (map qp params ++ map qp [ByBoardId _ByBoardId]) ["thread_packs"]

getThreadPacks_ByBoardId' :: Int64 -> ApiEff (Either ApiError ThreadPackResponses)
getThreadPacks_ByBoardId' _ByBoardId = handleError <$> getAt [ByBoardId _ByBoardId] ["thread_packs"]

getThreadPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack params thread_id = handleError <$> getAt params ["thread_pack", show thread_id]

getThreadPack' :: Int64 -> ApiEff (Either ApiError ThreadPackResponse)
getThreadPack' thread_id = handleError <$> getAt ([] :: [(String, String)]) ["thread_pack", show thread_id]

getThreadPostPacks :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks params = handleError <$> getAt params ["thread_post_packs"]

getThreadPostPacks' :: ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks'  = handleError <$> getAt ([] :: [(String, String)]) ["thread_post_packs"]

getThreadPostPacks_ByThreadPostsIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadPostsIds params _ByThreadPostsIds = handleError <$> getAt (map qp params ++ map qp [ByThreadPostsIds _ByThreadPostsIds]) ["thread_post_packs"]

getThreadPostPacks_ByThreadPostsIds' :: [Int64] -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadPostsIds' _ByThreadPostsIds = handleError <$> getAt [ByThreadPostsIds _ByThreadPostsIds] ["thread_post_packs"]

getThreadPostPacks_ByThreadId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadId params _ByThreadId = handleError <$> getAt (map qp params ++ map qp [ByThreadId _ByThreadId]) ["thread_post_packs"]

getThreadPostPacks_ByThreadId' :: Int64 -> ApiEff (Either ApiError ThreadPostPackResponses)
getThreadPostPacks_ByThreadId' _ByThreadId = handleError <$> getAt [ByThreadId _ByThreadId] ["thread_post_packs"]

getThreadPostPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError ThreadPostPackResponse)
getThreadPostPack params thread_post_id = handleError <$> getAt params ["thread_post_pack", show thread_post_id]

getThreadPostPack' :: Int64 -> ApiEff (Either ApiError ThreadPostPackResponse)
getThreadPostPack' thread_post_id = handleError <$> getAt ([] :: [(String, String)]) ["thread_post_pack", show thread_post_id]

getUserPacks :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError UserPackResponses)
getUserPacks params = handleError <$> getAt params ["user_packs"]

getUserPacks' :: ApiEff (Either ApiError UserPackResponses)
getUserPacks'  = handleError <$> getAt ([] :: [(String, String)]) ["user_packs"]

getUserPacks_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError UserPackResponses)
getUserPacks_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_packs"]

getUserPacks_ByUsersIds' :: [Int64] -> ApiEff (Either ApiError UserPackResponses)
getUserPacks_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_packs"]

getUserPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError UserPackResponse)
getUserPack params user_id = handleError <$> getAt params ["user_pack", show user_id]

getUserPack' :: Int64 -> ApiEff (Either ApiError UserPackResponse)
getUserPack' user_id = handleError <$> getAt ([] :: [(String, String)]) ["user_pack", show user_id]

getUserSanitizedPacks :: forall qp. QueryParam qp => [qp] -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks params = handleError <$> getAt params ["user_sanitized_packs"]

getUserSanitizedPacks' :: ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks'  = handleError <$> getAt ([] :: [(String, String)]) ["user_sanitized_packs"]

getUserSanitizedPacks_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params ++ map qp [ByUsersIds _ByUsersIds]) ["user_sanitized_packs"]

getUserSanitizedPacks_ByUsersIds' :: [Int64] -> ApiEff (Either ApiError UserSanitizedPackResponses)
getUserSanitizedPacks_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_sanitized_packs"]

getUserSanitizedPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack params user_id = handleError <$> getAt params ["user_sanitized_pack", show user_id]

getUserSanitizedPack' :: Int64 -> ApiEff (Either ApiError UserSanitizedPackResponse)
getUserSanitizedPack' user_id = handleError <$> getAt ([] :: [(String, String)]) ["user_sanitized_pack", show user_id]

-- footer