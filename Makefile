.PHONY: deploy delete

deploy:
	serverless create_domain
	serverless deploy

delete:
	serverless delete_domain
	serverless remove