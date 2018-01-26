#！/bin/sh

if [ ! -d $1 ]
then
    echo dir is invalid,$1
    exit 1
fi

pattern=$2
if [ -z $2 ]
then
    pattern=".+\.(c|cpp|h|hpp|java|py)$"
fi

for i in `find $1 -regextype posix-egrep -regex $pattern -print`
do
    echo $1
    sed -i "s/\t/    /g" $i
done
