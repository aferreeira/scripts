#!/bin/bash
mypid=`ps -ef | grep -v grep | grep br.com.netshoes.rastreamento.main.Execute | head -n 1 | awk '{print $2}'`
if [ -n "$mypid"  ] ; then
  init=`stat -t /proc/$mypid | awk '{print $14}'`
  curr=`date +%s`
  seconds=`echo $curr - $init| bc`
  name=`cat /proc/$mypid/cmdline`
    if [ $seconds -ge 7200 ] ; then
      kill -9 $mypid
    fi
fi
exit
