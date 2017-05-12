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

getResourcesCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getResourcesCount params = handleError <$> getAt params ["resources_count"]

getResourcesCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getResourcesCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["resources_count"]

getLeuronsCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getLeuronsCount params = handleError <$> getAt params ["leurons_count"]

getLeuronsCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getLeuronsCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["leurons_count"]

getLeuronNodesCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getLeuronNodesCount params = handleError <$> getAt params ["leuron_nodes_count"]

getLeuronNodesCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getLeuronNodesCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["leuron_nodes_count"]

getLeuronTrainingCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getLeuronTrainingCount params = handleError <$> getAt params ["leuron_training_count"]

getLeuronTrainingCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getLeuronTrainingCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["leuron_training_count"]

getBucketsCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getBucketsCount params = handleError <$> getAt params ["buckets_count"]

getBucketsCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getBucketsCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["buckets_count"]

getBucketRoundsCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getBucketRoundsCount params = handleError <$> getAt params ["bucket_rounds_count"]

getBucketRoundsCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getBucketRoundsCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_rounds_count"]

getBucketNodesCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getBucketNodesCount params = handleError <$> getAt params ["bucket_nodes_count"]

getBucketNodesCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getBucketNodesCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_nodes_count"]

getUsersCount :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getUsersCount params = handleError <$> getAt params ["users_count"]

getUsersCount' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponses)
getUsersCount'  = handleError <$> getAt ([] :: [(Text, Text)]) ["users_count"]

getBucketRoundLeuronsCount :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponse)
getBucketRoundLeuronsCount params bucket_round_id = handleError <$> getAt params ["bucket_round_leurons_count", T.pack $ show bucket_round_id]

getBucketRoundLeuronsCount' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) CountResponse)
getBucketRoundLeuronsCount' bucket_round_id = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_round_leurons_count", T.pack $ show bucket_round_id]

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

getLeurons :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponses)
getLeurons params = handleError <$> getAt params ["leurons"]

getLeurons' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponses)
getLeurons'  = handleError <$> getAt ([] :: [(Text, Text)]) ["leurons"]

postLeuron_ByResourceId :: forall qp. QueryParam qp => [qp] -> Int64 -> LeuronRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
postLeuron_ByResourceId params _ByResourceId leuron_request = handleError <$> postAt (map qp params <> map qp [ByResourceId _ByResourceId]) ["leurons"] leuron_request

postLeuron_ByResourceId' :: Int64 -> LeuronRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
postLeuron_ByResourceId' _ByResourceId leuron_request = handleError <$> postAt [ByResourceId _ByResourceId] ["leurons"] leuron_request

postLeuron_ByBucketRoundId :: forall qp. QueryParam qp => [qp] -> Int64 -> LeuronRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
postLeuron_ByBucketRoundId params _ByBucketRoundId leuron_request = handleError <$> postAt (map qp params <> map qp [ByBucketRoundId _ByBucketRoundId]) ["leurons"] leuron_request

postLeuron_ByBucketRoundId' :: Int64 -> LeuronRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
postLeuron_ByBucketRoundId' _ByBucketRoundId leuron_request = handleError <$> postAt [ByBucketRoundId _ByBucketRoundId] ["leurons"] leuron_request

getLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
getLeuron params leuron_id = handleError <$> getAt params ["leurons", T.pack $ show leuron_id]

getLeuron' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
getLeuron' leuron_id = handleError <$> getAt ([] :: [(Text, Text)]) ["leurons", T.pack $ show leuron_id]

putLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> LeuronRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
putLeuron params leuron_id leuron_request = handleError <$> putAt params ["leurons", T.pack $ show leuron_id] leuron_request

putLeuron' :: Int64 -> LeuronRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronResponse)
putLeuron' leuron_id leuron_request = handleError <$> putAt ([] :: [(Text, Text)]) ["leurons", T.pack $ show leuron_id] leuron_request

deleteLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteLeuron params leuron_id = handleError <$> deleteAt params ["leurons", T.pack $ show leuron_id]

deleteLeuron' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteLeuron' leuron_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["leurons", T.pack $ show leuron_id]

getLeuronNodes :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronNodeResponses)
getLeuronNodes params = handleError <$> getAt params ["leuron_nodes"]

getLeuronNodes' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronNodeResponses)
getLeuronNodes'  = handleError <$> getAt ([] :: [(Text, Text)]) ["leuron_nodes"]

getLeuronNode :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronNodeResponse)
getLeuronNode params leuron_node_id = handleError <$> getAt params ["leuron_nodes", T.pack $ show leuron_node_id]

getLeuronNode' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronNodeResponse)
getLeuronNode' leuron_node_id = handleError <$> getAt ([] :: [(Text, Text)]) ["leuron_nodes", T.pack $ show leuron_node_id]

putLeuronNode :: forall qp. QueryParam qp => [qp] -> Int64 -> LeuronNodeRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronNodeResponse)
putLeuronNode params leuron_node_id leuron_node_request = handleError <$> putAt params ["leuron_nodes", T.pack $ show leuron_node_id] leuron_node_request

putLeuronNode' :: Int64 -> LeuronNodeRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronNodeResponse)
putLeuronNode' leuron_node_id leuron_node_request = handleError <$> putAt ([] :: [(Text, Text)]) ["leuron_nodes", T.pack $ show leuron_node_id] leuron_node_request

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
postResource params resource_request = handleError <$> postAt params ["resources"] resource_request

postResource' :: ResourceRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
postResource' resource_request = handleError <$> postAt ([] :: [(Text, Text)]) ["resources"] resource_request

getResource :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
getResource params resource_id = handleError <$> getAt params ["resources", T.pack $ show resource_id]

getResource' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
getResource' resource_id = handleError <$> getAt ([] :: [(Text, Text)]) ["resources", T.pack $ show resource_id]

putResource :: forall qp. QueryParam qp => [qp] -> Int64 -> ResourceRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
putResource params resource_id resource_request = handleError <$> putAt params ["resources", T.pack $ show resource_id] resource_request

putResource' :: Int64 -> ResourceRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceResponse)
putResource' resource_id resource_request = handleError <$> putAt ([] :: [(Text, Text)]) ["resources", T.pack $ show resource_id] resource_request

deleteResource :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteResource params resource_id = handleError <$> deleteAt params ["resources", T.pack $ show resource_id]

deleteResource' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteResource' resource_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["resources", T.pack $ show resource_id]

getResourceStats_ByResourcesIds :: forall qp. QueryParam qp => [qp] -> [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceStatResponses)
getResourceStats_ByResourcesIds params _ByResourcesIds = handleError <$> getAt (map qp params <> map qp [ByResourcesIds _ByResourcesIds]) ["resource_stats"]

getResourceStats_ByResourcesIds' :: [Int64] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceStatResponses)
getResourceStats_ByResourcesIds' _ByResourcesIds = handleError <$> getAt [ByResourcesIds _ByResourcesIds] ["resource_stats"]

getResourceStat :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceStatResponse)
getResourceStat params resource_id = handleError <$> getAt params ["resource_stat", T.pack $ show resource_id]

getResourceStat' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ResourceStatResponse)
getResourceStat' resource_id = handleError <$> getAt ([] :: [(Text, Text)]) ["resource_stat", T.pack $ show resource_id]

getBuckets :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketResponses)
getBuckets params = handleError <$> getAt params ["buckets"]

getBuckets' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketResponses)
getBuckets'  = handleError <$> getAt ([] :: [(Text, Text)]) ["buckets"]

postBucket :: forall qp. QueryParam qp => [qp] -> BucketRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketResponse)
postBucket params bucket_request = handleError <$> postAt params ["buckets"] bucket_request

postBucket' :: BucketRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketResponse)
postBucket' bucket_request = handleError <$> postAt ([] :: [(Text, Text)]) ["buckets"] bucket_request

getBucket :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketResponse)
getBucket params bucket_id = handleError <$> getAt params ["buckets", T.pack $ show bucket_id]

getBucket' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketResponse)
getBucket' bucket_id = handleError <$> getAt ([] :: [(Text, Text)]) ["buckets", T.pack $ show bucket_id]

putBucket :: forall qp. QueryParam qp => [qp] -> Int64 -> BucketRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketResponse)
putBucket params bucket_id bucket_request = handleError <$> putAt params ["buckets", T.pack $ show bucket_id] bucket_request

putBucket' :: Int64 -> BucketRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketResponse)
putBucket' bucket_id bucket_request = handleError <$> putAt ([] :: [(Text, Text)]) ["buckets", T.pack $ show bucket_id] bucket_request

deleteBucket :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteBucket params bucket_id = handleError <$> deleteAt params ["buckets", T.pack $ show bucket_id]

deleteBucket' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteBucket' bucket_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["buckets", T.pack $ show bucket_id]

getBucketRounds :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketRoundResponses)
getBucketRounds params = handleError <$> getAt params ["bucket_rounds"]

getBucketRounds' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketRoundResponses)
getBucketRounds'  = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_rounds"]

postBucketRound :: forall qp. QueryParam qp => [qp] -> BucketRoundRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketRoundResponse)
postBucketRound params bucket_round_request = handleError <$> postAt params ["bucket_rounds"] bucket_round_request

postBucketRound' :: BucketRoundRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketRoundResponse)
postBucketRound' bucket_round_request = handleError <$> postAt ([] :: [(Text, Text)]) ["bucket_rounds"] bucket_round_request

getBucketRound :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketRoundResponse)
getBucketRound params bucket_round_id = handleError <$> getAt params ["bucket_rounds", T.pack $ show bucket_round_id]

getBucketRound' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketRoundResponse)
getBucketRound' bucket_round_id = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_rounds", T.pack $ show bucket_round_id]

putBucketRound :: forall qp. QueryParam qp => [qp] -> Int64 -> BucketRoundRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketRoundResponse)
putBucketRound params bucket_round_id bucket_round_request = handleError <$> putAt params ["bucket_rounds", T.pack $ show bucket_round_id] bucket_round_request

putBucketRound' :: Int64 -> BucketRoundRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketRoundResponse)
putBucketRound' bucket_round_id bucket_round_request = handleError <$> putAt ([] :: [(Text, Text)]) ["bucket_rounds", T.pack $ show bucket_round_id] bucket_round_request

deleteBucketRound :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteBucketRound params bucket_round_id = handleError <$> deleteAt params ["bucket_rounds", T.pack $ show bucket_round_id]

deleteBucketRound' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteBucketRound' bucket_round_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["bucket_rounds", T.pack $ show bucket_round_id]

postBucketRoundLeuronOp :: forall qp. QueryParam qp => [qp] -> Int64 -> Int64 -> Text -> () -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
postBucketRoundLeuronOp params bucket_round_id leuron_id op () = handleError <$> postAt params ["bucket_round_leuron_op", T.pack $ show bucket_round_id, T.pack $ show leuron_id, op] ()

postBucketRoundLeuronOp' :: Int64 -> Int64 -> Text -> () -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
postBucketRoundLeuronOp' bucket_round_id leuron_id op () = handleError <$> postAt ([] :: [(Text, Text)]) ["bucket_round_leuron_op", T.pack $ show bucket_round_id, T.pack $ show leuron_id, op] ()

getBucketNodes :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketNodeResponses)
getBucketNodes params = handleError <$> getAt params ["bucket_nodes"]

getBucketNodes' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketNodeResponses)
getBucketNodes'  = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_nodes"]

getBucketNode :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketNodeResponse)
getBucketNode params bucket_node_id = handleError <$> getAt params ["bucket_nodes", T.pack $ show bucket_node_id]

getBucketNode' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketNodeResponse)
getBucketNode' bucket_node_id = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_nodes", T.pack $ show bucket_node_id]

putBucketNode :: forall qp. QueryParam qp => [qp] -> Int64 -> BucketNodeRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketNodeResponse)
putBucketNode params bucket_node_id bucket_node_request = handleError <$> putAt params ["bucket_nodes", T.pack $ show bucket_node_id] bucket_node_request

putBucketNode' :: Int64 -> BucketNodeRequest -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketNodeResponse)
putBucketNode' bucket_node_id bucket_node_request = handleError <$> putAt ([] :: [(Text, Text)]) ["bucket_nodes", T.pack $ show bucket_node_id] bucket_node_request

postBucketResource :: forall qp. QueryParam qp => [qp] -> Int64 -> Int64 -> () -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
postBucketResource params bucket_id resource_id () = handleError <$> postAt params ["bucket_resources", T.pack $ show bucket_id, T.pack $ show resource_id] ()

postBucketResource' :: Int64 -> Int64 -> () -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
postBucketResource' bucket_id resource_id () = handleError <$> postAt ([] :: [(Text, Text)]) ["bucket_resources", T.pack $ show bucket_id, T.pack $ show resource_id] ()

deleteBucketResource :: forall qp. QueryParam qp => [qp] -> Int64 -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteBucketResource params bucket_id resource_id = handleError <$> deleteAt params ["bucket_resources", T.pack $ show bucket_id, T.pack $ show resource_id]

deleteBucketResource' :: Int64 -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteBucketResource' bucket_id resource_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["bucket_resources", T.pack $ show bucket_id, T.pack $ show resource_id]

postBucketLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> Int64 -> () -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
postBucketLeuron params bucket_id leuron_id () = handleError <$> postAt params ["bucket_leurons", T.pack $ show bucket_id, T.pack $ show leuron_id] ()

postBucketLeuron' :: Int64 -> Int64 -> () -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
postBucketLeuron' bucket_id leuron_id () = handleError <$> postAt ([] :: [(Text, Text)]) ["bucket_leurons", T.pack $ show bucket_id, T.pack $ show leuron_id] ()

deleteBucketLeuron :: forall qp. QueryParam qp => [qp] -> Int64 -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteBucketLeuron params bucket_id leuron_id = handleError <$> deleteAt params ["bucket_leurons", T.pack $ show bucket_id, T.pack $ show leuron_id]

deleteBucketLeuron' :: Int64 -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) ())
deleteBucketLeuron' bucket_id leuron_id = handleError <$> deleteAt ([] :: [(Text, Text)]) ["bucket_leurons", T.pack $ show bucket_id, T.pack $ show leuron_id]

getBucketResourceIds :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) SimpleIntsResponse)
getBucketResourceIds params bucket_id = handleError <$> getAt params ["bucket_resource_ids", T.pack $ show bucket_id]

getBucketResourceIds' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) SimpleIntsResponse)
getBucketResourceIds' bucket_id = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_resource_ids", T.pack $ show bucket_id]

getBucketLeuronIds :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) SimpleIntsResponse)
getBucketLeuronIds params bucket_id = handleError <$> getAt params ["bucket_leuron_ids", T.pack $ show bucket_id]

getBucketLeuronIds' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) SimpleIntsResponse)
getBucketLeuronIds' bucket_id = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_leuron_ids", T.pack $ show bucket_id]

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

getLeuronPacks_ByBucketRoundId :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponses)
getLeuronPacks_ByBucketRoundId params _ByBucketRoundId = handleError <$> getAt (map qp params <> map qp [ByBucketRoundId _ByBucketRoundId]) ["leuron_packs"]

getLeuronPacks_ByBucketRoundId' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponses)
getLeuronPacks_ByBucketRoundId' _ByBucketRoundId = handleError <$> getAt [ByBucketRoundId _ByBucketRoundId] ["leuron_packs"]

getLeuronPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponse)
getLeuronPack params leuron_id = handleError <$> getAt params ["leuron_pack", T.pack $ show leuron_id]

getLeuronPack' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) LeuronPackResponse)
getLeuronPack' leuron_id = handleError <$> getAt ([] :: [(Text, Text)]) ["leuron_pack", T.pack $ show leuron_id]

getBucketPacks :: forall qp. QueryParam qp => [qp] -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketPackResponses)
getBucketPacks params = handleError <$> getAt params ["bucket_packs"]

getBucketPacks' :: ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketPackResponses)
getBucketPacks'  = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_packs"]

getBucketPack :: forall qp. QueryParam qp => [qp] -> Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketPackResponse)
getBucketPack params bucket_id = handleError <$> getAt params ["bucket_pack", T.pack $ show bucket_id]

getBucketPack' :: Int64 -> ApiEff SpecificApiOptions (Either (ApiError ApplicationError) BucketPackResponse)
getBucketPack' bucket_id = handleError <$> getAt ([] :: [(Text, Text)]) ["bucket_pack", T.pack $ show bucket_id]

-- footer