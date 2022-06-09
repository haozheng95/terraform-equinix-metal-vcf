from subprocess import Popen, PIPE

import paramiko, logging

logger = logging.getLogger('test_logger')
logger.setLevel(logging.DEBUG)
test_log = logging.FileHandler('test.log', 'a', encoding='utf-8')
test_log.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s - %(filename)s - line:%(lineno)d - %(levelname)s - %(message)s -%(process)s')
test_log.setFormatter(formatter)
logger.addHandler(test_log)
KZT = logging.StreamHandler()
KZT.setLevel(logging.DEBUG)
KZT.setFormatter(formatter)
logger.addHandler(KZT)

ssh = paramiko.SSHClient()
know_host = paramiko.AutoAddPolicy()
ssh.set_missing_host_key_policy(know_host)
ssh.connect(
    hostname="147.28.141.231",
    port=22,
    username="root",
    key_filename="/Users/yhaozheng/.ssh/id_rsa"
)


def get_elastic_ip():
    stdin, stdout, stderr = ssh.exec_command("ip a")
    data = stdout.read().decode()
    logger.info(data)
    data_list = data.split("\n")
    ip_info = ""
    for i in range(len(data_list)):
        if "bridge1: " in data_list[i]:
            logger.debug(i)
            ip_info = data_list[i + 4]
            break
    logger.debug(ip_info)
    ip = ip_info.split(" ")[5].split("/")[0].split(".")
    logger.debug(ip)
    last_number = int(ip[-1])
    address = ip[0] + "." + ip[1] + "." + ip[2] + "." + str(last_number + 1) + "/29"
    network = ip[0] + "." + ip[1] + "." + ip[2] + "." + str(last_number - 1)
    gateway = ip[0] + "." + ip[1] + "." + ip[2] + "." + str(last_number - 1)
    logger.debug(address)
    logger.debug(network)
    logger.debug(gateway)
    return address, network, gateway


def create_edge_kvm():
    # prepare resource
    cmd = """
    wget https://download.mikrotik.com/routeros/7.1/chr-7.1.img.zip
    unzip chr-7.1.img.zip
    mv chr-7.1.img /var/lib/libvirt/images/
    """
    stdin, stdout, stderr = ssh.exec_command(cmd)
    data = stdout.read().decode()
    logger.info(stderr.read().decode())
    logger.info(data)

    cmd = """
    # create vm
    virt-install --name=CloudRouter \
    --import \
    --vcpus=2 \
    --memory=1024 \
    --disk vol=default/chr-7.1.img,bus=sata \
    --network=network:bridge1,model=virtio \
    --network=network:bridge2,model=virtio \
    --os-type=generic \
    --os-variant=generic \
    --noautoconsole
    
    virsh autostart CloudRouter
    """

    stdin, stdout, stderr = ssh.exec_command(cmd)
    data = stdout.read().decode()
    logger.info(stderr.read().decode())
    logger.info(data)


def config_edge_kvm():
    cmd = "/root/anaconda3/envs/vbox/bin/python t.py 'qemu:///system' 'efdd6b60-1bb2-4ce6-ac06-6496b002810a'"
    stdin, stdout, stderr = ssh.exec_command(cmd)
    data = stdout.read().decode()
    logger.info(stderr.read().decode())
    logger.info(data)


if __name__ == '__main__':
    # get_elastic_ip()
    config_edge_kvm()
    ssh.close()
