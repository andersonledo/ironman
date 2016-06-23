#!/bin/sh

#parameters
NOME_PROJETO=$1
RESULTADOS_OBTIDOS=$2
PROGRESSO_FISICO=$3
PLANO_PROXIMO_MES=$4
PONTOS_DE_ATENCAO=$5
PROXIMOS_EVENTOS_IMPORTANTES=$6
RODAPE=$7


#template
cat << EOF 
Bom dia,

Segue status das atividades do $NOME_PROJETO no último mês.  

Os seguintes pontos foram trabalhados/entregues:
$RESULTADOS_OBTIDOS

Segundo os objetivos definidos no início do projeto, temos um progresso físico de $PROGRESSO_FISICO do trabalho.  

Os próximos pontos a serem trabalhados serão:
$PLANO_PROXIMO_MES 

Os pontos de atenção em tratamento são:
$PONTOS_DE_ATENCAO 

Os próximos eventos importantes do projeto são:
$PROXIMOS_EVENTOS_IMPORTANTES


Agradeço a todos que contribuem constantemente para o sucesso do projeto.

Atenciosamente,
$RODAPE
EOF
