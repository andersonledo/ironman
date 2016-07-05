#!/bin/sh


# check parameters first ?

OBJETIVOS=$1
PRAZO=$2
TEMPO_RESTANTE=$3
RODAPE=$4

cat << EOF
Subject:[$NOME_PROJETO - $FASE_PROJETO] Status parcial da iteração
Opa, pessoal.

Lembrando que temos que realizar...
$OBJETIVOS

... até o dia $PRAZO. Ainda nos restam $TEMPO_RESTANTE dias.  

Peço que me avisem caso visualizem a impossibilidade de não realizarmos qualquer um desses objetivos ou se houver algum outro problema importante.

Se acharem que há alguma informação importante a ser compartilhada, *avisem*.

Atenciosamente,
$RODAPE
EOF
