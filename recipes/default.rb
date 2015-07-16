# R version check script
cookbook_file '/home/vagrant/showversion.R' do
  source "showversion.R"
  owner "vagrant"
  group "vagrant"
  mode "0755"
end
# Bioconductor version check script
cookbook_file '/home/vagrant/showBioconductorVersion.R' do
  source "showBioconductorVersion.R"
  owner "vagrant"
  group "vagrant"
  mode "0755"
end

# .Renviron
cookbook_file '/home/vagrant/.Renviron' do
  source ".Renviron"
  owner "vagrant"
  group "vagrant"
  mode "0644"
end
# .Rprofile
template '/home/vagrant/.Rprofile' do
  source "Rprofile.erb"
  owner "vagrant"
  group "vagrant"
  variables cransite: node[:r31biocdev][:cransite]
  mode "0644"
end

# R user library directory
directory "/home/vagrant/R/library" do
  owner "vagrant"
  group "vagrant"
  recursive true
  mode "0755"
  action :create
end

# Bioconductor install script
cookbook_file '/home/vagrant/installBioconductor.R' do
  source "installBioconductor.R"
  owner "vagrant"
  group "vagrant"
  mode "0755"
end
#
r_prefix_path = ""
if node[:r31biocdev].has_key?('r_prefix_path')
  if node[:r31biocdev][:r_prefix_path] != nil
    r_prefix_path = node[:r31biocdev][:r_prefix_path]
  end
end

# install Bioconductor
execute "install Bioconductor" do
  command "#{r_prefix_path}R CMD BATCH /home/vagrant/installBioconductor.R"
  action :run
end
