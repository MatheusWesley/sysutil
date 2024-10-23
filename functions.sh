#!/bin/bash
#
# sysutil.sh - Script de utilitários para o SysPDV PDV em Linux
#
# Versão: 5.2
# Autor: Matheus Wesley
# GitHub: https://matheuswesley.github.io/devlinks
# GitHub Projeto: https://matwdot.github.
# Licença: MIT
#
# Este script contém um conjunto de funções para instalação, atualização e
# manutenção do sistema SysPDV PDV em ambientes Linux.
#
# *************************************************************

# IMPORTAÇÕES
# shellcheck disable=SC1091

. func/instalar_vpn.sh
. func/baixar_drive_mfe.sh
. func/configurar_perifericos.sh
. func/configurar_docgate.sh
. func/configurar_biometria.sh
. func/baixar_build.sh
. func/limitar_consumo.sh
. func/requisitos.sh

# Utilitários
. func/utils/utilities.sh

# FUNÇÕES

# Instalar o SysPDV (Pacote Completo)
instalar_syspdv() {

  if confirm_action "Deseja instalar o SysPDV PDV?"; then
    info_msg "Iniciando a instalação do SysPDV"
    baixar_build
    configurar_perifericos
    instalar_vpn
    instalar_drive_mfe
  else
    error_msg "Instalação do SysPDV cancelada"
  fi
}

# Atualizar o SysPDV (Baixa e roda o instalador apenas)
atualizar_syspdv() {
  if confirm_action "Deseja atualizar o SysPDV PDV?"; then
    info_msg "Iniciando a atualização do SysPDV"
    baixar_build
  else
    error_msg "Instalação cancelada."
  fi
}
