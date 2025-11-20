# 🚀 Projeto DevOps — CI/CD com Jenkins, SonarQube, Terraform, Ansible, Docker, Kind & Kubernetes

Bem-vindo ao **Projeto DevOps**, um laboratório completo integrando práticas modernas de automação, infraestrutura como código, pipelines CI/CD, análise de qualidade e deploy em Kubernetes.  
Este projeto demonstra como diversas ferramentas DevOps trabalham juntas de forma organizada e automatizada.

---

## 📌 Visão Geral da Arquitetura

Desenvolvimento (Python)
↓
Qualidade de Código (SonarQube)
↓
Pipeline CI/CD (Jenkins)
↓
Build da Imagem (Docker)
↓
Deploy Automatizado (Kubernetes via Kind)
↓
Infraestrutura como Código (Terraform + Ansible)

yaml
Copiar código

---

## 📁 Estrutura do Repositório

PROJETO_DEVOPS/
├── app/
│ └── app.py # Código Python para análise no SonarQube
│
├── infra/
│ ├── ansible/
│ │ ├── inventory.ini
│ │ └── playbook.yml # Automações de configuração
│ │
│ └── terraform/
│ ├── main.tf # Infra declarada como código
│ ├── terraform.tfstate
│ └── lab-devops-config/
│
├── k8s/
│ └── helm/
│ ├── jenkins-values.yaml
│ └── sonar-values.yaml
│
└── manifest/ # Manifests Kubernetes adicionais

yaml
Copiar código

---

## 🐍 Aplicação (Python)

Arquivo: `app/app.py`

```python
def somar(a, b):
    # Variavel nao usada (Code Smell)
    resultado_inutil = 0

    # Comparacao que sempre da verdade (Bug)
    if (a == a):
        return a + b

print(somar(10, 20))
Esse código foi criado propositalmente com code smells e bugs para análise no SonarQube.

🧰 Tecnologias Utilizadas
🔧 Infraestrutura & Automação
Terraform

Ansible

🐳 Containers & Orquestração
Docker

Kind (Kubernetes in Docker)

Kubernetes

Helm

🔎 Qualidade & Pipelines
SonarQube

Jenkins

🏗️ Criando o Cluster Kubernetes com Kind
bash
Copiar código
kind create cluster --name devops-lab
📦 Instalando Jenkins via Helm
bash
Copiar código
helm install jenkins jenkins/jenkins \
  -n devops-tools \
  -f k8s/helm/jenkins-values.yaml
🔍 Instalando SonarQube via Helm
bash
Copiar código
helm install sonarqube sonarqube/sonarqube \
  -n devops-tools \
  -f k8s/helm/sonar-values.yaml
📡 Verificando os Pods
bash
Copiar código
kubectl get pods -n devops-tools --watch
Exemplo:

sql
Copiar código
NAME                        READY   STATUS    RESTARTS   AGE
jenkins-0                   2/2     Running   0          7m51s
sonarqube-postgresql-0      1/1     Running   0          49m
sonarqube-sonarqube-0       1/1     Running   0          49m
🧵 Pipeline CI/CD (Jenkins)
O pipeline executa:

Checkout do repositório

Análise de código com SonarQube

Build da imagem Docker

Push para Registry (opcional)

Deploy no Kubernetes (Kind)

Validação pós-deploy

🚀 Deploy da Aplicação no Kubernetes
bash
Copiar código
kubectl apply -f manifest/
🧪 Análise de Qualidade com SonarQube
Arquivo principal:

matlab
Copiar código
sonar-project.properties
Exemplo:

properties
Copiar código
sonar.projectKey=projeto-devops
sonar.sources=app
sonar.language=py
sonar.sourceEncoding=UTF-8
🔮 Melhorias Futuras
Adicionar testes unitários

Integrar um registry privado (Harbor / Nexus)

Deploy automatizado em Cloud real

Monitoramento (Prometheus & Grafana)

Gestão de segredos com Vault

📜 Licença
Distribuído sob a licença MIT.

yaml
Copiar código

---

Se quiser, posso **adicionar badges**, **ícones**, **diagramas**, **GIFs**, ou gerar um **Jen
