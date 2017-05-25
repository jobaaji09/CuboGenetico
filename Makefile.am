AUTOMAKE_OPTIONS = subdir-objects

COMMON_VALAFLAGS =			\
	--enable-experimental		\
	--target-glib=2.48		\
	--vapidir=$(srcdir)/vapi

# libtest
noinst_LTLIBRARIES = lib/libtest.la

lib_libtest_la_SOURCES = lib/test/test-case.vala

lib_libtest_la_VALAFLAGS =		\
	$(COMMON_VALAFLAGS)		\
	@GEE_PACKAGES@			\
	@GIO_PACKAGES@			\
	--header lib/test/test.h	\
	--vapi vapi/test.vapi

lib_libtest_la_CFLAGS =		\
	@GEE_CFLAGS@		\
	@GIO_CFLAGS@		\
	-I$(srcdir)/lib/test	\
	-w

lib_libtest_la_LIBADD = 	\
	@GEE_LIBS@		\
	@GIO_LIBS@		

#libcubo
noinst_LTLIBRARIES += lib/libcubo.la

lib_libcubo_la_SOURCES =lib/cubo/Cubo3x3.vala	

lib_libcubo_la_VALAFLAGS =		\
	$(COMMON_VALAFLAGS)		\
	@GEE_PACKAGES@			\
	@GIO_PACKAGES@			\
	--header lib/cubo/cubo.h	\
	--vapi vapi/cubo.vapi

lib_libcubo_la_CFLAGS =		\
	@GEE_CFLAGS@		\
	@GIO_CFLAGS@		\
	-w

lib_libcubo_la_LIBADD =		\
	@GEE_LIBS@		\
	@GIO_LIBS@	

#libcodificacion
noinst_LTLIBRARIES += lib/libcodificacion.la

lib_libcodificacion_la_SOURCES =lib/codificacion/FenoGeno.vala	

lib_libcodificacion_la_VALAFLAGS =			\
	$(COMMON_VALAFLAGS)				\
	@GEE_PACKAGES@					\
	@GIO_PACKAGES@					\
	--header lib/codificacion/codificacion.h	\
	--vapi vapi/codificacion.vapi

lib_libcodificacion_la_CFLAGS =	\
	@GEE_CFLAGS@		\
	@GIO_CFLAGS@		\
	-w

lib_libcodificacion_la_LIBADD =	\
	@GEE_LIBS@		\
	@GIO_LIBS@	

#libfuncion
#noinst_LTLIBRARIES += lib/libfuncion.la

#lib_libfuncion_la_SOURCES =		\
#	lib/funcion/FFitness.vala	
#	vapi/cubo.vapi			

#lib_libfuncion_la_VALAFLAGS =		\
#	$(COMMON_VALAFLAGS)		\
#	@GEE_PACKAGES@			\
#	@GIO_PACKAGES@			\
#	--header lib/funcion/funcion.h	\
#	--vapi vapi/funcion.vapi	

#lib_libfuncion_la_CFLAGS =	\
#	@GEE_CFLAGS@		\
#	@GIO_CFLAGS@		\
#	-I$(srcdir)/lib/cubo	\
#	-w

#lib_libfuncion_la_LIBADD =	\
#	lib/libcubo.la		\
#	@GEE_LIBS@		\
#	@GIO_LIBS@	


#CuboGenetico
bin_PROGRAMS = CuboGenetico
CUBOGENESOURCES =		\
	src/mx/unam/ciencias/hoc/CuboGenetico.vala

CuboGenetico_SOURCES = 		\
	$(CUBOGENESOURCES)	\
	src/mx/unam/ciencias/hoc/CuboGenetico-main.vala	\
	src/mx/unam/ciencias/hoc/FFitness.vala		\
	vapi/cubo.vapi		\
	vapi/codificacion.vapi	
#	vapi/funcion.vapi	

CuboGenetico_VALAFLAGS =	\
	--target-glib=2.38	\
	@GEE_PACKAGES@		\
	@GIO_PACKAGES@	

CuboGenetico_CFLAGS =			\
	@GEE_CFLAGS@			\
	@GIO_CFLAGS@			\
	-I$(srcdir)/lib/cubo		\
	-I$(srcdir)/lib/codificacion	\
	-w

CuboGenetico_LDADD =		\
	@GEE_LIBS@		\
	@GIO_LIBS@		\
	lib/libcubo.la		\
	lib/libcodificacion.la


# tests
TESTS = test/test-cubogenetico

TESTSOURCES =			\
	test/test-cubo3x3.vala	\
	test/test-codificacion.vala

test_test_cubogenetico_SOURCES =			\
	$(TESTSOURCES)				\
	test/test-cubogenetico-main.vala		\
	vapi/test.vapi				\
	vapi/cubo.vapi				\
	vapi/codificacion.vapi

test_test_cubogenetico_VALAFLAGS =			\
	$(COMMON_VALAFLAGS)			\
	@GEE_PACKAGES@				\
	@GIO_PACKAGES@				\
	--vapidir $(top_srcdir)/vapi

test_test_cubogenetico_CFLAGS =		\
	@GEE_CFLAGS@			\
	@GIO_CFLAGS@			\
	-I$(srcdir)/lib/test		\
	-I$(srcdir)/lib/cubo		\
	-I$(srcdir)/lib/codificacion
	-w

test_test_cubogenetico_LDADD =	\
	@GEE_LIBS@		\
	@GIO_LIBS@		\
	lib/libtest.la		\
	lib/libcubo.la		\
	lib/libcodificacion.la	\
	-lm

check_PROGRAMS = $(TESTS)



# valadoc
if HAVE_VALADOC

AM_V_VALADOC = $(AM_V_VALADOC_$(V))
AM_V_VALADOC_ = $(AM_V_VALADOC_$(AM_DEFAULT_VERBOSITY))
AM_V_VALADOC_0 = @echo "  VALADOC " $@;

docs: doc/aumbrales/index.htm

VALADOCSOURCES =						\
	$(lib_libtest_la_SOURCES)				\
	$(CUBOGENESOURCES)					\
	$(TESTSOURCES)

doc/cubogenetico/index.htm: $(VALADOCSOURCES)
	$(AM_V_VALADOC)$(VALADOC)				\
		--directory=doc					\
		--force						\
		--package-name=${PACKAGE}			\
		--package-version=${VERSION}			\
		--target-glib=2.38				\
		--vapidir=vapi					\
		--verbose					\
		@GEE_PACKAGES@					\
		$(VALADOCSOURCES)

clean-docs:
	-rm -rf doc/

clean-local: clean-docs

endif

