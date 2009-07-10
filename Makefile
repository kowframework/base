
MAIN_TARGETS=aw_lib aw_config apq_base apq_ct_lib apq_mysql apq_postgresql apq_sybase apq_provider apq_provider_mysql


all: ${MAIN_TARGETS}
	@echo "All done!"




aw_lib:
	make -C awlib
	make -C awlib/samples


aw_config: aw_lib
	make -C awconfig
	make -C awconfig-text
	make -C awconfig-text/samples
	#make -C awconfig-xml
	#make -C awconfig-xml/samples


aw_log: aw_lib aw_config
	make -C awlog
	make -C awlog/samples

aw_plug: aw_lib
	make -C awplug
	make -C awplug/samples
	make -C awplug-tutorial/interface
	#make -C awplug-tutorial/extending


apq_base: aw_lib 
	make -C apq
	make -C apq/samples

apq_mysql: apq_base
	make -C apq-mysql
	make -C apq-mysql/samples

apq_postgresql: apq_base
	make -C apq-postgresql
	make -C apq-postgresql/samples

apq_sybase: apq_base
	make -C apq-sybase
	make -C apq-sybase/samples

apq_ct_lib: apq_base
	make -C apq-ct_lib

apq_provider: apq_base
	make -C apqprovider

apq_provider_mysql: apq_provider
	make -C apqprovider-mysql



.DEFAULT:
	@$(MAKE) -C `basename $@ .dir`
