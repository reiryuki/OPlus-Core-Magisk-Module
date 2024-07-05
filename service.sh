MODPATH=${0%/*}

# log
LOGFILE=$MODPATH/debug.log
exec 2>$LOGFILE
set -x

# property
PROP=ro.build.version.oplusrom
if [ ! "`getprop $PROP`" ]; then
  resetprop -n $PROP V14.0.0
fi


