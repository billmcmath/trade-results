.PHONY: deploy delete

deploy:
	serverless create_domain
	serverless deploy

delete:
	serverless remove
	serverless delete_domain