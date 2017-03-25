{-# LANGUAGE BangPatterns         #-}
{-# LANGUAGE DeriveGeneric        #-}
{-# LANGUAGE DeriveAnyClass       #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE RecordWildCards      #-}
{-# LANGUAGE ExplicitForAll       #-}
{-# LANGUAGE RankNTypes           #-}
{-# LANGUAGE ScopedTypeVariables  #-}

module LN.Api where




import Data.Int                   (Int64)
import Data.Monoid                ((<>))
import Data.Text                  (Text)
import qualified Data.Text        as T (pack)
import Haskell.Api.Helpers.Shared (ApiEff, ApiError, QueryParam, qp)
import Haskell.Api.Helpers        (SpecificApiOptions, handleError, getAt, putAt, postAt, deleteAt)
import Data.Default               (Default, def)
import Prelude


import LN.T

getApis :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ApiResponses)
getApis params = handleError <$> getAt params ["apis"]

getApis' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ApiResponses)
getApis'  = handleError <$> getAt ([] :: [(Text, Text)]) ["apis"]

postApi :: forall qp. QueryParam qp => [qp] -> ApiRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ApiResponse)
postApi params api_request = handleError <$> postAt params ["api"] api_request

postApi' :: ApiRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ApiResponse)
postApi' api_request = handleError <$> postAt ([] :: [(Text, Text)]) ["api"] api_request

getApi :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ApiResponse)
getApi params api_id = handleError <$> getAt params ["api", T.pack $ show api_id]

getApi' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ApiResponse)
getApi' api_id = handleError <$> getAt ([] :: [(Text, Text)]) ["api", T.pack $ show api_id]

putApi :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ApiResponse)
putApi params api_id api_request = handleError <$> putAt params ["api", T.pack $ show api_id] api_request

putApi' :: Int64 -> ApiRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ApiResponse)
putApi' api_id api_request = handleError <$> putAt ([] :: [(Text, Text)]) ["api", T.pack $ show api_id] api_request

deleteApi :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteApi params api_id = handleError <$> deleteAt params ["api", T.pack $ show api_id]

deleteApi' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteApi' api_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["api", T.pack $ show api_id]

getUsersCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getUsersCount params = handleError <$> getAt params ["users_count"]

getUsersCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getUsersCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["users_count"]

getResourcesCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getResourcesCount params = handleError <$> getAt params ["resources_count"]

getResourcesCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getResourcesCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["resources_count"]

getLeuronsCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getLeuronsCount params = handleError <$> getAt params ["leurons_count"]

getLeuronsCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getLeuronsCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["leurons_count"]

getLeurons :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponses)
getLeurons params = handleError <$> getAt params ["leurons"]

getLeurons' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponses)
getLeurons'  = handleError <$> getAt ([] :: [(Text, Text)]) ["leurons"]

postLeuron_ByResourceId :: forall qp. QueryParam qp => [qp] -> Int64 -> LeuronRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
postLeuron_ByResourceId params _ByResourceId leuron_request = handleError <$> postAt (map qp params <> map qp [ByResourceId _ByResourceId]) ["leuron"] leuron_request

postLeuron_ByResourceId' :: Int64 -> LeuronRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
postLeuron_ByResourceId' _ByResourceId leuron_request = handleError <$> postAt [ByResourceId _ByResourceId] ["leuron"] leuron_request

getLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
getLeuron params leuron_id = handleError <$> getAt params ["leuron", T.pack $ show leuron_id]

getLeuron' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
getLeuron' leuron_id = handleError <$> getAt ([] :: [(Text, Text)]) ["leuron", T.pack $ show leuron_id]

putLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> LeuronRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
putLeuron params leuron_id leuron_request = handleError <$> putAt params ["leuron", T.pack $ show leuron_id] leuron_request

putLeuron' :: Int64 -> LeuronRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
putLeuron' leuron_id leuron_request = handleError <$> putAt ([] :: [(Text, Text)]) ["leuron", T.pack $ show leuron_id] leuron_request

deleteLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteLeuron params leuron_id = handleError <$> deleteAt params ["leuron", T.pack $ show leuron_id]

deleteLeuron' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteLeuron' leuron_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["leuron", T.pack $ show leuron_id]

getMe :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponse)
getMe params = handleError <$> getAt params ["me"]

getMe' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponse)
getMe'  = handleError <$> getAt ([] :: [(Text, Text)]) ["me"]

getMePack :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserPackResponse)
getMePack params = handleError <$> getAt params ["me_pack"]

getMePack' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserPackResponse)
getMePack'  = handleError <$> getAt ([] :: [(Text, Text)]) ["me_pack"]

getResources :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponses)
getResources params = handleError <$> getAt params ["resources"]

getResources' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponses)
getResources'  = handleError <$> getAt ([] :: [(Text, Text)]) ["resources"]

postResource :: forall qp. QueryParam qp => [qp] -> ResourceRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
postResource params resource_request = handleError <$> postAt params ["resource"] resource_request

postResource' :: ResourceRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
postResource' resource_request = handleError <$> postAt ([] :: [(Text, Text)]) ["resource"] resource_request

getResource :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
getResource params resource_id = handleError <$> getAt params ["resource", T.pack $ show resource_id]

getResource' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
getResource' resource_id = handleError <$> getAt ([] :: [(Text, Text)]) ["resource", T.pack $ show resource_id]

putResource :: forall qp. QueryParam qp => [qp] -> Int64 -> ResourceRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
putResource params resource_id resource_request = handleError <$> putAt params ["resource", T.pack $ show resource_id] resource_request

putResource' :: Int64 -> ResourceRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
putResource' resource_id resource_request = handleError <$> putAt ([] :: [(Text, Text)]) ["resource", T.pack $ show resource_id] resource_request

deleteResource :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteResource params resource_id = handleError <$> deleteAt params ["resource", T.pack $ show resource_id]

deleteResource' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteResource' resource_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["resource", T.pack $ show resource_id]

getResourceStats_ByResourcesIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceStatResponses)
getResourceStats_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params <> map qp [ByResourcesIds _ByResourcesIds]) ["resource_stats"]

getResourceStats_ByResourcesIds' :: [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceStatResponses)
getResourceStats_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_stats"]

getResourceStat :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceStatResponse)
getResourceStat params resource_id = handleError <$> getAt params ["resource_stat", T.pack $ show resource_id]

getResourceStat' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceStatResponse)
getResourceStat' resource_id = handleError <$> getAt ([] :: [(Text, Text)]) ["resource_stat", T.pack $ show resource_id]

getUsers :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponses)
getUsers params = handleError <$> getAt params ["users"]

getUsers' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponses)
getUsers'  = handleError <$> getAt ([] :: [(Text, Text)]) ["users"]

getUsers_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponses)
getUsers_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params <> map qp [ByUsersIds _ByUsersIds]) ["users"]

getUsers_ByUsersIds' :: [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponses)
getUsers_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["users"]

getUsers_ByUsersNames :: forall qp. QueryParam qp => [qp] -> [Text] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponses)
getUsers_ByUsersNames params _ByUsersNames = handleError <$> getAt (map qp params <> map qp [ByUsersNames _ByUsersNames]) ["users"]

getUsers_ByUsersNames' :: [Text] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponses)
getUsers_ByUsersNames' _ByUsersNames = handleError <$> getAt [ByUsersNames _ByUsersNames] ["users"]

postUser :: forall qp. QueryParam qp => [qp] -> UserRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponse)
postUser params user_request = handleError <$> postAt params ["user"] user_request

postUser' :: UserRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponse)
postUser' user_request = handleError <$> postAt ([] :: [(Text, Text)]) ["user"] user_request

getUser :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponse)
getUser params user_id = handleError <$> getAt params ["user", T.pack $ show user_id]

getUser' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponse)
getUser' user_id = handleError <$> getAt ([] :: [(Text, Text)]) ["user", T.pack $ show user_id]

putUser :: forall qp. QueryParam qp => [qp] -> Int64 -> UserRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponse)
putUser params user_id user_request = handleError <$> putAt params ["user", T.pack $ show user_id] user_request

putUser' :: Int64 -> UserRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserResponse)
putUser' user_id user_request = handleError <$> putAt ([] :: [(Text, Text)]) ["user", T.pack $ show user_id] user_request

deleteUser :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteUser params user_id = handleError <$> deleteAt params ["user", T.pack $ show user_id]

deleteUser' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteUser' user_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["user", T.pack $ show user_id]

getUserProfiles :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ProfileResponses)
getUserProfiles params = handleError <$> getAt params ["user_profiles"]

getUserProfiles' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ProfileResponses)
getUserProfiles'  = handleError <$> getAt ([] :: [(Text, Text)]) ["user_profiles"]

getUserProfiles_ByUserId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ProfileResponses)
getUserProfiles_ByUserId params _ByUserId = handleError <$> getAt (map qp params <> map qp [ByUserId _ByUserId]) ["user_profiles"]

getUserProfiles_ByUserId' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ProfileResponses)
getUserProfiles_ByUserId' _ByUserId = handleError <$> getAt [ByUserId _ByUserId] ["user_profiles"]

getUserProfiles_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ProfileResponses)
getUserProfiles_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params <> map qp [ByUsersIds _ByUsersIds]) ["user_profiles"]

getUserProfiles_ByUsersIds' :: [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ProfileResponses)
getUserProfiles_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_profiles"]

getUserProfile :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ProfileResponse)
getUserProfile params profile_id = handleError <$> getAt params ["user_profile", T.pack $ show profile_id]

getUserProfile' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ProfileResponse)
getUserProfile' profile_id = handleError <$> getAt ([] :: [(Text, Text)]) ["user_profile", T.pack $ show profile_id]

putUserProfile :: forall qp. QueryParam qp => [qp] -> Int64 -> ProfileRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ProfileResponse)
putUserProfile params profile_id profile_request = handleError <$> putAt params ["user_profile", T.pack $ show profile_id] profile_request

putUserProfile' :: Int64 -> ProfileRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ProfileResponse)
putUserProfile' profile_id profile_request = handleError <$> putAt ([] :: [(Text, Text)]) ["user_profile", T.pack $ show profile_id] profile_request

deleteUserProfile :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteUserProfile params profile_id = handleError <$> deleteAt params ["user_profile", T.pack $ show profile_id]

deleteUserProfile' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteUserProfile' profile_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["user_profile", T.pack $ show profile_id]

getUsersSanitized :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedResponses)
getUsersSanitized params = handleError <$> getAt params ["users_sanitized"]

getUsersSanitized' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedResponses)
getUsersSanitized'  = handleError <$> getAt ([] :: [(Text, Text)]) ["users_sanitized"]

getUsersSanitized_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedResponses)
getUsersSanitized_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params <> map qp [ByUsersIds _ByUsersIds]) ["users_sanitized"]

getUsersSanitized_ByUsersIds' :: [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedResponses)
getUsersSanitized_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["users_sanitized"]

getUsersSanitized_ByUsersNames :: forall qp. QueryParam qp => [qp] -> [Text] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedResponses)
getUsersSanitized_ByUsersNames params _ByUsersNames = handleError <$> getAt (map qp params <> map qp [ByUsersNames _ByUsersNames]) ["users_sanitized"]

getUsersSanitized_ByUsersNames' :: [Text] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedResponses)
getUsersSanitized_ByUsersNames' _ByUsersNames = handleError <$> getAt [ByUsersNames _ByUsersNames] ["users_sanitized"]

getUserSanitized :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedResponse)
getUserSanitized params user_id = handleError <$> getAt params ["user_sanitized", T.pack $ show user_id]

getUserSanitized' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedResponse)
getUserSanitized' user_id = handleError <$> getAt ([] :: [(Text, Text)]) ["user_sanitized", T.pack $ show user_id]

getUserSanitizedStats :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedStatResponse)
getUserSanitizedStats params = handleError <$> getAt params ["user_sanitized_stats"]

getUserSanitizedStats' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedStatResponse)
getUserSanitizedStats'  = handleError <$> getAt ([] :: [(Text, Text)]) ["user_sanitized_stats"]

getUserSanitizedStats_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedStatResponse)
getUserSanitizedStats_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params <> map qp [ByUsersIds _ByUsersIds]) ["user_sanitized_stats"]

getUserSanitizedStats_ByUsersIds' :: [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedStatResponse)
getUserSanitizedStats_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_sanitized_stats"]

getUserSanitizedStat :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedStatResponse)
getUserSanitizedStat params user_id = handleError <$> getAt params ["user_sanitized_stat", T.pack $ show user_id]

getUserSanitizedStat' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedStatResponse)
getUserSanitizedStat' user_id = handleError <$> getAt ([] :: [(Text, Text)]) ["user_sanitized_stat", T.pack $ show user_id]

getUserPacks :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserPackResponses)
getUserPacks params = handleError <$> getAt params ["user_packs"]

getUserPacks' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserPackResponses)
getUserPacks'  = handleError <$> getAt ([] :: [(Text, Text)]) ["user_packs"]

getUserPacks_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserPackResponses)
getUserPacks_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params <> map qp [ByUsersIds _ByUsersIds]) ["user_packs"]

getUserPacks_ByUsersIds' :: [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserPackResponses)
getUserPacks_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_packs"]

getUserPacks_ByEmail :: forall qp. QueryParam qp => [qp] -> Text -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserPackResponses)
getUserPacks_ByEmail params _ByEmail = handleError <$> getAt (map qp params <> map qp [ByEmail _ByEmail]) ["user_packs"]

getUserPacks_ByEmail' :: Text -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserPackResponses)
getUserPacks_ByEmail' _ByEmail = handleError <$> getAt [ByEmail _ByEmail] ["user_packs"]

getUserPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserPackResponse)
getUserPack params user_id = handleError <$> getAt params ["user_pack", T.pack $ show user_id]

getUserPack' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserPackResponse)
getUserPack' user_id = handleError <$> getAt ([] :: [(Text, Text)]) ["user_pack", T.pack $ show user_id]

getUserSanitizedPacks :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedPackResponses)
getUserSanitizedPacks params = handleError <$> getAt params ["user_sanitized_packs"]

getUserSanitizedPacks' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedPackResponses)
getUserSanitizedPacks'  = handleError <$> getAt ([] :: [(Text, Text)]) ["user_sanitized_packs"]

getUserSanitizedPacks_ByUsersIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedPackResponses)
getUserSanitizedPacks_ByUsersIds params _ByUsersIds = handleError <$> getAt (map qp params <> map qp [ByUsersIds _ByUsersIds]) ["user_sanitized_packs"]

getUserSanitizedPacks_ByUsersIds' :: [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedPackResponses)
getUserSanitizedPacks_ByUsersIds' _ByUsersIds = handleError <$> getAt [ByUsersIds _ByUsersIds] ["user_sanitized_packs"]

getUserSanitizedPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedPackResponse)
getUserSanitizedPack params user_id = handleError <$> getAt params ["user_sanitized_pack", T.pack $ show user_id]

getUserSanitizedPack' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) UserSanitizedPackResponse)
getUserSanitizedPack' user_id = handleError <$> getAt ([] :: [(Text, Text)]) ["user_sanitized_pack", T.pack $ show user_id]

getResourcePacks :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourcePackResponses)
getResourcePacks params = handleError <$> getAt params ["resource_packs"]

getResourcePacks' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourcePackResponses)
getResourcePacks'  = handleError <$> getAt ([] :: [(Text, Text)]) ["resource_packs"]

getResourcePacks_ByResourcesIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourcePackResponses)
getResourcePacks_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params <> map qp [ByResourcesIds _ByResourcesIds]) ["resource_packs"]

getResourcePacks_ByResourcesIds' :: [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourcePackResponses)
getResourcePacks_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_packs"]

getResourcePack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourcePackResponse)
getResourcePack params resource_id = handleError <$> getAt params ["resource_pack", T.pack $ show resource_id]

getResourcePack' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourcePackResponse)
getResourcePack' resource_id = handleError <$> getAt ([] :: [(Text, Text)]) ["resource_pack", T.pack $ show resource_id]

getLeuronPacks :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponses)
getLeuronPacks params = handleError <$> getAt params ["leuron_packs"]

getLeuronPacks' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponses)
getLeuronPacks'  = handleError <$> getAt ([] :: [(Text, Text)]) ["leuron_packs"]

getLeuronPacks_ByLeuronsIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponses)
getLeuronPacks_ByLeuronsIds params _ByLeuronsIds = handleError <$> getAt (map qp params <> map qp [ByLeuronsIds _ByLeuronsIds]) ["leuron_packs"]

getLeuronPacks_ByLeuronsIds' :: [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponses)
getLeuronPacks_ByLeuronsIds' _ByLeuronsIds = handleError <$> getAt [ByLeuronsIds _ByLeuronsIds] ["leuron_packs"]

getLeuronPacks_ByResourceId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponses)
getLeuronPacks_ByResourceId params _ByResourceId = handleError <$> getAt (map qp params <> map qp [ByResourceId _ByResourceId]) ["leuron_packs"]

getLeuronPacks_ByResourceId' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponses)
getLeuronPacks_ByResourceId' _ByResourceId = handleError <$> getAt [ByResourceId _ByResourceId] ["leuron_packs"]

getLeuronPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponse)
getLeuronPack params leuron_id = handleError <$> getAt params ["leuron_pack", T.pack $ show leuron_id]

getLeuronPack' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponse)
getLeuronPack' leuron_id = handleError <$> getAt ([] :: [(Text, Text)]) ["leuron_pack", T.pack $ show leuron_id]

-- footer