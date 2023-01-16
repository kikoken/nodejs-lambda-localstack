LAMBDA_ETL = neo4j-etl
LAMBDA_MIGRATIONS = neo4j-migrations
LAMBDA_RELATIONS = neo4j-relations

create-lambdas: zip create-lambda-etl create-lambda-migrations create-lambda-relations

create-lambda-etl:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 lambda create-function \
	--function-name ${LAMBDA_ETL} \
	--runtime nodejs18.x \
	--memory-size 256 \
	--timeout 60 \
	--region us-east-1 \
	--role arn:aws:iam::123456789012:role/lambda-role \
	--handler index.handler \
	--zip-file fileb://archive.zip

	@echo "Lambda ${LAMBDA_ETL} created."

create-lambda-migrations:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 lambda create-function \
	--function-name ${LAMBDA_MIGRATIONS} \
	--runtime nodejs18.x \
	--memory-size 256 \
	--timeout 60 \
	--region us-east-1 \
	--role arn:aws:iam::123456789012:role/lambda-role \
	--handler index.handler \
	--zip-file fileb://archive.zip

	@echo "Lambda ${LAMBDA_MIGRATIONS} created."

create-lambda-RELATIONS:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 lambda create-function \
	--function-name ${LAMBDA_RELATIONS} \
	--runtime nodejs18.x \
	--memory-size 256 \
	--timeout 60 \
	--region us-east-1 \
	--role arn:aws:iam::123456789012:role/lambda-role \
	--handler index.handler \
	--zip-file fileb://archive.zip

	@echo "Lambda ${LAMBDA_RELATIONS} created."

delete-lambdas:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566  --region us-east-1 lambda delete-function --function-name ${LAMBDA_ETL}
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566  --region us-east-1 lambda delete-function --function-name ${LAMBDA_MIGRATIONS}
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566  --region us-east-1 lambda delete-function --function-name ${LAMBDA_RELATIONS}

	@echo "Lambdas deleted."

list-lambda:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566  --region us-east-1 lambda list-functions

	@echo "Lambda neo4j-etl listed."

zip:
	npx lambda-build archive -e lambda/index.js

	@echo "Zip created."