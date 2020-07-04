#!/bin/bash 

#varibles
counter=0
index=0
total_heads=0
total_tails=0
total_first_comb=0
total_second_comb=0
total_third_comb=0
total_fourth_comb=0

#Dictionary for Singlet Combination
declare -A singlet
singlet[head]=" "
singlet[tails]=" "
singlet[h_per]=0
singlet[t_per]=0

#Dictionary for Doublet Combination
declare -A double
double[first_combination]=" "
double[second_combination]=" "
double[third_combination]=" "
double[fourth_combination]=" "
double[first_per]=0
double[second_per]=0
double[third_per]=0
double[fourth_per]=0


read -p "Enter how many times you want flip the coin  " FLIP
while [ $counter -lt $FLIP ]
do
	coin_1=$(($RANDOM%2))
	coin_2=$(($RANDOM%2))
	if [ $coin_1 -eq 1 ]
	then
		singlet[head]="H"
		((total_heads++))
		if [ $coin_2 -eq 1 ]
		then
			((total_first_comb++))
			double[first_combination]="HH"
		else
			((total_second_comb++))
			double[second_combination]="HT"
		fi
	else
		singlet[tails]="T"
		((total_tails++))
		 if [ $coin_2 -eq 1 ]
		then
			  ((total_third_comb++))
			   double[third_combination]="TH"
		else
			((total_fourth_comb++))
			double[fourth_combination]="TT"
		fi
	fi
        ((counter++))
done
echo "Combination of Singlet,Doublet,Triplet"
echo "--------------------------------------"
echo "Singlet Combination" ${singlet[head]} ${singlet[tails]}
singlet[h_per]=$(echo $total_heads $FLIP | awk '{print $1/$2}')
echo "Percentage of head ="${singlet[h_per]}

singlet[t_per]=$(echo $total_tails $FLIP | awk '{print $1/$2}')
echo "Percentage of tails =" ${singlet[t_per]}

echo "-------------------------------------"
echo "Doublet Combination" ${double[first_combination]} ${double[second_combination]} ${double[third_combination]} ${double[fourth_combination]}
double[first_per]=$(echo $total_first_comb $FLIP | awk '{print $1/$2}')
echo "Percentage of HH Combination ="${double[first_per]}

double[second_per]=$(echo $total_second_comb $FLIP | awk '{print $1/$2}')
echo "Percentage of HT Combination ="${double[second_per]}

double[third_per]=$(echo $total_third_comb $FLIP | awk '{print $1/$2}')
echo "Percentage of TH Combination ="${double[third_per]}

double[fourth_per]=$(echo $total_fourth_comb $FLIP | awk '{print $1/$2}')
echo "Percentage of TT Combination ="${double[fourth_per]}
