#!/vendor/bin/sh

function configure_memory_parameters() {
	# Set Memory parameters.

	MemTotalStr=`cat /proc/meminfo | grep MemTotal`
	MemTotal=${MemTotalStr:16:8}

	if [ $MemTotal -gt 8000000 ]; then
		echo 200000 > /sys/kernel/dma_mi_pool/total_pools_max
	elif [ $MemTotal -gt 6000000 ]; then
		echo 150000 > /sys/kernel/dma_mi_pool/total_pools_max
	elif [ $MemTotal -gt 4000000 ]; then
		echo 120000 > /sys/kernel/dma_mi_pool/total_pools_max
	elif [ $MemTotal -gt 3000000 ]; then
		echo 100000 > /sys/kernel/dma_mi_pool/total_pools_max
	else
		echo 70000 > /sys/kernel/dma_mi_pool/total_pools_max
	fi
}

configure_memory_parameters
