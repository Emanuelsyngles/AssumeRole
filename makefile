init:
	@echo "Inicializando os recursos terraform no ambiente de $(ENV)...."
	cd $(TF_DIR) && terraform init

plan:
	@echo "Gerando um plano no ambiente de $(ENV).."
	cd $(TF_DIR) && terraform plan -out=tfplan

apply:
	@echo "Aplicando na infraestrutura $(ENV)..."
	cd $(TF_DIR) && terraform apply tfplan

destroy:
	@echo "Destruindo recursos deste ambiente"
	cd $(TF_DIR) && terraform destroy -auto-approve
