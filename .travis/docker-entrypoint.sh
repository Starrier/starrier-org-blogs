START=`date "+%F %T"`

if [ $1 = "sh" ];then sh ; exit 0; fi

rm -rf node_modules _book

cp -a . ../gitbook

cd ../gitbook

# shellcheck disable=SC1073
# shellcheck disable=SC1072
(){
  if [ "$1" = build ];then
    gitbook build
    cp -a _book ../gitbook-src
    echo $START
    exec date "+%F %T"
  fi
  gitbook serve
  exit 0
}

main $1 $2 $3
