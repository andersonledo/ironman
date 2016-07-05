#!/bin/sh

#parameters
EVENTOS=$1
RODAPE=$2

#template
cat << EOF 
Subject: [$NOME_PROJETO - $FASE_PROJETO] Convite para eventos chave
Olá, pessoal!

Esta mensagem é para avisar que nos próximos dias teremos a realização dos seguintes eventos:
$EVENTOS 

Sejam bem vindos.

Atenciosamente,
$RODAPE
EOF

