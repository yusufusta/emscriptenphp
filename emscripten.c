/* emscripten extension for PHP */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_emscripten.h"
#include "emscripten_arginfo.h"
#include <emscripten.h>

/* For compatibility with older PHP versions */
#ifndef ZEND_PARSE_PARAMETERS_NONE
#define ZEND_PARSE_PARAMETERS_NONE() \
	ZEND_PARSE_PARAMETERS_START(0, 0) \
	ZEND_PARSE_PARAMETERS_END()
#endif

/* {{{ string js( [ string $code ] ) */
PHP_FUNCTION(js)
{
	char *code = "console.log('Hello, world!');";
	size_t var_len = sizeof("console.log('Hello, world!');") - 1;
	zend_string *retval;

	ZEND_PARSE_PARAMETERS_START(0, 1)
		Z_PARAM_OPTIONAL
		Z_PARAM_STRING(code, var_len)
	ZEND_PARSE_PARAMETERS_END();

	retval = emscripten_run_script_string(code);

	RETURN_STR(retval);
}
/* }}}*/

/* {{{ string js( [ string $code ] ) */
PHP_FUNCTION(js2)
{
	char *code = "console.log('Hello, world!');";
	size_t var_len = sizeof("console.log('Hello, world!');") - 1;
	zend_string *retval;

	ZEND_PARSE_PARAMETERS_START(0, 1)
		Z_PARAM_OPTIONAL
		Z_PARAM_STRING(code, var_len)
	ZEND_PARSE_PARAMETERS_END();

	retval = emscripten_run_script_int(code);

	RETURN_NULL();
}
/* }}}*/

/* {{{ PHP_RINIT_FUNCTION */
PHP_RINIT_FUNCTION(emscripten)
{
#if defined(ZTS) && defined(COMPILE_DL_EMSCRIPTEN)
	ZEND_TSRMLS_CACHE_UPDATE();
#endif

	return SUCCESS;
}
/* }}} */

/* {{{ PHP_MINFO_FUNCTION */
PHP_MINFO_FUNCTION(emscripten)
{
	php_info_print_table_start();
	php_info_print_table_header(2, "emscripten support", "enabled");
	php_info_print_table_end();
}
/* }}} */

/* {{{ emscripten_module_entry */
zend_module_entry emscripten_module_entry = {
	STANDARD_MODULE_HEADER,
	"emscripten",					/* Extension name */
	ext_functions,					/* zend_function_entry */
	NULL,							/* PHP_MINIT - Module initialization */
	NULL,							/* PHP_MSHUTDOWN - Module shutdown */
	PHP_RINIT(emscripten),			/* PHP_RINIT - Request initialization */
	NULL,							/* PHP_RSHUTDOWN - Request shutdown */
	PHP_MINFO(emscripten),			/* PHP_MINFO - Module info */
	PHP_EMSCRIPTEN_VERSION,		/* Version */
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_EMSCRIPTEN
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(emscripten)
#endif
