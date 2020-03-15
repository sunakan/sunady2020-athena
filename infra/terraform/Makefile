.PHONY: init-all
init-all:
	make init-development
	make init-staging
	make init-production
.PHONY: init-development
init-development:
	cd workload/development/archivable && terraform init
.PHONY: init-staging
init-staging:
	cd workload/staging/archivable && terraform init
.PHONY: init-production
init-production:
	cd workload/production/archivable  && terraform init

# For debug
.PHONY: apply-all
apply-all:
	make apply-development
	make apply-staging
	make apply-production
.PHONY: apply-development
apply-development:
	cd workload/development/archivable && terraform apply -var-file ../terraform.tfvars
.PHONY: apply-staging
apply-staging:
	cd workload/staging/archivable && terraform apply -var-file ../terraform.tfvars
.PHONY: apply-production
apply-production:
	cd workload/production/archivable && terraform apply -var-file ../terraform.tfvars