event-migrations:
	aws --endpoint-url${LOCALSTACK_ENDPOINT}:4566 lambda create-event-source-mapping \
	--function-name ${LAMBDA_MIGRATIONS} \
	--event-source arn:aws:s3:::${BUCKET_NAME_ETL}/data \
	--batch-size 1 \
	--enabled \
	--event s3:ObjectCreated:*

	@echo "Event ${LAMBDA_MIGRATIONS} created."

event-relations:
	aws --endpoint-url${LOCALSTACK_ENDPOINT}:4566 lambda create-event-source-mapping \
	--function-name ${LAMBDA_RELATIONS} \
	--event-source arn:aws:s3:::${BUCKET_NAME_ETL}/relations \
	--batch-size 1 \
	--enabled \
	--event s3:ObjectCreated:*

	@echo "Event ${LAMBDA_RELATIONS} created."
