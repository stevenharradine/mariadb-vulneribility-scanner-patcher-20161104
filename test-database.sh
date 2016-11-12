target_version=$2
mysql_installed=`dpkg --get-selections | grep -v deinstall | grep mariadb | wc -l`

if [ $mysql_installed -ne 0 ]; then
  mysql_version=`mysql -V | grep $target_version | wc -l`

  if [ $mysql_version -eq 0 ]; then
    sudo apt-get update
    sudo apt-get install -y --only-upgrade mariadb-server

    mysql_version=`mysql -V | grep $target_version | wc -l`

    if [ $mysql_version -ne 0 ]; then
      echo "**Updated"
    else
      echo "**FAILED"
    fi
  else
  	echo "**Current"
  fi
else
  echo "**Not Installed"
fi