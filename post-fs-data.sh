mount -o rw,remount /data
MODPATH=${0%/*}

# log
exec 2>$MODPATH/debug-pfsd.log
set -x

# permission
if [ "$API" -ge 26 ]; then
  DIRS=`find $MODPATH/vendor\
             $MODPATH/system/vendor -type d`
  for DIR in $DIRS; do
    chown 0.2000 $DIR
  done
  chcon -R u:object_r:system_lib_file:s0 $MODPATH/system/lib*
  if [ -L $MODPATH/system/vendor ]\
  && [ -d $MODPATH/vendor ]; then
    chcon -R u:object_r:vendor_file:s0 $MODPATH/vendor
  else
    chcon -R u:object_r:vendor_file:s0 $MODPATH/system/vendor
  fi
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


