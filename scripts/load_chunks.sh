  #!/bin/sh 

  # store start date to a variable
  imeron=`date`

  echo "Import started: OK"
  dumpfile="/var/www/public_html/mrdbid/MBList/MBList_10_11_2024.sql"

  ddl="set names utf8; "
  ddl="$ddl set global net_buffer_length=1000000;"
  ddl="$ddl set global max_allowed_packet=1000000000; "
  ddl="$ddl SET foreign_key_checks = 0; "
  ddl="$ddl SET UNIQUE_CHECKS = 0; "
  ddl="$ddl SET AUTOCOMMIT = 0; "
  # if your dump file does not create a database, select one
  ddl="$ddl USE MBList; "
  ddl="$ddl source $dumpfile; "
  ddl="$ddl SET foreign_key_checks = 1; "
  ddl="$ddl SET UNIQUE_CHECKS = 1; "
  ddl="$ddl SET AUTOCOMMIT = 1; "
  ddl="$ddl COMMIT ; "

  echo "Import started: OK"



  # store end date to a variable
  imeron2=`date`

  echo "Start import:$imeron"
  echo "End import:$imeron2"
