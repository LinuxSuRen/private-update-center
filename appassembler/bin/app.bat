@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\jvnet\hudson\crypto-util\1.0\crypto-util-1.0.jar;"%REPO%"\dom4j\dom4j\1.6.1\dom4j-1.6.1.jar;"%REPO%"\xml-apis\xml-apis\1.0.b2\xml-apis-1.0.b2.jar;"%REPO%"\com\squareup\okhttp3\okhttp-urlconnection\3.10.0\okhttp-urlconnection-3.10.0.jar;"%REPO%"\com\squareup\okhttp3\okhttp\3.10.0\okhttp-3.10.0.jar;"%REPO%"\com\squareup\okio\okio\1.14.0\okio-1.14.0.jar;"%REPO%"\jaxen\jaxen\1.1.1\jaxen-1.1.1.jar;"%REPO%"\jdom\jdom\1.0\jdom-1.0.jar;"%REPO%"\xerces\xercesImpl\2.6.2\xercesImpl-2.6.2.jar;"%REPO%"\xom\xom\1.0\xom-1.0.jar;"%REPO%"\xerces\xmlParserAPIs\2.6.2\xmlParserAPIs-2.6.2.jar;"%REPO%"\xalan\xalan\2.6.0\xalan-2.6.0.jar;"%REPO%"\com\ibm\icu\icu4j\2.6.1\icu4j-2.6.1.jar;"%REPO%"\org\kohsuke\github-api\1.93\github-api-1.93.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.9.2\jackson-databind-2.9.2.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.9.0\jackson-annotations-2.9.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.9.2\jackson-core-2.9.2.jar;"%REPO%"\com\sun\xml\bind\jaxb-impl\2.1.6\jaxb-impl-2.1.6.jar;"%REPO%"\javax\xml\bind\jaxb-api\2.1\jaxb-api-2.1.jar;"%REPO%"\javax\xml\stream\stax-api\1.0-2\stax-api-1.0-2.jar;"%REPO%"\javax\activation\activation\1.1\activation-1.1.jar;"%REPO%"\org\kohsuke\stapler\json-lib\2.1-rev7\json-lib-2.1-rev7.jar;"%REPO%"\commons-beanutils\commons-beanutils\1.7.0\commons-beanutils-1.7.0.jar;"%REPO%"\commons-collections\commons-collections\3.2\commons-collections-3.2.jar;"%REPO%"\commons-lang\commons-lang\2.3\commons-lang-2.3.jar;"%REPO%"\commons-logging\commons-logging\1.1\commons-logging-1.1.jar;"%REPO%"\net\sf\ezmorph\ezmorph\1.0.3\ezmorph-1.0.3.jar;"%REPO%"\com\google\code\gson\gson\2.8.5\gson-2.8.5.jar;"%REPO%"\commons-io\commons-io\2.6\commons-io-2.6.jar;"%REPO%"\org\apache\commons\commons-lang3\3.7\commons-lang3-3.7.jar;"%REPO%"\commons-codec\commons-codec\1.11\commons-codec-1.11.jar;"%REPO%"\args4j\args4j\2.0.19\args4j-2.0.19.jar;"%REPO%"\org\sonatype\nexus\nexus-indexer\2.0.0\nexus-indexer-2.0.0.jar;"%REPO%"\org\codehaus\plexus\plexus-component-annotations\1.0-beta-3.0.5\plexus-component-annotations-1.0-beta-3.0.5.jar;"%REPO%"\org\codehaus\plexus\plexus-utils\1.5.5\plexus-utils-1.5.5.jar;"%REPO%"\org\codehaus\plexus\plexus-cli\1.2\plexus-cli-1.2.jar;"%REPO%"\org\apache\lucene\lucene-core\2.3.2\lucene-core-2.3.2.jar;"%REPO%"\commons-cli\commons-cli\1.0\commons-cli-1.0.jar;"%REPO%"\org\apache\maven\archetype\archetype-common\2.0-alpha-1\archetype-common-2.0-alpha-1.jar;"%REPO%"\net\sourceforge\jchardet\jchardet\1.0\jchardet-1.0.jar;"%REPO%"\org\codehaus\plexus\plexus-velocity\1.1.3\plexus-velocity-1.1.3.jar;"%REPO%"\org\apache\maven\maven-model\2.0.8\maven-model-2.0.8.jar;"%REPO%"\org\apache\maven\wagon\wagon-provider-api\1.0-beta-5\wagon-provider-api-1.0-beta-5.jar;"%REPO%"\org\codehaus\plexus\plexus-container-default\1.5.5\plexus-container-default-1.5.5.jar;"%REPO%"\org\codehaus\plexus\plexus-classworlds\2.2.2\plexus-classworlds-2.2.2.jar;"%REPO%"\org\apache\xbean\xbean-reflect\3.4\xbean-reflect-3.4.jar;"%REPO%"\log4j\log4j\1.2.12\log4j-1.2.12.jar;"%REPO%"\commons-logging\commons-logging-api\1.1\commons-logging-api-1.1.jar;"%REPO%"\junit\junit\3.8.2\junit-3.8.2.jar;"%REPO%"\org\apache\maven\wagon\wagon-http\1.0-beta-5\wagon-http-1.0-beta-5.jar;"%REPO%"\org\apache\maven\wagon\wagon-http-shared\1.0-beta-5\wagon-http-shared-1.0-beta-5.jar;"%REPO%"\nekohtml\xercesMinimal\1.9.6.2\xercesMinimal-1.9.6.2.jar;"%REPO%"\nekohtml\nekohtml\1.9.6.2\nekohtml-1.9.6.2.jar;"%REPO%"\commons-httpclient\commons-httpclient\3.1\commons-httpclient-3.1.jar;"%REPO%"\org\apache\maven\maven-compat\3.0-alpha-2\maven-compat-3.0-alpha-2.jar;"%REPO%"\org\jenkins-ci\version-number\1.4\version-number-1.4.jar;"%REPO%"\bouncycastle\bcprov-jdk15\140\bcprov-jdk15-140.jar;"%REPO%"\org\apache\ant\ant\1.8.1\ant-1.8.1.jar;"%REPO%"\org\apache\ant\ant-launcher\1.8.1\ant-launcher-1.8.1.jar;"%REPO%"\jetty\jetty-util\6.0.0rc1\jetty-util-6.0.0rc1.jar;"%REPO%"\com\googlecode\owasp-java-html-sanitizer\owasp-java-html-sanitizer\20180219.1\owasp-java-html-sanitizer-20180219.1.jar;"%REPO%"\com\google\guava\guava\19.0\guava-19.0.jar;"%REPO%"\org\jenkins-ci\update-center2\2.1-SNAPSHOT\update-center2-2.1-SNAPSHOT.jar
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="app" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" org.jvnet.hudson.update_center.Main %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
