# 🚀 End-to-End DevOps Lab: Kubernetes, CI/CD & GitOps

![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![Jenkins](https://img.shields.io/badge/jenkins-%232C5263.svg?style=for-the-badge&logo=jenkins&logoColor=white)
![SonarQube](https://img.shields.io/badge/SonarQube-black?style=for-the-badge&logo=sonarqube&logoColor=4E9BCD)
![ArgoCD](https://img.shields.io/badge/ArgoCD-orange?style=for-the-badge&logo=argo&logoColor=white)
![Helm](https://img.shields.io/badge/Helm-0F1689?style=for-the-badge&logo=helm&logoColor=white)

> **Uma plataforma de Engenharia de Software completa rodando localmente.**
> Simulando um ambiente corporativo real com foco em Qualidade de Código (Quality Gates) e Entrega Contínua Declarativa (GitOps).

---

## 📋 Sobre o Projeto

Este laboratório foi desenvolvido para demonstrar a implementação de uma esteira **DevSecOps** moderna "Hands-on". O objetivo foi integrar todo o ciclo de vida do desenvolvimento de software em uma infraestrutura containerizada:

1.  **Infraestrutura Ágil:** Cluster Kubernetes gerenciado via Docker (Kind).
2.  **Integração Contínua (CI):** Pipeline automatizado orquestrado pelo Jenkins.
3.  **Governança & Qualidade:** Análise estática (SAST) com SonarQube e bloqueio de deploy em caso de falha no Quality Gate.
4.  **Entrega Contínua (CD):** Sincronização de infraestrutura baseada em Git (GitOps) com ArgoCD.

---

## 🛠️ Tech Stack & Arquitetura

| Ferramenta | Categoria | Função no Lab |
| :--- | :--- | :--- |
| **Kind** | Infraestrutura | Kubernetes in Docker (Cluster Local) |
| **Helm** | Gerenciamento | Provisionamento de pacotes e charts no Cluster |
| **Jenkins** | CI / Orquestração | Pipeline as Code (Groovy/Jenkinsfile) |
| **SonarQube** | Qualidade / SAST | Análise de Bugs, Vulnerabilidades e Code Smells |
| **ArgoCD** | CD / GitOps | Sincronização automática do estado do Cluster via Git |
| **Python** | Aplicação | App de exemplo para validação da esteira |

---

## ⚙️ Fluxo da Esteira (Pipeline)

O projeto segue um fluxo automatizado dividido em estágios:

1.  **Code Commit:** O desenvolvedor envia o código para o Repositório.
2.  **CI Trigger:** O Jenkins detecta a mudança e inicia o pipeline.
3.  **Sonar Scan:** O código é analisado pelo Scanner do SonarQube.
4.  **Quality Gate:** O Jenkins consulta o veredito do SonarQube:
    * ✅ **Passed:** O pipeline segue.
    * ❌ **Failed:** O pipeline é abortado imediatamente (Bloqueio de Bugs).
5.  **GitOps Sync:** O ArgoCD detecta mudanças no manifesto de infraestrutura (YAML) e aplica a escala ou atualização no Kubernetes automaticamente.

---

## 📸 Screenshots do Lab

### 1. Governança e Qualidade (SonarQube)
*Visibilidade total da saúde do código. O Quality Gate "Passed" garante que apenas código limpo avance.*

![SonarQube Dashboard](https://via.placeholder.com/800x400?text=Print+do+SonarQube+Verde)

### 2. GitOps em Ação (ArgoCD)
*Escabilidade declarativa: Aplicação escalada para 3 réplicas apenas editando o Git, sem comandos manuais.*

![ArgoCD Dashboard](https://via.placeholder.com/800x400?text=Print+do+ArgoCD)

### 3. Infraestrutura (Kubernetes)
*Todos os serviços (Jenkins, Sonar, Argo, App) rodando em containers no namespace `devops-tools`.*

![Terminal Kubernetes](https://via.placeholder.com/800x400?text=Print+do+Terminal+Kubectl)

---

## 🚀 Como Reproduzir este Lab

### Pré-requisitos
* Docker Desktop
* Kubectl
* Helm
* Kind

### 1. Subindo a Infraestrutura
```bash
# Criar o cluster
kind create cluster --name lab-devops

# Criar namespaces organizados
kubectl create namespace devops-tools
kubectl create namespace argocd

2. Instalando as Ferramentas (Via Helm)
Utilizamos Helm Charts oficiais com arquivos values.yaml customizados para otimização de recursos (CPU/Memória) em ambiente local.

Bash

# Instalação do SonarQube e Jenkins
helm upgrade --install sonarqube sonarqube/sonarqube -n devops-tools -f k8s/helm/sonar-values.yaml
helm upgrade --install jenkins jenkins/jenkins -n devops-tools -f k8s/helm/jenkins-values.yaml

# Instalação do ArgoCD
helm upgrade --install argocd argo/argo-cd -n argocd
3. Acessando os Dashboards (Port-Forward)
Como o ambiente é local e isolado, utilizamos túneis para acesso:

Bash

# SonarQube (admin/admin) -> http://localhost:9000
kubectl port-forward svc/sonarqube-sonarqube 9000:9000 -n devops-tools

# Jenkins (admin/password) -> http://localhost:8080
kubectl port-forward svc/jenkins 8080:8080 -n devops-tools

# ArgoCD (admin/password) -> https://localhost:8081
kubectl port-forward svc/argocd-server 8081:443 -n argocd
🔮 Próximos Passos (Roadmap)
Para evoluir este laboratório para um nível de Arquitetura Enterprise:

[ ] Terraform: Substituir a criação manual do Kind por Scripts IaC (main.tf).

[ ] Ansible: Automatizar a configuração do ambiente local e dependências.

[ ] Observabilidade: Implementar Prometheus e Grafana para monitorar métricas dos pods.

[ ] Segurança: Adicionar Trivy no pipeline para scan de vulnerabilidades em imagens Docker.

👨‍💻 Autor
Desenvolvido por Marcos Detrano Conectando Qualidade, Automação e Infraestrutura.
