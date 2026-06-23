mount -o rw,remount /data
MODPATH=${0%/*}

# log
exec 2>$MODPATH/debug-pfsd.log
set -x

# function
set_perm() {
  chown $2:$3 $1 || return 1
  chmod $4 $1 || return 1
  local CON=$5
  [ -z $CON ] && CON=u:object_r:system_file:s0
  chcon $CON $1 || return 1
}
set_perm_recursive() {
  find $1 -type d 2>/dev/null | while read dir; do
    set_perm $dir $2 $3 $4 $6
  done
  find $1 -type f -o -type l 2>/dev/null | while read file; do
    set_perm $file $2 $3 $5 $6
  done
}

# permission
set_perm_recursive $MODPATH 0 0 0755 0644

# var
API=`getprop ro.build.version.sdk`
if [ ! -d $MODPATH/vendor ]\
|| [ -L $MODPATH/vendor ]; then
  MODSYSTEM=/system
fi

# permission
if [ "$API" -ge 26 ]; then
  DIRS=`find $MODPATH/vendor\
             $MODPATH/system/vendor -type d`
  for DIR in $DIRS; do
    chown 0.2000 $DIR
  done
  chcon -R u:object_r:system_lib_file:s0 $MODPATH/system/lib*
  chcon -R u:object_r:vendor_file:s0 $MODPATH$MODSYSTEM/vendor
fi

# directory 
DIR=/data/oplus
mkdir -p $DIR/common/sau_res/res/sys_uxdesign_appname
mkdir -p $DIR/cosa
mkdir -p $DIR/language/patch
mkdir -p $DIR/language/built-in
mkdir -p $DIR/multimedia/notifications
mkdir -p $DIR/multimedia/ringtones
mkdir -p $DIR/multimedia/ui
mkdir -p $DIR/oplusos/oplusdirect
mkdir -p $DIR/os/config
mkdir -p $DIR/os/displaycompat
mkdir -p $DIR/os/guardelf
mkdir -p $DIR/os/notification
mkdir -p $DIR/uxres/uxcolor/temp
mkdir -p $DIR/uxicons/choose
chmod -R 0777 $DIR
chown -R 1000.1000 $DIR
chcon -R u:object_r:system_data_file:s0 $DIR
DIR=/data/oppo
mkdir -p $DIR/multimedia/notifications
mkdir -p $DIR/multimedia/ringtones
mkdir -p $DIR/multimedia/ui
chmod -R 0777 $DIR
chown -R 1000.1000 $DIR
chcon -R u:object_r:system_data_file:s0 $DIR
DIR=/data/theme
mkdir -p $DIR/icons
mkdir -p $DIR/applying
mkdir -p $DIR/ring
mkdir -p $DIR/audio
mkdir -p $DIR/video
mkdir -p $DIR/store
mkdir -p $DIR/res/drawable-hdpi
mkdir -p $DIR/res/drawable-xhdpi
mkdir -p $DIR/res/drawable-xxhdpi
chmod -R 0777 $DIR
chown -R 1000.1000 $DIR
chcon -R u:object_r:system_data_file:s0 $DIR
DIR=/data/theme_bak
mkdir -p $DIR/customized_theme
chmod -R 0777 $DIR
chown -R 1000.1000 $DIR
chcon -R u:object_r:system_data_file:s0 $DIR
DIR=/data/format_unclear
mkdir -p $DIR/font
chmod -R 0777 $DIR
chown -R 1000.1000 $DIR
chcon -R u:object_r:system_data_file:s0 $DIR
DIR=/data/persist_log
mkdir -p $DIR/hprofdump
mkdir -p $DIR/aee_exp
mkdir -p $DIR/DCS/de/AEE_DB
mkdir -p $DIR/DCS/de/recovery_log
chmod -R 0777 $DIR
chown -R 1000.1000 $DIR
chcon -R u:object_r:system_data_file:s0 $DIR
DIR=/data/vendor/aee_exp
mkdir -p $DIR
chmod -R 0777 $DIR
chown -R 1000.1000 $DIR
chcon -R u:object_r:vendor_data_file:s0 $DIR

# cleaning
FILE=$MODPATH/cleaner.sh
if [ -f $FILE ]; then
  . $FILE
  mv -f $FILE $FILE.txt
fi


