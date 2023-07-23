KERNEL_NAME=$(uname -r)
echo "Computing diff between logs of kernel: ${KERNEL1} and ${KERNEL2}"

KERNEL1=$1
KERNEL2=$2

mkdir "$KERNEL1-$KERNEL2-diff"
cd "$KERNEL1-$KERNEL2-diff"

diff ../${KERNEL1}/${KERNEL1}-dmesg_current ../${KERNEL2}/${KERNEL2}-dmesg_current > "dmesg_current"
diff ../${KERNEL1}/${KERNEL1}-dmesg_kernel ../${KERNEL2}/${KERNEL2}-dmesg_kernel > dmesg_kernel
diff ../${KERNEL1}/${KERNEL1}-dmesg_current_emerg ../${KERNEL2}/${KERNEL2}-dmesg_current_emerg > dmesg_current_emerg
diff ../${KERNEL1}/${KERNEL1}-dmesg_current_alert ../${KERNEL2}/${KERNEL2}-dmesg_current_alert > dmesg_current_alert
diff ../${KERNEL1}/${KERNEL1}-dmesg_current_crit ../${KERNEL2}/${KERNEL2}-dmesg_current_crit > dmesg_current_crit
diff ../${KERNEL1}/${KERNEL1}-dmesg_current_warn ../${KERNEL2}/${KERNEL2}-dmesg_current_warn > dmesg_current_warn
diff ../${KERNEL1}/${KERNEL1}-dmesg_current_info ../${KERNEL2}/${KERNEL2}-dmesg_current_info > dmesg_current_info
