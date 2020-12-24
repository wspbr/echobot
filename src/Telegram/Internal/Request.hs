{-# LANGUAGE DeriveGeneric   #-}
{-# LANGUAGE TemplateHaskell #-}
module Telegram.Internal.Request where

import           API.Derive
import           Data.Text               (Text)
import           GHC.Generics
import           Telegram.Internal.Types

-- * Request bodies

-- | Telegram response.
data Response a = Response
  { responseOk          :: Bool
  , responseDescription :: Maybe Text
  , responseResult      :: a
  , responseErrorCode   :: Maybe Int
  } deriving (Show, Generic)

-- | Request body for 'sendMessage'.
data SendMessageBody = SendMessageBody
  { sendMessageChatId :: ChatId
  , sendMessageText   :: Text
  } deriving (Generic)

-- | Request body for 'sendSticker'.
data SendStickerBody = SendStickerBody
  { sendStickerChatId  :: ChatId
  , sendStickerSticker :: FileId
  } deriving (Generic)

data GetUpdatesBody = GetUpdatesBody
    { getUpdatesOffset     :: Maybe UpdateId
    , getUpdatesUpdateType :: Maybe UpdateType
    , getUpdatesTimeout    :: Maybe Int
    } deriving (Generic)

-- | Types of updates allowed to receive.
data UpdateType =
  UpdateMessage
  deriving (Generic)

deriveJSON' ''Response
deriveJSON' ''SendMessageBody
deriveJSON' ''SendStickerBody
deriveJSON' ''UpdateType
deriveJSON' ''GetUpdatesBody