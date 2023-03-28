#!/bin/bash


RESULTS=./Benchmark_Results

REFERENCE=./


curDate=$(date +'%d_%m_%Y')

SIM_ARGS=""



#Copy Input Args for simulation
for i in $(seq 1 1 $#)
do
  ARG=${@:$i:1}
  SIM_ARGS="$SIM_ARGS $ARG"
done


#clear results directory

rm workspace/results/*.csv

#create benchmark results directory if it doesnt exist
if [[ ! -d "$RESULTS" ]]; then

    echo "Benchmark_Results directory does not exist.  Making one now."
    mkdir Benchmark_Results
    
fi


#Run benchmarks and compare results to reference benchmark file

if [[ -n $(find ./Benchmark_Results -name 'ref_benchmarks_*.csv') ]]; then

    echo "Running Benchmarks"
    
    ./mlonmcu_integration_tests.sh --enable-tflm --enable-spike $SIM_ARGS
    
    find workspace/results -name '*.csv' -exec cat {} > ./Benchmark_Results/benchmarks_${curDate}.csv \;
    
    find ./Benchmark_Results -name 'ref_benchmarks_*.csv' -exec python3 compare_benchmarks.py -b Benchmark_Results/benchmarks_${curDate}.csv -r {} \;
    
    echo "Benchmark Comparison to Reference Completed"

else
      
    echo "Reference Benchmark File does not exist in /Benchmark_Results."
    
    read -p "Do you want to generate one with the muRISCV-NN version in this repository? (y/n) " response

    case $response in 
	    y ) echo "Creating Reference Benchmark File";;
	    n ) echo "Exiting Process";
		    exit;;
	    * ) echo "Invalid response, try again";
		    exit 1;;
    esac

   
   ./mlonmcu_integration_tests.sh --enable-tflm --enable-spike --enable-default --enable-pext --enable-vext toycar aww vww resnet
   
   find ./workspace/results -name '*.csv' -exec cat {} > ./Benchmark_Results/ref_benchmarks_${curDate}.csv \;
   
   echo "Reference Benchmark File created using current muRISCV-NN configuration"
    
   
fi



 

