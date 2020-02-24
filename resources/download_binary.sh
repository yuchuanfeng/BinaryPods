#!/bin/bash

set -e

PROJECT_NAME=$1



if [[ -f $PROJECT_NAME/lib/lib$PROJECT_NAME.a ]]; then
	echo "$PROJECT_NAME/lib/lib$PROJECT_NAME.a Exist"
	exit 0
fi

UserName=`git config user.name`

URL="ssh://${UserName}@icode.baidu.com:8235/baidu/Education-iOS/${PROJECT_NAME}"
echo 'PROJECT_NAME' $1
echo 'UserName: ' $UserName
echo 'URL: '$URL

rm -fr $PROJECT_NAME/lib
mkdir binary_sources
cd binary_sources
git clone $URL -b binary --depth=1
cd ../
cp -fr binary_sources/$PROJECT_NAME/lib $PROJECT_NAME/
rm -fr binary_sources