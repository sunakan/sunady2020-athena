.PHONY: init-all
init-all:
	make init-development
	make init-staging
	make init-production
.PHONY: init-development
init-development:
	cd workload/development/0-dummy-log-bucket && terraform init     # -upgrade
	cd workload/development/1-athena-result-bucket && terraform init # -upgrade
	cd workload/development/2-athena-workgroup && terraform init     # -upgrade
	cd workload/development/3-athena-database && terraform init      # -upgrade
	cd workload/development/4-athena-queries && terraform init       # -upgrade
	cd workload/development/5-athena-iam && terraform init           # -upgrade
.PHONY: init-staging
init-staging:
.PHONY: init-production
init-production:

.PHONY: apply-all
apply-all:
	make apply-development
	make apply-staging
	make apply-production
.PHONY: apply-development
apply-development:
	cd workload/development/0-dummy-log-bucket && terraform apply
	cd workload/development/1-athena-result-bucket && terraform apply
	cd workload/development/2-athena-workgroup && terraform apply
	cd workload/development/3-athena-database && terraform apply
	cd workload/development/4-athena-queries && terraform apply
	cd workload/development/5-athena-iam && terraform apply
.PHONY: apply-staging
apply-staging:
.PHONY: apply-production
apply-production:

.PHONY: destroy-all
apply-all:
	make destroy-development
	make destroy-staging
	make destroy-production
.PHONY: destroy-development
destroy-development:
	cd workload/development/5-athena-iam && terraform destroy
	cd workload/development/4-athena-queries && terraform destroy
	cd workload/development/3-athena-database && terraform destroy
	cd workload/development/2-athena-workgroup && terraform destroy
	cd workload/development/1-athena-result-bucket && terraform destroy
	cd workload/development/0-dummy-log-bucket && terraform destroy
