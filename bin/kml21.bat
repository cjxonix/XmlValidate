@echo off
setlocal

rem %~dp0 is expanded pathname of the current script under NT
set XV_HOME=%~dp0..

if not exist "%XV_HOME%/bin/setenv.bat" goto rungradle
call "%XV_HOME%/bin/setenv.bat"
set OPTS=-Xmx64m
set SCHEMA=http://earth.google.com/kml/2.1
REM set SCHEMALOC=http://code.google.com/apis/kml/schema/kml21.xsd
set SCHEMALOC=%XV_HOME%\schemas\kml21.xsd
java %OPTS% -classpath "%CLASSPATH%" org.mitre.xml.validate.XmlValidate -kml -ns=%SCHEMA% "-schema=%SCHEMALOC%" %*
goto end

:rungradle
echo Must run "gradle setup" from XmlValidate home directory to configure batch file environment
:end