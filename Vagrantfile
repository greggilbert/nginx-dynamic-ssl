VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network :private_network, ip: "10.5.6.7"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  
  config.vm.provision "file", source: Dir.pwd + "/scripts/nginx-init", destination: "/tmp/nginx"
  
  config.vm.provision "shell" do |s|
    s.inline = "cp /tmp/nginx /etc/init.d/nginx"
    s.privileged = true
  end
  
  config.vm.provision "shell" do |s|
    s.inline = "cp /vagrant/scripts/nginx-ssl-cert.patch /tmp/nginx-ssl-cert.patch"
    s.privileged = true
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.sudo = true
  end
end