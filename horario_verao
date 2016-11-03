#!/bin/bash
md5zdump=$(md5sum /etc/localtime | awk '{print $1}') 
 	if [[ $md5zdump == 7613c2153980b60de4fb74f692d7c1eb ]]  
	then 
		echo ok 
	else 
 		echo nok 
	fi
