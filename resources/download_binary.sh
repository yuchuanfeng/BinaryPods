#!/bin/bash

PROJECT_NAME=$1

# if [[ -f $PROJECT_NAME/lib/lib$PROJECT_NAME.a ]]; then
# 	echo "$PROJECT_NAME/lib/lib$PROJECT_NAME.a Exist"
# 	exit 0
# fi

UserName=`git config user.name`
# https://github.com/yuchuanfeng/BinaryPods.git
URL="https://github.com/${UserName}/${PROJECT_NAME}.git"
echo 'PROJECT_NAME' ${PROJECT_NAME}
echo 'UserName: ' $UserName
echo 'URL: '$URL

# cd $PodPath
# ls -l
rm -fr lib
mkdir binary_sources
cd binary_sources
git clone $URL -b binary --depth=1
cd ../
cp -fr binary_sources/$PROJECT_NAME/lib ./
rm -fr binary_sources