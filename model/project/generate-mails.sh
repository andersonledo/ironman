#!/bin/bash

E_BADARGS=85

# check for arguments
if [ -z "$1" ]
then
  echo "Usage: `basename $0` iteration-folder"
  exit $E_BADARGS 
fi

ITERATION_FOLDER=`basename $1`


#path to templates folder

BASE_PATH="."
echo "Defining folder \"$BASE_PATH\" as the base path for info."

TPATH="../../templates"
echo "Defining folder \"$TPATH\" as the source for templates."

MAILS_PATH="$ITERATION_FOLDER/mails"
echo "Defining folder \"$MAILS_PATH\" as the target for mails."
if [ ! -d "$MAILS_PATH" ]; then
  mkdir "$MAILS_PATH"
  echo "Folder $MAILS_PATH created."
fi


INFO_PATH="$ITERATION_FOLDER/info"
echo "Defining folder \"$INFO_PATH\" as the source for information of the project."




#BIND IMPORTANT VARIABLES HERE... 
echo "Binding report details to variables." 

NOME_PROJETO=`cat $BASE_PATH/nome-projeto.info`
DEFEITOS_ABERTOS=`cat $INFO_PATH/defeitos-abertos.info`
EVENTOS=`cat $INFO_PATH/eventos.info`
INCIDENTES_EM_PROGRESSO=`cat $INFO_PATH/incidentes-em-progresso.info`
INCIDENTES_TRATADOS=`cat $INFO_PATH/incidentes-tratados.info`
ITENS_DETALHADOS=`cat $INFO_PATH/itens-detalhados.info`
MUDANCA_ESCOPO=`cat $INFO_PATH/mudanca-escopo.info`
OBJETIVOS=`cat $INFO_PATH/objetivos.info`
PRAZO=`cat $INFO_PATH/prazo.info`
TEMPO_RESTANTE=`cat $INFO_PATH/tempo-restante.info`
PROGRESSO_FISICO=`cat $INFO_PATH/progresso-fisico.info`
RELATOS_EM_AVALIACAO=`cat $INFO_PATH/relatos-em-avaliacao.info`
RELATOS_IMPLEMENTADOS=`cat $INFO_PATH/relatos-implementados.info`
RESUMO_METRICAS=`cat $INFO_PATH/resumo-metricas-tecnicas.info`
RISCOS=`cat $INFO_PATH/riscos.info`
RODAPE=`cat $BASE_PATH/rodape.info`
PONTOS_ATENCAO=`cat $INFO_PATH/pontos-atencao.info`

RESULTADOS_OBTIDOS=`cat $INFO_PATH/resultados-obtidos.info`
PLANO_PROXIMA_FASE=`cat $INFO_PATH/plano-proxima-fase.info`
PROXIMOS_EVENTOS_IMPORTANTES=`cat $INFO_PATH/proximos-eventos-importantes.info`


#CALL GENERATOR SCRIPT 
echo "Generating mails."

echo "Generationg email for asking report from the team."
$TPATH/./ask-for-report-on-problems.sh "$OBJETIVOS" "$PRAZO" "$TEMPO_RESTANTE" "$RODAPE" > $MAILS_PATH/ask-for-report-on-problems.mail 

echo "Generating email for inviting people for key events."
$TPATH/./invite-for-key-events.sh "$EVENTOS" "$RODAPE" > $MAILS_PATH/invite-for-key-events.mail

echo "Generating email for detailed project report."
$TPATH/./project-detailed-report.sh "$NOME_PROJETO" "$ITENS_DETALHADOS" "$RELATOS_IMPLEMENTADOS" "$RELATOS_EM_AVALIACAO" "$INCIDENTES_TRATADOS" "$INCIDENTES_EM_PROGRESSO" "$RISCOS" "$PROGRESSO_FISICO" "$RESUMO_METRICAS" "$DEFEITOS_ABERTOS" "$MUDANCA_ESCOPO" "$RODAPE" > $MAILS_PATH/project-detailed-report.mail 

echo "Generationg email for executive report."
$TPATH/./project-executive-report.sh "$NOME_PROJETO" "$RESULTADOS_OBTIDOS" "$PROGRESSO_FISICO" "$PLANO_PROXIMA_FASE" "$PONTOS_ATENCAO" "$PROXIMOS_EVENTOS_IMPORTANTES" "$RODAPE" > $MAILS_PATH/project-executive-report.mail

echo "Generationg email for remembering people of the next events."
$TPATH/./remember-next-events.sh "$PROXIMOS_EVENTOS_IMPORTANTES" > $MAILS_PATH/remember-next-events.mail




echo "Emails generated at $MAILS_PATH" 

exit
