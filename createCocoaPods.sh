#!/bin/bash 
#create by vbn

if [ $# -lt 1 ];
then
	echo "必须输入参数,例如：-t projectName -v versionNumber "；
	exit -1;
fi

target_name=""
version_number="8.0"

while getopts ":t:v:" opt; do
  case $opt in
    t)
	    if [ -z "$OPTARG" ];
	    then
	    	echo "项目名称不能为空";
	    	exit -1;
		fi
	    target_name=$OPTARG;;
      
    v)
		if [ "$OPTARG" -lt "0" ];
		then 
			echo "版本号必须大于0";
			exit -1;
		fi
		version_number=$OPTARG;;

    \?)
      echo "无效参数 -$OPTARG,例如：-t projectName -v versionNumber";;
  esac
done

# >> echo to Podfile
echo "platform:ios,'$version_number'";
echo  "target '$target_name' do";
echo "#######Pods install there######";
echo "end";