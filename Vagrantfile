# Settings for the Virtualbox VM
VM_IP='10.10.0.55'
VM_MEMORY='2048'
VM_CPUS='1'
VM_VRAM='24'

# Hostnames to be managed
HOSTS=["dev.local", "shop.local", "its.local", "sonia.local", "comun.local"]

# Check whether we are running UNIX or Windows-based machine
if Vagrant::Util::Platform.windows?
  HOSTS_PATH = 'c:\WINDOWS\system32\drivers\etc\hosts'
  SYNCED_FOLDER_TYPE = 'smb'
else
  HOSTS_PATH = '/etc/hosts'
  SYNCED_FOLDER_TYPE = 'nfs'
end

# Verify if salt/pillar directories are present
#require 'mkmf'

Vagrant.configure(2) do |config|
  #config.vm.box = "ubuntu/trusty64"
  config.vm.box = "debian/jessie64"
  config.vm.hostname = "dev.local"
  config.vm.boot_timeout = 300

  # Enable ssh agent forwarding
  config.ssh.forward_agent = true

  #config.vm.network "public_network"

  # The VirtualBox IP-address for the browser
  config.vm.network :private_network, ip: VM_IP

  # Port forwarding for services running on VM:
  config.vm.network :forwarded_port, guest: 22, host: 55122
  #config.vm.network "forwarded_port", guest: 3306,  host: 3306,  auto_correct: true   # MySQL

  # install required, but missing dependencies into the base box
  config.vm.provision :shell, path: "bootstrap.sh"

  # add hosts to /etc/hosts
  if Vagrant.has_plugin? 'vagrant-hostmanager'
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
    config.hostmanager.aliases = HOSTS
  else
    hosts_line = VM_IP + " " + HOSTS.join(' ')
    if not File.open(HOSTS_PATH).each_line.any? { |line| line.chomp == hosts_line }
      puts "WARNING: Please add the following entries to your ${HOSTS_PATH} file: \n\033[0m"
      puts hosts_line
    end
  end

  # Share the application code with VM
  config.vm.synced_folder "./server/", "/home/web", type: SYNCED_FOLDER_TYPE, create: true
  if SYNCED_FOLDER_TYPE == "nfs"
    config.nfs.map_uid = Process.uid
    config.nfs.map_gid = Process.gid
  end

# http://blog.csanchez.org/2012/05/03/automatically-download-and-install-virtualbox-guest-additions-in-vagrant/
#  Vagrant::Config.run do |config|
#    # set auto_update to false, if do NOT want to check the correct additions
#    # version when booting this machine
#    config.vbguest.auto_update = false
#  end

  # Configure VirtualBox VM resources (CPU and memory)
  config.vm.provider :virtualbox do |vb|
    vb.name = "KP-Dev"
    vb.customize([
      "modifyvm", :id,
      "--memory", VM_MEMORY,
      "--cpus", VM_CPUS,
      "--vram", VM_VRAM,
    ])
  end
end
