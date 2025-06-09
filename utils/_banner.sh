#!/bin/bash
#
# Print banner art.

#######################################
# Print a board. 
# Globals:
#   BG_BROWN
#   NC
#   WHITE
#   CYAN_LIGHT
#   RED
#   GREEN
#   YELLOW
# Arguments:
#   None
#######################################
print_banner() {

  clear

  printf "\n\n"


printf "${GREEN}"
printf "        ____  _   ___ ___    __      ___   ___  ___   ___ _____ \n"
printf "       |_  / /_\ | _ \_ _|   \ \    / /_\ | _ )/ _ \ / _ \_   _|\n"
printf "        / / / _ \|  _/| |     \ \/\/ / _ \| _ \ (_) | (_) || |  \n"
printf "       /___/_/ \_\_| |___|     \_/\_/_/ \_\___/\___/ \___/ |_|  \n"                                                      
printf "${NC}"

printf "\n"

  printf "${GREEN}";
  printf "    ╔════════════════════════════════════════════════════════════╗\n";
  printf "    ║                        ZAPI WABOOT                         ║\n";
  printf "    ║              SISTEMA DE MULTIATENDIMENTO ONLINE            ║\n";
  printf "    ╚════════════════════════════════════════════════════════════╝\n";
  printf "${NC}";

 printf "\n"

  printf "${YELLOW}";
  printf "    ┌────────────────────────────────────────────────────────────┐\n";
  printf "    │                    AVISO DE LEGALIDADE                     │\n";
  printf "    └────────────────────────────────────────────────────────────┘\n";
  printf "${NC}";
  
  printf "${WHITE}";
  printf "    Este sistema é de propriedade exclusiva da Zapi Waboot,\n";
  printf "    protegido por direitos autorais e licenças de uso.\n";
  printf "    A reprodução, distribuição ou modificação não autorizada\n";
  printf "    são proibidas por lei.\n\n";
  printf "    Ao prosseguir, você concorda com os termos de uso e com\n";
  printf "    a utilização legal do sistema.\n";
  printf "${NC}";

  printf "\n"

  printf "${CYAN_LIGHT}";
  printf "    ┌────────────────────────────────────────────────────────────┐\n";
  printf "    │                           SUPORTE                          │\n";
  printf "    │                                                            │\n";
  printf "    │                      +55 11-99023-9898                     │\n";
  printf "    └────────────────────────────────────────────────────────────┘\n";
  printf "${NC}";

  printf "\n"
}
