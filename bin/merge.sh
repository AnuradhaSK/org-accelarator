#!/bin/bash

# merge.sh script copy the WSO2 organization management accelerator artifacts on top of WSO2 IS base product
#
# merge.sh <WSO2_IS_HOME>

WSO2_IS_HOME=$1

# set accelerator home
cd ../
ADDON_HOME=$(pwd)
echo "Accelerator home is: ${ADDON_HOME}"

# set product home
if [ "${WSO2_IS_HOME}" == "" ];
  then
    cd ../
    WSO2_IS_HOME=$(pwd)
    echo "Product home is: ${WSO2_IS_HOME}"
fi

# validate product home
if [ ! -d "${WSO2_IS_HOME}/repository/components" ]; then
  echo -e "\n\aERROR:specified product path is not a valid carbon product path\n";
  exit 2;
else
  echo -e "\nValid carbon product path.\n";
fi

echo -e "\nCopying organization management artifacts\n"
echo -e "================================================\n"
cp -r ${ADDON_HOME}/carbon-home/* "${WSO2_IS_HOME}"/
echo -e "\nComplete!\n"
