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

  printf "${CYAN_LIGHT}";
  printf "    ███████╗██╗ ██████╗ ███╗   ██╗     ██████╗██████╗ ███╗   ███╗\n";
  printf "    ╚══███╔╝██║██╔═══██╗████╗  ██║    ██╔════╝██╔══██╗████╗ ████║\n";
  printf "      ███╔╝ ██║██║   ██║██╔██╗ ██║    ██║     ██████╔╝██╔████╔██║\n";
  printf "     ███╔╝  ██║██║   ██║██║╚██╗██║    ██║     ██╔══██╗██║╚██╔╝██║\n";
  printf "    ███████╗██║╚██████╔╝██║ ╚████║    ╚██████╗██║  ██║██║ ╚═╝ ██║\n";
  printf "    ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝\n";
  printf "${NC}";

  printf "\n"

  printf "${GREEN}";
  printf "    ╔════════════════════════════════════════════════════════════╗\n";
  printf "    ║                     ZION TECNOLOGIA                        ║\n";
  printf "    ║              SISTEMA DE MULTIATENDIMENTO                   ║\n";
  printf "    ╚════════════════════════════════════════════════════════════╝\n";
  printf "${NC}";

  printf "\n"

  printf "${YELLOW}";
  printf "    ┌────────────────────────────────────────────────────────────┐\n";
  printf "    │                    AVISO DE LEGALIDADE                     │\n";
  printf "    └────────────────────────────────────────────────────────────┘\n";
  printf "${NC}";
  
  printf "${WHITE}";
  printf "    Este sistema é de propriedade exclusiva da Zion Tecnologia,\n";
  printf "    protegido por direitos autorais e licenças de uso.\n";
  printf "    A reprodução, distribuição ou modificação não autorizada\n";
  printf "    são proibidas por lei.\n\n";
  printf "    Ao prosseguir, você concorda com os termos de uso e com\n";
  printf "    a utilização legal do sistema.\n";
  printf "${NC}";

  printf "\n"

  printf "${GREEN}";
  printf "    ┌────────────────────────────────────────────────────────────┐\n";
  printf "    │                         SUPORTE                            │\n";
  printf "    │                   📞 +5565-99254-2909                     │\n";
  printf "    └────────────────────────────────────────────────────────────┘\n";
  printf "${NC}";

  printf "\n"
}