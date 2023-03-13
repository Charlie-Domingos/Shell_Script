#!/bin/bash
 #Autoping v.0.1
 #Ping automatico em um intervalo de IP
 #Melhorado por Charlie Augusto | Conecto 11/04/2022

 clear
  echo
  sleep 2
  echo -n "NUMERO DA LOJA >>> "
  read NLOJA;
  echo -n "QUATIDADE DE PDVs >> "
  read QTDPDV;
  echo
  echo
    date
  echo
  echo "Executando..."

      FunctionPing () {

        if [ ${#QTDPDV} -eq 2 ]; then ## Se a quantidade de pdvs contiver 2 caracteres, acrescete 1 a frente
        QTDPDV="1${QTDPDV}"
      else
        QTDPDV="10${QTDPDV}"
        fi

        for ((NUMPDV=101;NUMPDV<=QTDPDV;NUMPDV++));do ## Linha que realiza a contagem
      if ! ping -c 4 $IPloja$NUMPDV >> /dev/null ; then
      echo -e "PDV ${QTDPDV:1:2} \e[1;37;41m OFFLINE \e[0m"
    else
      echo -e "PDV ${QTDPDV:1:2} \e[1;37;42m ONLINE \e[0m"
      fi

  done
  }

 case $NLOJA in
      001) echo; IPloja="192.168.10." ; FunctionPing ;;
      002) echo; IPloja="192.168.11." ; FunctionPing ;;
      *)  "";  "Opcao invalida" ; sleep 2 ;;
   esac


