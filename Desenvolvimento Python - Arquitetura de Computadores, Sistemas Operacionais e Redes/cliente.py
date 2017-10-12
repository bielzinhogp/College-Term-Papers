#!/usr/bin/python
# -*- coding: utf-8 -*-

import socket, pickle
import subprocess
import sys
import os

import time
from datetime import datetime


def principais_portas():
    t1 = datetime.now()
    # Create new file
    file = open("PrincipaisPortas.txt", "w", encoding="utf8")

    # Clear the screen
    subprocess.call('\n', shell=True)

    # Passa o host a ser scaneado
    remoteServer = "localhost"
    lista_portas = 21, 22, 23, 25, 53, 67, 80, 110, 137, 138, 139, 143, 389, 443, 3128
    remoteServerIP = socket.gethostbyname(remoteServer)

    # Print a nice banner with information on which host we are about to scan
    print("-" * 60)
    print("Aguarde enquanto verificamos o host", remoteServerIP)
    print("-" * 60)

    # Using the range function to specify ports (here it will scans all ports between 1 and 1024)
    try:
        for port in (lista_portas):
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            result = sock.connect_ex((remoteServerIP, port))
            if result == 0:
                print("[*] Port {}: 	 Open".format(port))
                file.write("[*] Port {}: 	 Open".format(port) + "\n")
                sock.close()
            else:
                print("[*] Port {}: 	 Closed".format(port))
                file.write("[*] Port {}: 	 Closed".format(port) + "\n")

        # Close file
        file.close()

    # We also put in some error handling for catching errors
    except KeyboardInterrupt:
        print("Você pressionou Ctrl+C")
        sys.exit()

    except socket.gaierror:
        print("O host nao pode ser encontrado. Programa Encerrado")
        sys.exit()

    except socket.error:
        print("Não foi possível conectar-se ao servidor")
        sys.exit()

    # Checking the time again
    t2 = datetime.now()

    # Calculates the difference of time, to see how long it took to run the script
    total = t2 - t1

    # Printing the information to screen
    print("Varredura terminada em: ", total)
    print("Arquivo do scan criando em: ", os.path.abspath("PrincipaisPortas.txt"))

def menu():
    print("Conectado no servidor " +HOST)
    opcao = int(input('''

/~\        _ _  _     _  |\ | _ _|_  _  _|     
\_/><\/|_|| (_|| ||_|_\  | \|(/_ |VV(_)| |<    
     /                                         

1 - Exibir informacoes da CPU                 
2 - Exibir informacoes de Disco               
3 - Exibir informacoes de Memoria
4 - Exibir informacoes de Rede             
5 - Exibir informações do processo atual     
6 - Listar arquivos no servidor            
0 - Sair                                        

Escolha uma opcao: '''))

    if (opcao == 1):
        print("Informacoes de CPU \n")
        msg = "info cpu"
        # Envia mensagem de requisicao para o servidor
        tcp.send(msg.encode('utf-8'))

        # Recebe os bytes do servidor
        bytes = tcp.recv(1024)
        bytes_restante = tcp.recv(1024)

        # Converte os bytes para lista
        info_cpu = pickle.loads(bytes)
        info_restante = pickle.loads(bytes_restante)

        print("Nome: " +info_cpu["brand"])
        print("Arquitetura: " +info_cpu["arch"])
        print("Palavra (bits): " +str(info_cpu["bits"]))
        contador = 0
        while contador < len(info_restante):
            print(info_restante[contador])
            contador += 1

        return menu()

    elif (opcao == 2):
        print("Informacoes de Disco \n")
        msg = "info disco"
        # Envia mensagem de requisicao para o servidor
        tcp.send(msg.encode('utf-8'))

        # Recebe os bytes do servidor
        bytes = tcp.recv(1024)

        # Converte os bytes para lista
        disco = pickle.loads(bytes)

        print("Total:", round(disco.total / (1024 * 1024 * 1024), 2), "GB")
        print("Em uso:", round(disco.used / (1024 * 1024 * 1024), 2), "GB")
        print("Livre:", round(disco.free / (1024 * 1024 * 1024), 2), "GB")
        print("Percentual de Disco Usado:", str(disco.percent) + "%")

        return menu()

    elif (opcao == 3):
        print("Informacoes de Memoria \n")
        msg = "info memoria"
        # Envia mensagem de requisicao para o servidor
        tcp.send(msg.encode("utf-8"))

        # Recebe os bytes do servidor
        bytes = tcp.recv(4046)

        lista_memoria = pickle.loads(bytes)
        print("Memória RAM Total: ", round(lista_memoria[0].total / (1024 * 1024 * 1024), 2))
        print("Memória SWAP Total: ", round(lista_memoria[1].total / (1024 * 1024 * 1024), 2))

        return menu()

    elif (opcao == 4):
        print("Informacoes de Rede \n")

        opcao_rede = int(input('''
                1 - Mostrar interfaces de rede
                2 - Scanear portas no servidor

                    Escolha uma opcao: '''))

        if (opcao_rede == 1):
            msg = "info rede"
            # Envia mensagem de requisicao para o servidor
            tcp.send(msg.encode('utf-8'))

            # Recebe os bytes do servidor
            bytes = tcp.recv(1024)

            # Converte os bytes para lista
            interfaces = pickle.loads(bytes)

            print("Interfaces de rede")
            nomes = []
            # Obtém os nomes das interfaces primeiro
            for contador in interfaces:
                nomes.append(str(contador))
            # Depois, imprimir os valores:
            for contador in nomes:
                print("\n")
                print(contador + ":")
                for info in interfaces[contador]:
                    print("Endereço: " + "\t" + str(info.address))
                    print("Máscara: " + "\t" + str(info.netmask))

            return menu()

        elif (opcao_rede == 2):
            msg = "scan rede"
            tcp.send(msg.encode("utf-8"))
            principais_portas()

            return menu()

    elif (opcao == 5):
        msg = "processos ativos"
        # Envia mensagem de requisicao para o servidor
        tcp.send(msg.encode("utf-8"))

        # Recebe os bytes do servidor
        bytes = tcp.recv(1024)
        bytes_processos = tcp.recv(1024)

        # Converte os bytes para lista
        lista = pickle.loads(bytes)
        processos = pickle.loads(bytes_processos)
        print("Informações do processo atual \n")

        print("PID: ", processos.pid)
        print("Nome: ", processos.name())
        print("Executável: ", processos.exe())
        print("Percentual de uso de CPU: ", processos.cpu_percent(interval=1.0), "%")


        return menu()

    elif (opcao == 6):
        msg = "listar arquivos"
        # Envia mensagem de requisicao para o servidor
        tcp.send(msg.encode("utf-8"))

        #Recebe os bytes do servidor
        bytes = tcp.recv(1024)

        # Converte os bytes para lista
        lista = pickle.loads(bytes)
        dic = {}

        for contador in lista:
            if os.path.isfile(contador):
                dic[contador] = []
                dic[contador].append(os.stat(contador).st_size)
                dic[contador].append(os.stat(contador).st_atime)
                dic[contador].append(os.stat(contador).st_mtime)

        titulo = '{:11}'.format("Tamanho")
        titulo = titulo + '{:27}'.format("Data de Modificacao")
        titulo = titulo + '{:27}'.format("Data de Criacao")
        titulo = titulo + "Nome"
        print(titulo)

        for i in dic:
            kb = dic[i][0] / 100
            tamanho = '{:10}'.format(str('{:.2f}'.format(kb) + 'KB'))
            print(tamanho, time.ctime(dic[i][2]), " ", time.ctime(dic[i][1]), " ", i)

        return menu()

    elif (opcao == 0):
        msg = "fim"
        # Envia mensagem de requisicao para o servidor
        tcp.send(msg.encode("utf-8"))
        print("Programa encerrado")
        pass
    else:
        print("Opcao invalida, tente novamente")
        return  menu()

# Endereco IP do Servidor
HOST = socket.gethostname()
# Porta que o Servidor esta
PORT = 9999
# Cria o socket
tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
dest = (HOST, PORT)

try:
    # Tenta se conectar ao servidor
    tcp.connect(dest)
    menu()

except Exception as erro:
    print(str(erro))

# Fecha o socket
tcp.close()
