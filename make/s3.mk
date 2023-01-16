create-bucket:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 s3 mb s3://${BUCKET_NAME_DB}
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 s3 mb s3://${BUCKET_NAME_ETL}
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 s3 ls

	@echo "Bucket my-localstack-bucket created."

delete-bucket:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 s3 rb s3://${BUCKET_NAME_DB} --force
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 s3 rb s3://${BUCKET_NAME_ETL} --force
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 s3 ls

	@echo "Bucket my-localstack-bucket deleted."

list-bucket:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 s3 ls

	@echo "Bucket my-localstack-bucket listed."