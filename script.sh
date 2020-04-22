#!

function opsFun(){
	read -p "Gimme'dem digits (separated by a space): "
       	local nums+=( $REPLY )

	case $oper in
		add)
			let local sum=0
			for (( i=0; i<${#nums[@]}; i++ )); do
				let sum+=nums[i]
			done
			
			echo "The total of your numbers is $sum. That'bout sums it up."
		;;
		
		sub)
			let local dif=${nums[0]}
			for (( i=1; i<${#nums[@]}; i++ )); do
				let dif=dif-${nums[i]}
			done
			
			echo The total difference is $dif. Good day.
		;; 
		
		mul)
			let local prod=${nums[0]}
			for (( i=1; i<${#nums[@]}; i++ )); do
				let prod=$(( prod*${nums[i]} ))
			done

			echo The product is $prod
		;;

		div)
			if [[ ${nums[1]} -eq 0 ]]; then
				echo Division by zero!
			elif [[ ${#nums[@]} -eq 2 ]]; then
				local quot=$((nums[0]/nums[1]))
				local remain=$((nums[0]%nums[1]))
				echo The quotient of these two numbers is $quot with a remainder of $remain. Goodbye.
			else
				let local quot=${nums[0]}
				for (( i=1; i<${#nums[@]}; i++ )); do
					let quot=$(( quot/${nums[i]} ))
				done
				echo The quotient is $quot. Note that no remainder is given because you entered more than two numbers.
			fi
	esac
}

operations=( add sub mul div )

#just to make an Oxford comma list:
for (( i=0; i<=${#operations[@]}-2; i++ )); do
	ops+="${operations[i]}, "
done
ops+="and ${operations[-1]}"

while true; do
	read -p "Choose an operation from $ops: " oper
	case $oper in
		add|sub|mul|div)
			opsFun $oper
			break
		;;
		*)
			echo Invalid selection. Please choose from: ${ops[@]}.
			continue
		;;
	esac
done

# vim ts=4 sw=4 et syn=sh ft=bash
