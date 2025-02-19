# Script para Ativar o Serviço RPC em Múltiplas Máquinas

Este script utiliza o **PsExec** para ativar o serviço RPC (Remote Procedure Call) em várias máquinas remotas listadas em um arquivo de texto.

## 📌 Pré-requisitos

- **PsExec**: Certifique-se de que o PsExec está disponível no seu `PATH` ou no mesmo diretório do script.
- **Permissões Administrativas**: Você precisa de permissões administrativas nas máquinas remotas.

## 📄 Arquivo de Texto com Lista de Computadores

Crie um arquivo de texto chamado `computers.txt` contendo os nomes ou endereços IP das máquinas, um por linha. Exemplo:

```
COMPUTER1
COMPUTER2
192.168.1.10
```

## ⚙️ Script de Lote

Crie um arquivo de script de lote chamado `ativar_rpc.bat` com o seguinte conteúdo:

```cmd
@echo off
for /f %%i in (computers.txt) do (
    echo Ativando RPC em %%i
    psexec \\%%i -s -d sc config RpcSs start= auto
    psexec \\%%i -s -d net start RpcSs
)
```

## 🚀 Executando o Script

### 1️⃣ Abra o Prompt de Comando como Administrador

Clique com o botão direito no ícone do Prompt de Comando e selecione **"Executar como administrador"**.

### 2️⃣ Navegue até o Diretório do Script

Use o comando `cd` para mudar para o diretório onde o PsExec e o script estão localizados. Exemplo:

```cmd
cd C:\caminho\para\o\diretorio
```

### 3️⃣ Execute o Script

Execute o script de lote com o PsExec:

```cmd
psexec @computers.txt -s -d C:\caminho\para\o\diretorio\ativar_rpc.bat
```

## 📝 Explicação dos Comandos

- **`psexec`**: Inicia o PsExec.
- **`-s`**: Executa o processo na conta do sistema.
- **`-d`**: Não espera o processo terminar (não interativo).
- **`@computers.txt`**: Especifica um arquivo de texto que contém uma lista de computadores nos quais o comando será executado.
- **`sc config RpcSs start= auto`**: Configura o serviço RPC para iniciar automaticamente.
- **`net start RpcSs`**: Inicia o serviço RPC.

## 🔍 Considerações Finais

Certifique-se de que o PsExec está configurado corretamente e que você tem as permissões necessárias para executar comandos remotos nas máquinas listadas. Se encontrar problemas, verifique as configurações de rede e firewall.

---
📌 **Dica**: Caso tenha dificuldades, use o comando `psexec \NOMEDOMAQUINA cmd` para testar a conexão remota antes de executar o script.
