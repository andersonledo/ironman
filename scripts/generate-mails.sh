#!/bin/sh

#path to templates folder

BASE_PATH="../../project"
echo "Defining folder \"$BASE_PATH\" as the base path for info."

TPATH="../../../templates"
echo "Defining folder \"$TPATH\" as the source for templates."

MAILS_PATH="mails"
echo "Defining folder \"$MAILS_PATH\" as the source for mails."

INFO_PATH="info"
echo "Defining folder \"$INFO_PATH\" as the source for information of the project."




#BIND IMPORTANT VARIABLES HERE... 
echo "Binding report details to variables." 

NOME_PROJETO=`cat $BASE_PATH/nome-projeto.info`
DEFEITOS_ABERTOS=`cat $INFO_PATH/defeitos-abertos.info`
EVENTOS=`cat $INFO_PATH/eventos.info`
INCIDENTES_EM_PROGRESSO=`cat $INFO_PATH/incidentes-em-progresso.info`
INCIDENTE_TRATADOS=`cat $INFO_PATH/incidentes-tratados.info`
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



#CALL GENERATOR SCRIPT 
echo "Generating mails."

echo "Generationg email for asking report from the team."
$TPATH/./ask-for-report-on-problems.sh "$OBJETIVOS" "$PRAZO" "$TEMPO_RESTANTE" "$RODAPE" > mails/ask-for-report-on-problems.mail

echo "Generating email for inviting people for key events."
$TPATH/./invite-for-key-events.sh "$EVENTOS" "$RODAPE" > mails/invite-for-key-events.mail

echo "Generating email for detailed project report."
$TPATH/./project-detailed-report.sh "$NOME_PROJETO" "$ITENS_DETALHADOS" "$RELATOS_IMPLEMENTADOS" "$RELATOS_EM_AVALIACAO" "$INCIDENTES_TRATADOS" "$INCIDENTES_EM_PROGRESSO" "$RISCOS $PROGRESSO_FISICO" "$RESUMO_METRICAS" "$DEFEITOS_ABERTOS" "$MUDANCA_ESCOPO" "$RODAPE" > mails/project-detailed-report.mail

echo "Generationg email for executive report."
$TPATH/./project-executive-report.sh "$NOME_PROJETO" "$RESULTADOS_OBTIDOS" "$PROGRESSO_FISICO" "$PLANO_PROXIMO_MES" "$PONTOS_ATENCAO" "$PROXIMOS_EVENTOS_IMPORTANTES" "$RODAPE" > mails/project-executive-report.mail

echo "Generationg email for remembering people of the next events."
$TPATH/./remember-next-events.sh "$PROXIMOS_EVENTOS_IMPORTANTES" > mails/remember-next-events.mail




echo "Emails generated at $MAILS_PATH" 

exit
