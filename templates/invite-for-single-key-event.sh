#!/bin/sh

#parameters
NOME_EVENTO=$1
DATA_EVENTO=$2
LOCAL_EVENTO=$3
RODAPE=$4 

#template
cat << EOF 
Olá, pessoal!

Esta mensagem é para avisar que nos próximos dias teremos a realização do/da $NOME_EVENTO .

Ocorrerá no dia $DATA_EVENTO, $LOCAL_EVENTO.

Sejam bem vindos.

Atenciosamente,
$RODAPE
EOF

