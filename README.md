# lab-cdn-cookbook

This cookbook sets up a laboratory with a CDN implementation ready to use. It's
main purpose is to demonstrate how a CDN works and could be used to teach the
subject.

lab-cdn cookbook includes the following recipes:
* cdn: it sets up edge CDN servers.
* desktop: installs a gui for desktop machines. 
* dns: installs BIND and sets it up with redes.unlp domain.
* resolver: overwrites /etc/resolv.conf with the DNS's IP.
* webserver: installs and configures the websites www.redes.unlp.

This lab does not come alone, it also has:
* A set of diagrams which you will find in the docs/diagrams/ folder that will
  help you understand the topology of the lab.
* A PDF document inside the docs/ folder. It is written in Spanish but may help
  you with the development of the lab.
* A showoff presentation which has two sections, the first one with a teoric
  introudction to CDNs and a second part which is focused on running the lab.
  That last part could be useful to understand how to try this lab. It can be
  cloned from ... or viewed online directly at ...

## Supported Platforms

Ubuntu 12.04 LTS: verified.
Other Ubuntu versions should work as well.

## Attributes

None, as all recipes use configuration files which are copied and overwritten in
the target hosts. If a change needs to be made in any configuration then
corresponding files in the files/default directory need to be changed.

## Requirements

This cookbook uses Vagrant, VirtualBox, Chef-Solo and Berkshelf. You can get the
former at vagrantup.com and download VirtualBox from its homepage and finally 
ChefDK to meet the other requirements without having to worry too much
installing Ruby and all the other packages.

Hardware requirements are important as this lab runs eight virtual machines with
a total amount of 3328MB of RAM. RAM assigned to each VM could be easily reduced
in Vagrantfile editing the following line:

<code>vb.customize ["modifyvm", :id, "--memory", "512"]</code>

I do consider that RAM for DNS and CDN Servers (africa, america, asia and
europa) could be reduced to 256MB with no issues which will save you 640MB.

Besides, a CPU which supports virtualization is not an essential requirement but
would make the lab run much faster.

## Usage

To use it on your machine, the steps are:

1. Clone this repository.
2. Install required gems ('bundle install' should do the trick).
3. In the repository directory run 'vagrant up'.
4. Go get some mate (referencia al mate) as it will take some time to download
   and install every package. While doing that you should take a look at the
   Vagrantfile and diagrams in the docs/diagrams/ folder.
5. Access hosts using 'vagrant ssh HOSTNAME' or using SSH by it's IP address
   with user 'vagrant' and password 'vagrant'.

### lab-cdn::cdn

This recipe installs nginx and configures it to use static.redes.unlp as the
default virtual host to serve request wich is a proxy for www.redes.unlp.

Include `lab-cdn::cdn` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[lab-cdn::cdn]"
  ]
}
```

### lab-cdn::desktop

On an Ubuntu 12.04 LTS installs Lubuntu Desktop and Firefox which are used to
simulate remote machines which will access the website. It takes a while to
execute as it needs to download ~350MB and install every package. It could be
replaced with a text-based browser or any other VM, but I include it just to
make setting up the lab the least complicated possible.

Include `lab-cdn::desktop` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[lab-cdn::desktop]"
  ]
}
```

### lab-cdn::dns

Sets up redes.unlp domain main DNS. It installs BIND and confgures it to be able
to resolve names for that domain and uses views to return the corresponding IP
to each client.

Include `lab-cdn::dns` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[lab-cdn::dns]"
  ]
}
```

### lab-cdn::resolver

This recipe just overwrites /etc/resolv.conf on the hosts to indicate them that
they need to use the main DNS server.

I've included it as I couldn't find any way to indicate Vagrant which DNS to set
up on the machines, which would be a better way to do this.

Include `lab-cdn::resolver` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[lab-cdn::resolver]"
  ]
}
```

### lab-cdn::webserver

Sets up the origin webserver, the one that will use the CDN. This recipe
installs Nginx, PHP-FPM, MySQL and clones a repository with a default Wordpress
website which will be the example site for the lab.

Include `lab-cdn::webserver` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[lab-cdn::webserver]"
  ]
}
```
## TODO

This To-Do list is for me or for anyone else interested in improving this lab
and could be extended with new requirements and features.

* Replace the clients (Argentina and Egipto) vagrant box with a lightweight one
  with a GUI already installed on it in order to make the set up process faster
  and less prone to errors. 
* Improve chef-recipes in order to use templates instead of RAW files to
  configure the servers.
* English documentation with instructions to run the lab.


## Contributing

1. Fork the repository on Github.
2. Create a named feature branch (i.e. `add-new-recipe`).
3. Write your change.
4. Write tests for your change (if applicable).
5. Run the tests, ensuring they all pass.
6. Submit a Pull Request.

## License and Authors

Author:: Leandro Di Tommaso (<leandro.ditommaso@mikroways.net>)

This cookbook was written as part of a research work required for the subject
"Redes y Servicios Avanzados en Internet", which belongs to the Licenciatura en 
Informática and Licenciatura en Sistemas degree, at Universidad Nacional de La 
Plata. Feel free to use, improve, modify and share it as stated in the MIT
License under which this project is released.

