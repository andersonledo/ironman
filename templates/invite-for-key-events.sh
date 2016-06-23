#!/bin/sh

#parameters
EVENTOS=$1

#template
cat << EOF 
Olá, pessoal!

Esta mensagem é para avisar que nos próximos dias teremos a realização dos seguintes eventos:
$EVENTOS 

Sejam bem vindos.

Atenciosamente,
$RODAPE
EOF

