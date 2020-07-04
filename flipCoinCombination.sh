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
total_triplet_first_comb=0
total_triplet_second_comb=0
total_triplet_third_comb=0
total_triplet_fourth_comb=0
total_triplet_fifth_comb=0
total_triplet_sixth_comb=0
total_triplet_seventh_comb=0
total_triplet_eigth_comb=0

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

#Dictionary for triplet Combination
declare -A triplet
triplet[first_combination]=" "
triplet[second_combination]=" "
triplet[third_combination]=" "
triplet[fourth_combination]=" "
triplet[fifth_combination]=" "
triplet[sixth_combination]=" "
triplet[seventh_combination]=" "
triplet[eigth_combination]=" "
triplet[first_per]=0
triplet[second_per]=0
triplet[third_per]=0
triplet[fourth_per]=0
triplet[fifth_per]=0
triplet[sixth_per]=0
triplet[seventh_per]=0
triplet[eigth_per]=0

read -p "Enter how many times you want flip the coin  " FLIP
while [ $counter -lt $FLIP ]
do
	coin_1=$(($RANDOM%2))
	coin_2=$(($RANDOM%2))
	coin_3=$(($RANDOM%2))
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
	if [ $coin_1 -eq 1 -a $coin_2 -eq 1 ]
	then
		if [ $coin_3 -eq 1 ]
		then
			((total_triplet_first_comb++))
			triplet[first_combination]="HHH"
		else
			((total_triplet_second_comb++))
			triplet[second_combination]="HHT"
		fi
	elif [ $coin_1 -eq 1 -a $coin_2 -eq 0 ]
	then
		if [ $coin_3 -eq 1 ]
		then
			((total_triplet_third_comb++))
			triplet[third_combination]="HTH"
		else
			((total_triplet_fourth_comb++))
			triplet[fourth_combination]="HTT"
		fi
	elif [ $coin_1 -eq 0 -a $coin_2 -eq 1 ]
	then
		if [ $coin_3 -eq 1 ]
		then
			((total_triplet_fifth_comb++))
			triplet[fifth_combination]="THH"
		else
			((total_triplet_sixth_comb++))
			triplet[sixth_combination]="THT"
		fi
	else
		if [ $coin_1 -eq 0 -a $coin_2 -eq 0 ]
		then
			if [ $coin_3 -eq 1 ]
			then
				((total_triplet_seventh_comb++))
				triplet[seventh_combination]="TTH"
			else
				((total_triplet_eigth_comb++))
				triplet[eigth_combination]="TTT"
			fi
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

echo "-----------------------------------------"
echo -n "Triplet Combination" ${triplet[first_combination]} ${triplet[second_combination]} ${triplet[third_combination]} ${triplet[fourth_combination]} 
echo " "${triplet[fifth_combination]} ${triplet[sixth_combination]} ${triplet[seventh_combination]} ${triplet[eigth_combination]}

triplet[first_per]=$(echo $total_triplet_first_comb $FLIP | awk '{print $1/$2}') 
echo "Percentage of" ${triplet[first_combination]} "Combination ="${triplet[first_per]}

triplet[second_per]=$(echo $total_triplet_second_comb $FLIP | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[second_combination]} "Combination ="${triplet[second_per]} 

triplet[third_per]=$(echo $total_triplet_third_comb $FLIP | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[third_combination]} "Combination ="${triplet[third_per]}

triplet[fourth_per]=$(echo $total_triplet_fourth_comb $FLIP | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[fourth_combination]} "Combination ="${triplet[fourth_per]}

triplet[fifth_per]=$(echo $total_triplet_fifth_comb $FLIP | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[fifth_combination]} "Combination ="${triplet[fifth_per]} 

triplet[sixth_per]=$(echo $total_triplet_sixth_comb $FLIP | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[sixth_combination]} "Combination ="${triplet[sixth_per]}

triplet[seventh_per]=$(echo $total_triplet_seventh_comb $FLIP | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[seventh_combination]} "Combination ="${triplet[seventh_per]}

triplet[eigth_per]=$(echo $total_triplet_eigth_comb $FLIP | awk '{print $1/$2}')  
echo "Percentage of" ${triplet[eigth_combination]} "Combination ="${triplet[eigth_per]}             


arr[((index++))]=${singlet[h_per]}
arr[((index++))]=${singlet[t_per]}
arr[((index++))]=${double[first_per]}
arr[((index++))]=${double[second_per]}
arr[((index++))]=${double[third_per]}
arr[((index++))]=${double[fourth_per]}
arr[((index++))]=${triplet[first_per]}
arr[((index++))]=${triplet[second_per]}
arr[((index++))]=${triplet[third_per]}
arr[((index++))]=${triplet[fourth_per]}
arr[((index++))]=${triplet[fifth_per]}
arr[((index++))]=${triplet[sixth_per]}
arr[((index++))]=${triplet[seventh_per]}
arr[((index))]=${triplet[eigth_per]}
echo ${arr[@]}
echo ${#arr[@]}
len=$((${#arr[@]}))
for(( i=0; i<13; i++ ))
do
	for (( j=i+1; j<13; j++ ))
	do
		if [ $(echo "${arr[i]}<${arr[j]}"|bc) -eq 1 ]
		then
			temp=${arr[i]}
			arr[i]=${arr[j]}
			arr[j]=$temp
		fi
	done
done
echo ${arr[@]}
max=${arr[0]}

case $max in
	${singlet[h_per]}) echo "Singlet Combination is Winner" ;;
	${singlet[t_per]}) echo "Singlet Combination is Winner" ;;
	${double[first_per]}) echo "Doublet Combination is Winner" ;;
	${double[second_per]}) echo "Doublet Combination is Winner" ;;
	${double[third_per]}) echo "Doublet Combination is Winner" ;;
	${double[fourth_per]}) echo "Doublet Combination is Winner"  ;;
	${triplet[first_per]}) echo "Triplet Combination is Winner"  ;;
	${triplet[second_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[third_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[fourth_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[fifth_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[sixth_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[seventh_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[eigth_per]}) echo "Triplet Combination is Winner" ;;
esac

