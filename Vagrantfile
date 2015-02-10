Vagrant.configure("2") do |config|
  config.vm.define "analysis" do |analysis|
    analysis.vm.box = "precise64"
    analysis.vm.box_url = "http://files.vagrantup.com/precise64.box"

    analysis.vm.network "private_network", ip: "192.168.1.3", virtualbox__intnet: true
    analysis.vm.network "forwarded_port", guest:8000, host:8001

    analysis.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", 512]
    end

    analysis.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "cookbooks"

        chef.add_recipe "apt"
        chef.add_recipe "build-essential"
        chef.add_recipe "python"
        chef.add_recipe "application"
        chef.add_recipe "openssl"
        chef.add_recipe "postgresql::server"
        chef.add_recipe "apache2"
	    chef.add_recipe "java"
	    chef.add_recipe "android-sdk"
        chef.add_recipe "nginx"
        chef.add_recipe "gangplank"

        chef.json.merge!({
          :apache => {
            :default_modules => ["alias", "python", "wsgi", "rewrite", "ssl"],
            :default_site_enabled => false
          },
          :supervisor => {
            :version => "3.0a12"
          },
          :postgresql => {
            :version => "9.1",
            :password => {
              :postgres => "diidTartans@1"
            },
            :pg_hba => [
              {
                :comment => "#Gangplank PG",
                :type => 'host',
                :db => 'gangplank',
                :user => 'diidadmin',
                :addr => '127.0.0.1/32',
                :method => 'md5'
              }
            ]
          }
        })
    end
  end

  config.vm.define "web" do |web|

    web.vm.box = "precise64"
    web.vm.box_url = "http://files.vagrantup.com/precise64.box"

    web.vm.network "private_network", ip: "192.168.1.2", virtualbox__intnet: true
    web.vm.network "forwarded_port", guest: 8000, host:8000

    web.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--memory", 512]
    end

    web.vm.provision :chef_solo do |chef|

      chef.cookbooks_path = "cookbooks"

      chef.add_recipe "apt"
      chef.add_recipe "build-essential"
      chef.add_recipe "python"
      chef.add_recipe "application"
      chef.add_recipe "openssl"
      chef.add_recipe "postgresql"
      chef.add_recipe "postgresql::server"
      chef.add_recipe "apache2"

      chef.add_recipe "nginx"
      chef.add_recipe "gangplank"

      chef.json.merge!({
        :apache => {
          :default_modules => ["alias", "python", "wsgi", "rewrite", "ssl"],
          :default_site_enabled => false
        },
        :supervisor => {
          :version => "3.0a12"
        },
        :postgresql => {
          :version => "9.1",
          :password => {
            :postgres => "diidTartans@1"
          },
          :pg_hba => [
            {
              :comment => "#Gangplank PG",
              :type => 'host',
              :db => 'gangplank',
              :user => 'diidadmin',
              :addr => '127.0.0.1/32',
              :method => 'md5'
            }
          ]
        }
      })

    end
  end

end
