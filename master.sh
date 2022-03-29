#! /bin/bash
gcloud config set project $1

gcloud compute instances list --filter="name~'test*'" --format="table(name,zone.basename())" > details.txt

arr=()
for line in `cat details.txt`
do
    if [ $line != "NAME:" ] && [ $line != "ZONE:" ]
    then
        arr+=("$line")
    fi
done
for (( i=0; i<${#arr[@]}; i+=2 ));
do
    ( ./move.sh ${arr[i]} ${arr[i + 1]} $1 $2 & );
done

rm details.txt


