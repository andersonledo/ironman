#!/bin/sh

E_BADARGS=85

# check for arguments
if [ -z "$1" ]
then
  echo "Usage: `basename $0` project-name"
  exit $E_BADARGS 
fi

project_name=`basename $1`

echo "Informe o nome da iteração que deseja criar:"
read iteration_name



MODELS_PATH="../model"
PROJECTS_PATH="../projects"

cp -r $MODELS_PATH/project/iteration $PROJECTS_PATH/$project_name/$iteration_name

echo "Iteração $iteration_name criada com sucesso na pasta $PROJECTS_PATH/$project_name."

exit 0
