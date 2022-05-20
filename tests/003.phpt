--TEST--
test2() Basic test
--EXTENSIONS--
emscripten
--FILE--
<?php
var_dump(js('PHP'));
?>
--EXPECT--
string(9) "Hello PHP"
