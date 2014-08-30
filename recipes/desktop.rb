package 'lubuntu-desktop'
package 'firefox'

execute "reboot-system" do
  command "if [ `cat /etc/motd | tail -1 | grep restart | wc -l` -ne 0 ]; then reboot; fi"
  action :run
end
