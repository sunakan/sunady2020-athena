.PHONY: init-all
init-all:
	make init-development
	make init-staging
	make init-production
.PHONY: init-development
init-development:
	cd workload/development/0-dummy-log-bucket && terraform init # -upgrade
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
.PHONY: apply-staging
apply-staging:
.PHONY: apply-production
apply-production:
