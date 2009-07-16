#!/bin/bash
#
# Clone all the existing modules in the kow framework

MODULES="apq apq-ct_lib apq-mysql apq-odbc apq-postgresql apqprovider apqprovider-ct_lib apqprovider-mysql apqprovider-postgresql apq-sybase kowconfig kowconfig-text kowconfig-xml kowdb kowdist kowdist-corba kowent kowlib kowlog kowplug kowsec kowsec-entities kowview kowview-entities"


echo "This will clone all the KOW framework modules in the current directory except for the \"base\" module."
echo "This WILL take some time"



for module in $MODULES
do
	echo " ==== "
	echo " ==== "
	echo "Working on module $module"
	echo " ==== "
	echo " ==== "
	git clone git@kow.com.br:framework/$module.git
done



echo "All done! Now, source the export_path.sh script in the base module from this directory"
