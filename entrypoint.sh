#!/usr/bin/env bash
set -e

echo "::group::Run CodeSigner"

echo "Running ESigner.com CodeSign Action ====>"
echo ""

if [[ "$INPUT_ENVIRONMENT_NAME" != "PROD" ]]; then
    cp /codesign/conf/code_sign_tool.properties /codesign/conf/code_sign_tool.properties.production
    cp /codesign/conf/code_sign_tool_demo.properties /codesign/conf/code_sign_tool.properties 
fi

echo "running command: /usr/bin/codesign $*"

/usr/bin/codesign "$*"

echo "::endgroup::"
exit 0
