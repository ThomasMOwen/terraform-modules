WORKDIR = $(PWD)

TF = docker run --rm -it -v $(WORKDIR):/workspace -w /workspace/example -v /var/run/docker.sock:/var/run/docker.sock hashicorp/terraform:latest

version:
	$(TF) version

init: 
	$(TF) init

plan:
	$(TF) plan

validate:
	$(TF) validate

fmt:
	$(TF) fmt -check -recursive

apply:
	$(TF) apply	

lint:
	docker run --rm -v $(WORKDIR):/data ghcr.io/terraform-linters/tflint

scan:
	docker run --rm -v $(WORKDIR):/workspace aquasec/trivy:latest config /workspace

gitea: 
	docker compose up -d