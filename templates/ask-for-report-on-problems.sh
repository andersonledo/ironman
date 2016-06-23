#!/bin/sh


# check parameters first ?

OBJETIVOS=$1
PRAZO=$2
TEMPO_RESTANTE=$3
RODAPE=$4

cat << EOF

Opa, pessoal.

Lembrando que temos que realizar...
$OBJETIVOS

... até o dia $PRAZO. Ainda nos restam $TEMPO_RESTANTE dias.  

Peço que me avisem caso visualizem a impossibilidade de não realizarmos qualquer um desses objetivos ou se houver algum outro problema importante.

Atenciosamente,
$RODAPE
EOF
