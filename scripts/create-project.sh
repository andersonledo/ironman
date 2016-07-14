#!magic

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
#checks if the path 'projects' exists and creates it otherwise.
if [ ! -d "$PROJECTS_PATH" ]; then
  mkdir "$PROJECTS_PATH"
  echo "Folder $PROJECTS_PATH created."
fi

NEW_PROJECT="$PROJECTS_PATH/$project_name"
if [ -d "$NEW_PROJECT" ]; then
  echo "Project $project_name already exists."
  exit 1 #choose a correct error code
fi 

cp -r $MODELS_PATH/project $NEW_PROJECT
echo "$project_name" > $PROJECTS_PATH/$project_name/nome-projeto.info

echo "Projeto $project_name criado com sucesso na pasta $PROJECTS_PATH."


exit 0
