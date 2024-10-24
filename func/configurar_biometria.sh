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
# **************************************************************

# Configura biometria
configurar_biometria() {

  # Pedir confirmação para configurar a biometria
  if confirm_action "Deseja configurar a biometria?"; then
    # Aplica permissão na pasta
    BIOMETRIA_DIR=/opt/ServidorBiometrico/
    if ! sudo chmod 777 -R "$BIOMETRIA_DIR"; then
      error_msg "Erro ao aplicar permissão a pasta $BIOMETRIA_DIR."
      sleep 2
    fi

    
    # Abrir o arquivo de configuração
    warning_msg "Abrindo o utilitário de configuração do servidor biométrico..."
    sudo -i biometria

    # Executar o script e verificar se foi bem-sucedido
    info_msg "Inicializando o servidor biométrico..."
    BIOMETRIA_SCRIPT="/opt/ServidorBiometrico/Scanner/iniciaBiometriaFH80.sh"
    if sudo "$BIOMETRIA_SCRIPT"; then
      success_msg "Configuração da biometria realizada com sucesso!"
    else
      error_msg "Erro ao inicializar o servidor biométrico."
    fi

    # Esperar que o usuário termine de configurar
    info_msg "Pressione ENTER ao concluir a configuração."
    read -r -p ""
  else
    info_msg "Configuração do Biometrico cancelado."
  fi
}
