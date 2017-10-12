#!/usr/bin/python
# -*- coding: utf-8 -*-

# Servidor
import socket, psutil, pickle
import sys
from cpuinfo import cpuinfo
import subprocess
import os
from datetime import *
import time

diaAtual = str(date.today())
horaAtual = time.strftime('%H:%M:%S')

def info_cpu():
    #Gera a lista de resposta
    resposta = []
    info = cpuinfo.get_cpu_info()

    nucleo_logico = psutil.cpu_count()
    resposta_nucleoLogico = ("Núcleos (lógicos:)" +str(nucleo_logico))
    resposta.append(resposta_nucleoLogico)

    nucleo_fisico = psutil.cpu_count(logical=False)
    resposta_nucleoFisico = ("Núcleos (físicos): " + str(nucleo_fisico))
    resposta.append(resposta_nucleoFisico)

    frequencia = psutil.cpu_freq().current
    resposta_frequencia = ("Frequência (MHz): " + str(frequencia))
    resposta.append(resposta_frequencia)

    frequencia_nucleo = psutil.cpu_percent(interval=1, percpu=True)
    numero_cpu = len(frequencia_nucleo)

    contador = 0
    for contador in range(numero_cpu):
        resposta_frequenciaNucleo = ("Percentual de uso da CPU " +str(contador)+ ": " +str(frequencia_nucleo[contador]) +"%")
        resposta.append(resposta_frequenciaNucleo)
        contador = + 1

    # Prepara a lista para o envio
    bytes_resp = pickle.dumps(info)
    bytes_restantes = pickle.dumps(resposta)
    # Envia os dados
    socket_cliente.send(bytes_resp)
    socket_cliente.send(bytes_restantes)

def info_disco():
    #Cria uma lista
    resposta = []
    disco = psutil.disk_usage('.')
    #Adiciona informacoes do disco na lista
    # Prepara a lista para o envio
    bytes_resp = pickle.dumps(disco)
    # Envia os dados
    socket_cliente.send(bytes_resp)


def info_memoria():
    resposta = []
    memoria = psutil.virtual_memory()
    resposta.append(memoria)
    swap = psutil.swap_memory()
    resposta.append(swap)

    # Prepara a lista para o envio
    bytes_resp = pickle.dumps(resposta)
    # Envia os dados
    socket_cliente.send(bytes_resp)

def info_rede():
    interfaces = psutil.net_if_addrs()

    # Prepara a lista para o envio
    bytes_resp = pickle.dumps(interfaces)

    # Envia os dados
    socket_cliente.send(bytes_resp)

def processos_ativos():
    lista_processos = psutil.pids()
    processos = psutil.Process()

    # Prepara a lista para o envio
    bytes_resp = pickle.dumps(lista_processos)
    # Prepara a lista para o envio
    bytes_processos = pickle.dumps(processos)

    # Envia os dados
    socket_cliente.send(bytes_resp)
    socket_cliente.send(bytes_processos)

def mostrar_arquivos():
    lista_arquivos = os.listdir()

    # Prepara a lista para o envio
    bytes_resp = pickle.dumps(lista_arquivos)

    # Envia os dados
    socket_cliente.send(bytes_resp)

#Cria o socket da conexão
tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# Obtem o nome da máquina
host = socket.gethostname()
porta = 9999
# Associa a porta
tcp.bind((host, porta))
# Escutando...
tcp.listen()
print("Servidor de nome", host, "esperando conexão na porta", porta)
# Aceita alguma conexão
(socket_cliente, addr) = tcp.accept()
print("Conectado a:", str(addr))

while True:
    # Recebe pedido do cliente:
    msg = socket_cliente.recv(1024)
    if msg.decode('utf-8') == 'info cpu':
        # Criando arquivo de log
        arquivo = open("log-" + diaAtual + ".txt", "a+", encoding="utf8")
        print("Enviando informacoes de CPU")
        arquivo.write(diaAtual+ "-" + horaAtual + "-" "Enviando informacoes de CPU para: " +str(addr) +"\n")
        info_cpu()
        arquivo.close()

    elif msg.decode('utf-8') == 'info disco':
        # Criando arquivo de log
        arquivo = open("log-" + diaAtual + ".txt", "a+", encoding="utf8")
        print("Enviando informacoes de disco")
        arquivo.write(diaAtual+ "-" + horaAtual + "-" "Enviando informacoes de Disco para:"  +str(addr) +"\n")
        info_disco()
        arquivo.close()

    elif msg.decode('utf-8') == 'info memoria':
        # Criando arquivo de log
        arquivo = open("log-" + diaAtual + ".txt", "a+", encoding="utf8")
        print("Enviando informacoes de memoria")
        arquivo.write(diaAtual+ "-" + horaAtual + "-" "Enviando informacoes de memoria para:"  +str(addr) +"\n")
        info_memoria()
        arquivo.close()

    elif msg.decode('utf-8') == 'info rede':
        # Criando arquivo de log
        arquivo = open("log-" + diaAtual + ".txt", "a+", encoding="utf8")
        print("Enviando informacoes de rede")
        arquivo.write(diaAtual+ "-" + horaAtual + "-" "Enviando informacoes de rede para:"  +str(addr) +"\n")
        info_rede()
        arquivo.close()

    elif msg.decode('utf-8') == 'scan rede':
        # Criando arquivo de log
        arquivo = open("log-" + diaAtual + ".txt", "a+", encoding="utf8")
        print("Scaneando portas do servidor")
        arquivo.write(diaAtual+ "-" + horaAtual + "-" "O host "+str(addr) +" está escaneando as portas nesse servidor" +"\n")
        arquivo.close()

    elif msg.decode('utf-8') == 'processos ativos':
        # Criando arquivo de log
        arquivo = open("log-" + diaAtual + ".txt", "a+", encoding="utf8")
        print("Mostrando processos ativos no servidor")
        arquivo.write(diaAtual+ "-" + horaAtual + "-" "Mostrando processos ativos no servidor para:"  +str(addr) +"\n")
        processos_ativos()
        arquivo.close()

    elif msg.decode('utf-8') == 'listar arquivos':
        # Criando arquivo de log
        arquivo = open("log-" + diaAtual + ".txt", "a+", encoding="utf8")
        print("Listando arquivos no servidor")
        arquivo.write(diaAtual+ "-" + horaAtual + "-" "Listando arquivos no servidor para:"  +str(addr) +"\n")
        mostrar_arquivos()
        arquivo .close()

    elif msg.decode('utf-8') == 'fim':
        # Criando arquivo de log
        arquivo = open("log-" + diaAtual + ".txt", "a+", encoding="utf8")
        print("Conexao com o cliente encerrada")
        arquivo.write(
            diaAtual + "-" + horaAtual + "-" "Conexao com o cliente " + str(addr) +" encerrada" +"\n")
        break


# Fecha socket do servidor e cliente
socket_cliente.close()
tcp.close()
