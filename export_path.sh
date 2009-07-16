# Export the Ada Project Path

export ADA_PROJECT_PATH=$ADA_PROJECT_PATH:$PWD

for i in */ */samples
do
	export ADA_PROJECT_PATH=$ADA_PROJECT_PATH:$PWD/$i
done



if [ "$OSTYPE" = "darwin9.0" ]
then
	export OS="Darwin"
fi
