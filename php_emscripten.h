/* emscripten extension for PHP */

#ifndef PHP_EMSCRIPTEN_H
# define PHP_EMSCRIPTEN_H

extern zend_module_entry emscripten_module_entry;
# define phpext_emscripten_ptr &emscripten_module_entry

# define PHP_EMSCRIPTEN_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_EMSCRIPTEN)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_EMSCRIPTEN_H */
