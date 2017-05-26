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

#libagenetico
noinst_LTLIBRARIES += lib/libagenetico.la

lib_libagenetico_la_SOURCES =			\
		lib/agenetico/Cubo3x3.vala	\
		lib/agenetico/Individuo.vala	

lib_libagenetico_la_VALAFLAGS =		\
	$(COMMON_VALAFLAGS)		\
	@GEE_PACKAGES@			\
	@GIO_PACKAGES@			\
	--header lib/agenetico/agenetico.h	\
	--vapi vapi/agenetico.vapi

lib_libagenetico_la_CFLAGS =	\
	@GEE_CFLAGS@		\
	@GIO_CFLAGS@		\
	-w

lib_libagenetico_la_LIBADD =	\
	@GEE_LIBS@		\
	@GIO_LIBS@	



#CuboGenetico
bin_PROGRAMS = CuboGenetico
CUBOGENESOURCES =		\
	src/mx/unam/ciencias/hoc/CuboGenetico.vala \
	src/mx/unam/ciencias/hoc/FenoGeno.vala 	   \
	src/mx/unam/ciencias/hoc/FFitness.vala 	   \
	src/mx/unam/ciencias/hoc/Poblacion.vala	\
	src/mx/unam/ciencias/hoc/Criador.vala

CuboGenetico_SOURCES = 		\
	$(CUBOGENESOURCES)	\
	src/mx/unam/ciencias/hoc/CuboGenetico-main.vala	\
	vapi/agenetico.vapi	

CuboGenetico_VALAFLAGS =	\
	--target-glib=2.38	\
	@GEE_PACKAGES@		\
	@GIO_PACKAGES@	

CuboGenetico_CFLAGS =			\
	@GEE_CFLAGS@			\
	@GIO_CFLAGS@			\
	-I$(srcdir)/lib/agenetico	\
	-w

CuboGenetico_LDADD =		\
	@GEE_LIBS@		\
	@GIO_LIBS@		\
	lib/libagenetico.la		


# tests
TESTS = test/test-cubogenetico

TESTSOURCES =			\
	test/test-cubo3x3.vala	\
	test/test-codificacion.vala

test_test_cubogenetico_SOURCES =			\
	$(TESTSOURCES)				\
	test/test-cubogenetico-main.vala		\
	vapi/test.vapi				\
	vapi/agenetico.vapi

test_test_cubogenetico_VALAFLAGS =			\
	$(COMMON_VALAFLAGS)			\
	@GEE_PACKAGES@				\
	@GIO_PACKAGES@				\
	--vapidir $(top_srcdir)/vapi

test_test_cubogenetico_CFLAGS =		\
	@GEE_CFLAGS@			\
	@GIO_CFLAGS@			\
	-I$(srcdir)/lib/test		\
	-I$(srcdir)/lib/agenetico	\
	-w

test_test_cubogenetico_LDADD =	\
	@GEE_LIBS@		\
	@GIO_LIBS@		\
	lib/libtest.la		\
	lib/libagenetico.la	\
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

