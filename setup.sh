#!/bin/bash 

serverless plugin install -n serverless-domain-manager
serverless plugin install -n  serverless-add-api-key


# aws dynamodb create-table \
#     --table-name TradeResults \
#     --attribute-definitions \
#     --billing-mode PAY_PER_REQUEST \
#     --region eu-west-1 \
#     --attribute-definitions \
#         AttributeName=symbol,AttributeType=S \
#         AttributeName=dateAdded,AttributeType=S \
#         AttributeName=indicator,AttributeType=S \
#         AttributeName=indicatorSettings,AttributeType=S \
#         AttributeName=netProfit,AttributeType=N \
#         AttributeName=winningTrades,AttributeType=N \
#         AttributeName=losingTrades,AttributeType=N \
#         AttributeName=maxDrawdown,AttributeType=N \
#         AttributeName=absoluteDrawdown,AttributeType=N \
#         AttributeName=consecutiveWins,AttributeType=N \
#         AttributeName=consecutiveLoses,AttributeType=N \
#     --key-schema \
#         AttributeName=symbol,KeyType=HASH \
#         AttributeName=indicator,KeyType=RANGE 



aws dynamodb create-table \
    --table-name TradeResults \
    --attribute-definitions \
    --billing-mode PAY_PER_REQUEST \
    --region eu-west-1 \
    --attribute-definitions \
        AttributeName=symbol,AttributeType=S \
        AttributeName=indicator,AttributeType=S \
    --key-schema \
        AttributeName=symbol,KeyType=HASH \
        AttributeName=indicator,KeyType=RANGE 
