#!/bin/sh

E_BADARGS=85

# check for arguments
if [ -z "$1" ]
then
  echo "Usage: `basename $0` project-name"
  exit $E_BADARGS 
fi

project_name=`basename $1`




MODELS_PATH="../model"
PROJECTS_PATH="../projects"

cp -r $MODELS_PATH/project $PROJECTS_PATH/$project_name
echo "$project_name" > $PROJECTS_PATH/$project_name/nome-projeto.info

echo "Projeto $project_name criado com sucesso na pasta $PROJECTS_PATH."

exit 0
