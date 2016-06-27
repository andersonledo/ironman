#!/bin/sh

#parameters
NOME_PROJETO=$1
LISTA_DETALHADA_DOS_ITENS=$2
RELATOS_IMPLEMENTADOS=$3
RELATOS_EM_AVALIACAO=$4
INCIDENTES_TRATADOS=$5
INCIDENTES_EM_PROGRESSO=$6
RISCOS=$7
PROGRESSO_FISICO=$8
RESUMO_METRICAS_TECNICAS=$9
DEFEITOS_ABERTOS=$10
MUDANCA_ESCOPO=$11
RODAPE=$12


#template
cat << EOF
Olá,

Segue status detalhado dos últimos acontecimentos do $NOME_PROJETO.
Este report traz detalhes de desenvolvimento, não sendo adequado para exposição ou tratamento no âmbito negocial.

No último mês, foram entregues os seguintes items:
$LISTA_DETALHADA_DOS_ITENS


Os relatos implementados foram:
$RELATOS_IMPLEMENTADOS 

Os relatos que se encontram em avaliação são:
$RELATOS_EM_AVALIACAO

Os seguintes incidentes foram tratados:
$INCIDENTES_TRATADOS

E os incidentes que se encontram em progresso:
$INCIDENTES_EM_PROGRESSO


Os seguintes riscos foram identificados ou estão em evidência:
$RISCOS 

Atualmente, o projeto já entregou $PROGRESSO_FISICO do seu backlog. 
 
As métricas de qualidade técnica indicam:
$RESUMO_METRICAS_TECNICAS 

Os seguintes defeitos ainda estão em aberto ou em tratamento:
$DEFEITOS_ABERTOS 

Quanto à  gestão de escopo, os seguintes pontos encontram em avaliação: 
$MUDANCA_ESCOPO 

Atenciosamente,
$RODAPE
EOF
