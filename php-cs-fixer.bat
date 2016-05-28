@ECHO OFF
SET fixerScript=php-cs-fixer.phar
php "%~dp0%fixerScript%" %*
