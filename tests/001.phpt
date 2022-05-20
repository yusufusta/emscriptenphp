--TEST--
Check if emscripten is loaded
--EXTENSIONS--
emscripten
--FILE--
<?php
echo 'The extension "emscripten" is available';
?>
--EXPECT--
The extension "emscripten" is available
