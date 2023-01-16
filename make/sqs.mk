create-sqs:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 --region us-east-1 sqs create-queue --queue-name neo4j-relations

	@echo "SQS neo4j-relations created."