#!/bin/bash
function makedirs() {
echo "1. create dirs"
cd ~
mkdir -p AWS/{DB/{RDS,DynamoDB},Deployment_model/{S3,Hybrid,RedShift,cloud}}

echo "2. go to Hybrid"
cd AWS/Deployment_model/Hybrid
pwd

echo "3.move Hybrid to DB in relative"
mv ../Hybrid ../../DB/
tree ~/AWS
pwd

echo "4. rename S3 to on-premise in relative"
mv ../S3 ../on-premise
tree ~/AWS

echo "5. copy DB to deployment"
cp -r ~/AWS/DB ~/AWS/Deployment_model

echo "6. delete AWS"
rm -rvf ~/AWS
}
makedirs


function printname() {
read -p "enter your name to print it 5 times, but in case it longest than 5 symbols" names
len=${#names}
echo $len
	if [[ $len -gt 5 ]]
		then
			i=5
			while [[ $i -ne 0 ]]
				do
					echo $names
					let i=i-1
				done
	else
		echo "your name $names in not long enough!!!"
	fi
}

printname
