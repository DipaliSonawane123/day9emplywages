#!/bin/bash -x

isPartTime=1
isFullTime=2
maxHoursInMonth=100
empRatePerHr=20
numOfWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

function getWorkingHours()
{
     case $1 in
                 $isPartTime )
                      empHrs=4
                  ;;
                  $isFullTime )
                       empHrs=8
                   ;;
                   *)
                       empHrs=0
                    ;;
      esac
}

function getEmpWage()
{
   echo $(($totalEmpHr*$empRatePerHr))
}
while [[ $totalEmpHr -lt $maxHoursInMonth &&
          $totalWorkingDays -lt $numOfWorkingDays ]]
do
       ((totalWorkingDays++))
       randomCheck=$((RANDOM%3))
       getWorkingHours $randomCheck
       totalEmpHr=$(($totalEmpHr+$empHrs))
       dailyWages[$totalWorkingDays]=$(($empHrs*$empRatePerHr))
done

totalsalary="$( getEmpWage $totalEmpHr )"
echo ${dailyWages[@]}
