## 🌱 O que este projeto faz?

- Cria uma IAM Role com Trust Policy (EC2 assume a role).
- Cria uma IAM Policy com permissões S3.
- Separa ambientes (`dev` e `prod`) com configurações e permissões distintas.
- Usa módulos reutilizáveis com boas práticas.
- Usa Makefile para facilitar comandos Terraform por ambiente.

---

## ⚙️ Comandos com Makefile

```bash
make init ENV=dev      # Inicializa o Terraform para o ambiente dev
make plan ENV=dev      # Mostra o plano de execução
make apply ENV=dev     # Aplica as mudanças no ambiente dev

make init ENV=prod     # Ambiente prod
make apply ENV=prod

🛡️ Exemplo de Policy (dev)

[
  {
    "Effect": "Allow",
    "Action": ["s3:ListBucket"],
    "Resource": ["arn:aws:s3:::example-bucket-dev"]
  },
  {
    "Effect": "Allow",
    "Action": ["s3:GetObject"],
    "Resource": ["arn:aws:s3:::example-bucket-dev/*"]
  }
]

👨‍💻 Autor
[Emanuel syngles]

GitHub: @Emanuelsyngles

LinkedIn: https://www.linkedin.com/in/emanuel-leal/

