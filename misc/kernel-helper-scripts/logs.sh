KERNEL_NAME=$(uname -r)
echo "Kernel Name: ${KERNEL_NAME}"

mkdir ${KERNEL_NAME}
cd ${KERNEL_NAME}

sudo dmesg -t > ${KERNEL_NAME}-dmesg_current
sudo dmesg -t -k > ${KERNEL_NAME}-dmesg_kernel
sudo dmesg -t -l emerg > ${KERNEL_NAME}-dmesg_current_emerg
sudo dmesg -t -l alert > ${KERNEL_NAME}-dmesg_current_alert
sudo dmesg -t -l crit > ${KERNEL_NAME}-dmesg_current_crit
sudo dmesg -t -l err > ${KERNEL_NAME}-dmesg_current_err
sudo dmesg -t -l warn > ${KERNEL_NAME}-dmesg_current_warn
sudo dmesg -t -l info > ${KERNEL_NAME}-dmesg_current_info
