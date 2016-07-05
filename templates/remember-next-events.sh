#!/bin/sh

#paramenters
EVENTOS_PROJETO=$1
RODAPE=$2

#template

cat << EOF 
Subject: [$NOME_PROJETO - $FASE_PROJETO] Próximos eventos
Pessoal,

Lembrando que nos próximos dias temos os seguintes eventos:
$EVENTOS_PROJETO 

Agendem-se.
Atenciosamente,
$RODAPE
EOF

