@echo off
setlocal EnableExtensions EnableDelayedExpansion
REM Local Agentia quality gates (Windows).
REM Edit this script to match your project. Agentia runs it from the repo root during
REM `agentia cicd work test` (local by default) and `agentia cicd work submit` (unless --skip-local-tests).
REM The script must exit non-zero if any check fails.

echo ## Running Code Analyzer
sf code-analyzer run
if errorlevel 1 exit /b %errorlevel%

if defined AGENTIA_APEX_TEST_CLASSES (
  agentia cicd work test apex -t "!AGENTIA_APEX_TEST_CLASSES!"
  if errorlevel 1 exit /b %errorlevel%
)

echo ## Running LWC tests
npx sfdx-lwc-jest --
if errorlevel 1 exit /b %errorlevel%
