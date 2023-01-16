create-role:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 --region us-east-1 iam create-role --role-name lambda-role --assume-role-policy-document file://lambda/lambda-role.json
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 iam list-roles


	@echo "Role lambda-role created."

delete-role:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566  --region us-east-1 iam delete-role --role-name lambda-role

	@echo "Role lambda-role deleted."

list-role:
	aws --endpoint-url=${LOCALSTACK_ENDPOINT}:4566 --region us-east-1 iam list-roles

	@echo "Role lambda-role listed."