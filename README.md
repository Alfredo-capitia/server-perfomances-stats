# Server Stats - Challenge 1

Script em Bash para exibir estatísticas básicas de desempenho de um servidor Linux.  
Parte de um Linux antes do Devops — **Challenge 1**.

## Funcionalidades

- **CPU** — percentual de uso da CPU
- **Memória** — total, usado, livre e percentual de uso
- **Disco (raiz `/`)** — total, usado, livre e percentual de uso
- **Top 5 processos por CPU** — processos que mais consomem CPU
- **Top 5 processos por Memória** — processos que mais consomem memória

## Pré-requisitos

- Sistema Linux
- Bash
- Comandos usados: `top`, `free`, `df`, `ps`, `awk`, `bc`, `grep`, `head`, `tr`

## Dar permisão pra execução

```
chmod +x server-stats.sh

```
# Como Executar
./server-stats.sh


# Exemplo de saída

```
================================
  SERVER PERFORMANCE STATS

--- CPU ---
Uso: 12.5%

--- MEMÓRIA ---
Total: 7.6G | Usado: 3.2G | Livre: 4.4G | Uso: 42.1%

--- DISCO (/) ---
Total: 98G | Usado: 45G | Livre: 53G | Uso: 46%

--- TOP 5 PROCESSOS (CPU) ---
USER         PID     %CPU  %MEM  COMMAND
root         1234    5.2   1.0   processo-a
user1        5678    3.1   0.5   processo-b
...

--- TOP 5 PROCESSOS (MEMÓRIA) ---
USER         PID     %CPU  %MEM  COMMAND
root         1234    5.2   1.0   processo-a
user1        5678    3.1   0.5   processo-b

```
