/* Poblacion.c generated by valac 0.34.8, the Vala compiler
 * generated from Poblacion.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include "agenetico.h"
#include <gobject/gvaluecollector.h>


#define CUBO_GENETICO_TYPE_POBLACION (cubo_genetico_poblacion_get_type ())
#define CUBO_GENETICO_POBLACION(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), CUBO_GENETICO_TYPE_POBLACION, CuboGeneticoPoblacion))
#define CUBO_GENETICO_POBLACION_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), CUBO_GENETICO_TYPE_POBLACION, CuboGeneticoPoblacionClass))
#define CUBO_GENETICO_IS_POBLACION(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), CUBO_GENETICO_TYPE_POBLACION))
#define CUBO_GENETICO_IS_POBLACION_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), CUBO_GENETICO_TYPE_POBLACION))
#define CUBO_GENETICO_POBLACION_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), CUBO_GENETICO_TYPE_POBLACION, CuboGeneticoPoblacionClass))

typedef struct _CuboGeneticoPoblacion CuboGeneticoPoblacion;
typedef struct _CuboGeneticoPoblacionClass CuboGeneticoPoblacionClass;
typedef struct _CuboGeneticoPoblacionPrivate CuboGeneticoPoblacionPrivate;
#define __g_list_free__g_object_unref0_0(var) ((var == NULL) ? NULL : (var = (_g_list_free__g_object_unref0_ (var), NULL)))
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))
typedef struct _CuboGeneticoParamSpecPoblacion CuboGeneticoParamSpecPoblacion;

struct _CuboGeneticoPoblacion {
	GTypeInstance parent_instance;
	volatile int ref_count;
	CuboGeneticoPoblacionPrivate * priv;
};

struct _CuboGeneticoPoblacionClass {
	GTypeClass parent_class;
	void (*finalize) (CuboGeneticoPoblacion *self);
};

struct _CuboGeneticoPoblacionPrivate {
	GList* poblacion;
	gint _generacion;
	CuboGeneticoAGeneticoIndividuo* _mejorInd;
};

struct _CuboGeneticoParamSpecPoblacion {
	GParamSpec parent_instance;
};


static gpointer cubo_genetico_poblacion_parent_class = NULL;

gpointer cubo_genetico_poblacion_ref (gpointer instance);
void cubo_genetico_poblacion_unref (gpointer instance);
GParamSpec* cubo_genetico_param_spec_poblacion (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags);
void cubo_genetico_value_set_poblacion (GValue* value, gpointer v_object);
void cubo_genetico_value_take_poblacion (GValue* value, gpointer v_object);
gpointer cubo_genetico_value_get_poblacion (const GValue* value);
GType cubo_genetico_poblacion_get_type (void) G_GNUC_CONST;
#define CUBO_GENETICO_POBLACION_GET_PRIVATE(o) (G_TYPE_INSTANCE_GET_PRIVATE ((o), CUBO_GENETICO_TYPE_POBLACION, CuboGeneticoPoblacionPrivate))
enum  {
	CUBO_GENETICO_POBLACION_DUMMY_PROPERTY
};
static void _g_object_unref0_ (gpointer var);
static void _g_list_free__g_object_unref0_ (GList* self);
CuboGeneticoPoblacion* cubo_genetico_poblacion_new (void);
CuboGeneticoPoblacion* cubo_genetico_poblacion_construct (GType object_type);
void cubo_genetico_poblacion_set_generacion (CuboGeneticoPoblacion* self, gint value);
void cubo_genetico_poblacion_agregaIndividuo (CuboGeneticoPoblacion* self, CuboGeneticoAGeneticoIndividuo* ind);
CuboGeneticoAGeneticoIndividuo* cubo_genetico_poblacion_get_mejorInd (CuboGeneticoPoblacion* self);
void cubo_genetico_poblacion_set_mejorInd (CuboGeneticoPoblacion* self, CuboGeneticoAGeneticoIndividuo* value);
CuboGeneticoAGeneticoIndividuo* cubo_genetico_poblacion_getIndividuo (CuboGeneticoPoblacion* self, gint i);
gint cubo_genetico_poblacion_getTam (CuboGeneticoPoblacion* self);
gint cubo_genetico_poblacion_get_generacion (CuboGeneticoPoblacion* self);
static void cubo_genetico_poblacion_finalize (CuboGeneticoPoblacion* obj);


static void _g_object_unref0_ (gpointer var) {
	(var == NULL) ? NULL : (var = (g_object_unref (var), NULL));
}


static void _g_list_free__g_object_unref0_ (GList* self) {
	g_list_foreach (self, (GFunc) _g_object_unref0_, NULL);
	g_list_free (self);
}


CuboGeneticoPoblacion* cubo_genetico_poblacion_construct (GType object_type) {
	CuboGeneticoPoblacion* self = NULL;
	self = (CuboGeneticoPoblacion*) g_type_create_instance (object_type);
	cubo_genetico_poblacion_set_generacion (self, 0);
	__g_list_free__g_object_unref0_0 (self->priv->poblacion);
	self->priv->poblacion = NULL;
	return self;
}


CuboGeneticoPoblacion* cubo_genetico_poblacion_new (void) {
	return cubo_genetico_poblacion_construct (CUBO_GENETICO_TYPE_POBLACION);
}


static gpointer _g_object_ref0 (gpointer self) {
	return self ? g_object_ref (self) : NULL;
}


void cubo_genetico_poblacion_agregaIndividuo (CuboGeneticoPoblacion* self, CuboGeneticoAGeneticoIndividuo* ind) {
	CuboGeneticoAGeneticoIndividuo* _tmp0_ = NULL;
	CuboGeneticoAGeneticoIndividuo* _tmp9_ = NULL;
	CuboGeneticoAGeneticoIndividuo* _tmp10_ = NULL;
	g_return_if_fail (self != NULL);
	g_return_if_fail (ind != NULL);
	_tmp0_ = self->priv->_mejorInd;
	if (_tmp0_ == NULL) {
		CuboGeneticoAGeneticoIndividuo* _tmp1_ = NULL;
		_tmp1_ = ind;
		cubo_genetico_poblacion_set_mejorInd (self, _tmp1_);
	} else {
		CuboGeneticoAGeneticoIndividuo* _tmp2_ = NULL;
		gdouble _tmp3_ = 0.0;
		gdouble _tmp4_ = 0.0;
		CuboGeneticoAGeneticoIndividuo* _tmp5_ = NULL;
		gdouble _tmp6_ = 0.0;
		gdouble _tmp7_ = 0.0;
		_tmp2_ = self->priv->_mejorInd;
		_tmp3_ = cubo_genetico_agenetico_individuo_get_fitness (_tmp2_);
		_tmp4_ = _tmp3_;
		_tmp5_ = ind;
		_tmp6_ = cubo_genetico_agenetico_individuo_get_fitness (_tmp5_);
		_tmp7_ = _tmp6_;
		if (_tmp4_ < _tmp7_) {
			CuboGeneticoAGeneticoIndividuo* _tmp8_ = NULL;
			_tmp8_ = ind;
			cubo_genetico_poblacion_set_mejorInd (self, _tmp8_);
		}
	}
	_tmp9_ = ind;
	_tmp10_ = _g_object_ref0 (_tmp9_);
	self->priv->poblacion = g_list_append (self->priv->poblacion, _tmp10_);
}


CuboGeneticoAGeneticoIndividuo* cubo_genetico_poblacion_getIndividuo (CuboGeneticoPoblacion* self, gint i) {
	CuboGeneticoAGeneticoIndividuo* result = NULL;
	GList* _tmp0_ = NULL;
	gint _tmp1_ = 0;
	gconstpointer _tmp2_ = NULL;
	CuboGeneticoAGeneticoIndividuo* _tmp3_ = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	_tmp0_ = self->priv->poblacion;
	_tmp1_ = i;
	_tmp2_ = g_list_nth_data (_tmp0_, (guint) _tmp1_);
	_tmp3_ = _g_object_ref0 ((CuboGeneticoAGeneticoIndividuo*) _tmp2_);
	result = _tmp3_;
	return result;
}


gint cubo_genetico_poblacion_getTam (CuboGeneticoPoblacion* self) {
	gint result = 0;
	GList* _tmp0_ = NULL;
	guint _tmp1_ = 0U;
	g_return_val_if_fail (self != NULL, 0);
	_tmp0_ = self->priv->poblacion;
	_tmp1_ = g_list_length (_tmp0_);
	result = (gint) _tmp1_;
	return result;
}


gint cubo_genetico_poblacion_get_generacion (CuboGeneticoPoblacion* self) {
	gint result;
	gint _tmp0_ = 0;
	g_return_val_if_fail (self != NULL, 0);
	_tmp0_ = self->priv->_generacion;
	result = _tmp0_;
	return result;
}


void cubo_genetico_poblacion_set_generacion (CuboGeneticoPoblacion* self, gint value) {
	gint _tmp0_ = 0;
	g_return_if_fail (self != NULL);
	_tmp0_ = value;
	self->priv->_generacion = _tmp0_;
}


CuboGeneticoAGeneticoIndividuo* cubo_genetico_poblacion_get_mejorInd (CuboGeneticoPoblacion* self) {
	CuboGeneticoAGeneticoIndividuo* result;
	CuboGeneticoAGeneticoIndividuo* _tmp0_ = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	_tmp0_ = self->priv->_mejorInd;
	result = _tmp0_;
	return result;
}


void cubo_genetico_poblacion_set_mejorInd (CuboGeneticoPoblacion* self, CuboGeneticoAGeneticoIndividuo* value) {
	CuboGeneticoAGeneticoIndividuo* _tmp0_ = NULL;
	CuboGeneticoAGeneticoIndividuo* _tmp1_ = NULL;
	g_return_if_fail (self != NULL);
	_tmp0_ = value;
	_tmp1_ = _g_object_ref0 (_tmp0_);
	_g_object_unref0 (self->priv->_mejorInd);
	self->priv->_mejorInd = _tmp1_;
}


static void cubo_genetico_value_poblacion_init (GValue* value) {
	value->data[0].v_pointer = NULL;
}


static void cubo_genetico_value_poblacion_free_value (GValue* value) {
	if (value->data[0].v_pointer) {
		cubo_genetico_poblacion_unref (value->data[0].v_pointer);
	}
}


static void cubo_genetico_value_poblacion_copy_value (const GValue* src_value, GValue* dest_value) {
	if (src_value->data[0].v_pointer) {
		dest_value->data[0].v_pointer = cubo_genetico_poblacion_ref (src_value->data[0].v_pointer);
	} else {
		dest_value->data[0].v_pointer = NULL;
	}
}


static gpointer cubo_genetico_value_poblacion_peek_pointer (const GValue* value) {
	return value->data[0].v_pointer;
}


static gchar* cubo_genetico_value_poblacion_collect_value (GValue* value, guint n_collect_values, GTypeCValue* collect_values, guint collect_flags) {
	if (collect_values[0].v_pointer) {
		CuboGeneticoPoblacion* object;
		object = collect_values[0].v_pointer;
		if (object->parent_instance.g_class == NULL) {
			return g_strconcat ("invalid unclassed object pointer for value type `", G_VALUE_TYPE_NAME (value), "'", NULL);
		} else if (!g_value_type_compatible (G_TYPE_FROM_INSTANCE (object), G_VALUE_TYPE (value))) {
			return g_strconcat ("invalid object type `", g_type_name (G_TYPE_FROM_INSTANCE (object)), "' for value type `", G_VALUE_TYPE_NAME (value), "'", NULL);
		}
		value->data[0].v_pointer = cubo_genetico_poblacion_ref (object);
	} else {
		value->data[0].v_pointer = NULL;
	}
	return NULL;
}


static gchar* cubo_genetico_value_poblacion_lcopy_value (const GValue* value, guint n_collect_values, GTypeCValue* collect_values, guint collect_flags) {
	CuboGeneticoPoblacion** object_p;
	object_p = collect_values[0].v_pointer;
	if (!object_p) {
		return g_strdup_printf ("value location for `%s' passed as NULL", G_VALUE_TYPE_NAME (value));
	}
	if (!value->data[0].v_pointer) {
		*object_p = NULL;
	} else if (collect_flags & G_VALUE_NOCOPY_CONTENTS) {
		*object_p = value->data[0].v_pointer;
	} else {
		*object_p = cubo_genetico_poblacion_ref (value->data[0].v_pointer);
	}
	return NULL;
}


GParamSpec* cubo_genetico_param_spec_poblacion (const gchar* name, const gchar* nick, const gchar* blurb, GType object_type, GParamFlags flags) {
	CuboGeneticoParamSpecPoblacion* spec;
	g_return_val_if_fail (g_type_is_a (object_type, CUBO_GENETICO_TYPE_POBLACION), NULL);
	spec = g_param_spec_internal (G_TYPE_PARAM_OBJECT, name, nick, blurb, flags);
	G_PARAM_SPEC (spec)->value_type = object_type;
	return G_PARAM_SPEC (spec);
}


gpointer cubo_genetico_value_get_poblacion (const GValue* value) {
	g_return_val_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, CUBO_GENETICO_TYPE_POBLACION), NULL);
	return value->data[0].v_pointer;
}


void cubo_genetico_value_set_poblacion (GValue* value, gpointer v_object) {
	CuboGeneticoPoblacion* old;
	g_return_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, CUBO_GENETICO_TYPE_POBLACION));
	old = value->data[0].v_pointer;
	if (v_object) {
		g_return_if_fail (G_TYPE_CHECK_INSTANCE_TYPE (v_object, CUBO_GENETICO_TYPE_POBLACION));
		g_return_if_fail (g_value_type_compatible (G_TYPE_FROM_INSTANCE (v_object), G_VALUE_TYPE (value)));
		value->data[0].v_pointer = v_object;
		cubo_genetico_poblacion_ref (value->data[0].v_pointer);
	} else {
		value->data[0].v_pointer = NULL;
	}
	if (old) {
		cubo_genetico_poblacion_unref (old);
	}
}


void cubo_genetico_value_take_poblacion (GValue* value, gpointer v_object) {
	CuboGeneticoPoblacion* old;
	g_return_if_fail (G_TYPE_CHECK_VALUE_TYPE (value, CUBO_GENETICO_TYPE_POBLACION));
	old = value->data[0].v_pointer;
	if (v_object) {
		g_return_if_fail (G_TYPE_CHECK_INSTANCE_TYPE (v_object, CUBO_GENETICO_TYPE_POBLACION));
		g_return_if_fail (g_value_type_compatible (G_TYPE_FROM_INSTANCE (v_object), G_VALUE_TYPE (value)));
		value->data[0].v_pointer = v_object;
	} else {
		value->data[0].v_pointer = NULL;
	}
	if (old) {
		cubo_genetico_poblacion_unref (old);
	}
}


static void cubo_genetico_poblacion_class_init (CuboGeneticoPoblacionClass * klass) {
	cubo_genetico_poblacion_parent_class = g_type_class_peek_parent (klass);
	((CuboGeneticoPoblacionClass *) klass)->finalize = cubo_genetico_poblacion_finalize;
	g_type_class_add_private (klass, sizeof (CuboGeneticoPoblacionPrivate));
}


static void cubo_genetico_poblacion_instance_init (CuboGeneticoPoblacion * self) {
	self->priv = CUBO_GENETICO_POBLACION_GET_PRIVATE (self);
	self->ref_count = 1;
}


static void cubo_genetico_poblacion_finalize (CuboGeneticoPoblacion* obj) {
	CuboGeneticoPoblacion * self;
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, CUBO_GENETICO_TYPE_POBLACION, CuboGeneticoPoblacion);
	g_signal_handlers_destroy (self);
	__g_list_free__g_object_unref0_0 (self->priv->poblacion);
	_g_object_unref0 (self->priv->_mejorInd);
}


GType cubo_genetico_poblacion_get_type (void) {
	static volatile gsize cubo_genetico_poblacion_type_id__volatile = 0;
	if (g_once_init_enter (&cubo_genetico_poblacion_type_id__volatile)) {
		static const GTypeValueTable g_define_type_value_table = { cubo_genetico_value_poblacion_init, cubo_genetico_value_poblacion_free_value, cubo_genetico_value_poblacion_copy_value, cubo_genetico_value_poblacion_peek_pointer, "p", cubo_genetico_value_poblacion_collect_value, "p", cubo_genetico_value_poblacion_lcopy_value };
		static const GTypeInfo g_define_type_info = { sizeof (CuboGeneticoPoblacionClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) cubo_genetico_poblacion_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (CuboGeneticoPoblacion), 0, (GInstanceInitFunc) cubo_genetico_poblacion_instance_init, &g_define_type_value_table };
		static const GTypeFundamentalInfo g_define_type_fundamental_info = { (G_TYPE_FLAG_CLASSED | G_TYPE_FLAG_INSTANTIATABLE | G_TYPE_FLAG_DERIVABLE | G_TYPE_FLAG_DEEP_DERIVABLE) };
		GType cubo_genetico_poblacion_type_id;
		cubo_genetico_poblacion_type_id = g_type_register_fundamental (g_type_fundamental_next (), "CuboGeneticoPoblacion", &g_define_type_info, &g_define_type_fundamental_info, 0);
		g_once_init_leave (&cubo_genetico_poblacion_type_id__volatile, cubo_genetico_poblacion_type_id);
	}
	return cubo_genetico_poblacion_type_id__volatile;
}


gpointer cubo_genetico_poblacion_ref (gpointer instance) {
	CuboGeneticoPoblacion* self;
	self = instance;
	g_atomic_int_inc (&self->ref_count);
	return instance;
}


void cubo_genetico_poblacion_unref (gpointer instance) {
	CuboGeneticoPoblacion* self;
	self = instance;
	if (g_atomic_int_dec_and_test (&self->ref_count)) {
		CUBO_GENETICO_POBLACION_GET_CLASS (self)->finalize (self);
		g_type_free_instance ((GTypeInstance *) self);
	}
}



