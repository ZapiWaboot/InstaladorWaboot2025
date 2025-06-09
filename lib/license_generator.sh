#!/bin/bash

#######################################
# Gera uma licença única para uma instância
# Arguments:
#   $1 - Nome da instância
#   $2 - Chave secreta (opcional)
#######################################
generate_license() {
  print_banner
  printf "${WHITE} 💻 Gerando licença para ${instancia_add}...${GRAY_LIGHT}"
  printf "\n\n"

  # Gerar chave secreta se não fornecida
  local secret_key=${2:-$(openssl rand -hex 32)}
  
  # Gerar timestamp
  local timestamp=$(date +%s)
  
  # Perguntar período de validade
  printf "${WHITE} 💻 Escolha o período de validade da licença:${GRAY_LIGHT}"
  printf "\n\n"
  printf "   [1] 30 dias \n"
  printf "   [2] 60 dias \n"
  printf "   [3] 90 dias \n"
  printf "   [4] 180 dias \n"
  printf "   [5] 365 dias \n"
  printf "   [6] Personalizado \n"
  printf "\n"
  read -p "> " periodo_opcao

  case "${periodo_opcao}" in
    1) periodo_dias=30 ;;
    2) periodo_dias=60 ;;
    3) periodo_dias=90 ;;
    4) periodo_dias=180 ;;
    5) periodo_dias=365 ;;
    6)
      printf "${WHITE} 💻 Digite o número de dias de validade:${GRAY_LIGHT}"
      printf "\n\n"
      read -p "> " periodo_dias
      ;;
    *)
      printf "${RED}Opção inválida! Usando período padrão de 30 dias.${GRAY_LIGHT}"
      periodo_dias=30
      ;;
  esac

  # Calcular timestamp de expiração
  local expira_timestamp=$((timestamp + (periodo_dias * 24 * 60 * 60)))
  
  # Gerar hash único baseado na instância e timestamp
  local instance_hash=$(echo -n "${instancia_add}${timestamp}${expira_timestamp}${secret_key}" | sha256sum | cut -d' ' -f1)
  
  # Criar licença no formato: timestamp:expira_timestamp:hash:chave
  local license="${timestamp}:${expira_timestamp}:${instance_hash}:${secret_key}"
  
  # Salvar licença
  sudo su - deploy <<EOF
    mkdir -p /home/deploy/${instancia_add}/licenses
    echo "${license}" > /home/deploy/${instancia_add}/licenses/license.key
    chmod 600 /home/deploy/${instancia_add}/licenses/license.key
EOF

  # Configurar variáveis de ambiente
  sudo su - deploy <<EOF
    # Backend
    cd /home/deploy/${instancia_add}/backend
    echo "LICENSE_KEY=${license}" >> .env
    echo "LICENSE_HASH=${instance_hash}" >> .env
    echo "LICENSE_EXPIRES=${expira_timestamp}" >> .env
    
    # Frontend
    cd /home/deploy/${instancia_add}/frontend
    echo "REACT_APP_LICENSE_KEY=${license}" >> .env
    echo "REACT_APP_INSTANCE_ID=${instancia_add}" >> .env
    echo "REACT_APP_LICENSE_EXPIRES=${expira_timestamp}" >> .env
EOF

  printf "${GREEN}✅ Licença gerada com sucesso!${GRAY_LIGHT}"
  printf "\n\n"
  printf "${WHITE}📝 Informações da licença:${GRAY_LIGHT}"
  printf "\n"
  printf "Instância: ${instancia_add}"
  printf "\n"
  printf "Licença: ${license}"
  printf "\n"
  printf "Hash: ${instance_hash}"
  printf "\n"
  printf "Data de geração: $(date)"
  printf "\n"
  printf "Data de expiração: $(date -d @${expira_timestamp})"
  printf "\n"
  printf "Período de validade: ${periodo_dias} dias"
  printf "\n\n"
}

#######################################
# Verifica se uma licença é válida
# Arguments:
#   $1 - Licença completa
#   $2 - Nome da instância
#######################################
verify_license() {
  local license=$1
  local instance=$2
  
  # Extrair componentes da licença
  local timestamp=$(echo $license | cut -d':' -f1)
  local expira_timestamp=$(echo $license | cut -d':' -f2)
  local hash=$(echo $license | cut -d':' -f3)
  local secret_key=$(echo $license | cut -d':' -f4)
  
  # Verificar se a licença expirou
  local current_time=$(date +%s)
  
  if [ $current_time -gt $expira_timestamp ]; then
    printf "${RED}❌ Licença expirada em $(date -d @${expira_timestamp})!${GRAY_LIGHT}"
    return 1
  fi
  
  # Calcular dias restantes
  local dias_restantes=$(( (expira_timestamp - current_time) / (24 * 60 * 60) ))
  printf "${WHITE}📅 Dias restantes: ${dias_restantes}${GRAY_LIGHT}"
  printf "\n"
  
  # Verificar hash
  local expected_hash=$(echo -n "${instance}${timestamp}${expira_timestamp}${secret_key}" | sha256sum | cut -d' ' -f1)
  
  if [ "$hash" != "$expected_hash" ]; then
    printf "${RED}❌ Licença inválida!${GRAY_LIGHT}"
    return 1
  fi
  
  printf "${GREEN}✅ Licença válida!${GRAY_LIGHT}"
  return 0
}

#######################################
# Menu principal do gerador de licenças
#######################################
license_menu() {
  print_banner
  printf "${WHITE} 💻 Gerador de Licenças ZION CRM${GRAY_LIGHT}"
  printf "\n\n"
  printf "   [1] Gerar nova licença \n"
  printf "   [2] Verificar licença \n"
  printf "   [3] Voltar \n"
  printf "\n"
  read -p "> " option

  case "${option}" in
    1)
      get_instancia_add
      generate_license
      ;;
    2)
      print_banner
      printf "${WHITE} 💻 Verificar Licença${GRAY_LIGHT}"
      printf "\n\n"
      read -p "Digite a licença: " license
      read -p "Digite o nome da instância: " instance
      verify_license "$license" "$instance"
      ;;
    3)
      return
      ;;
    *)
      printf "${RED}Opção inválida!${GRAY_LIGHT}"
      ;;
  esac
} 