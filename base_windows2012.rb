# base_windows2012.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://github.com/opscode/chef-dk/blob/master/POLICYFILE_README.md
# A name that describes what the system you're building with Chef does.

name 'base_windows2012'

# Where to find external cookbooks:
default_source :chef_server, "https://#{ENV['AUTOMATE_HOSTNAME']}/organizations/#{ENV['CHEF_ORG']}"

# Specify a custom source for a cookbook:
cookbook 'chef-client', '~> 12.0.1'  ## Stage 1 - Base
cookbook 'audit_agr', '~> 2.2.4'   ## Stage 2 - Detect
cookbook 'cis-win2012r2-l1-hardening', '~> 0.1.1'  ## Stage 3 - Correct

# run_list: chef-client will run these recipes in the order specified.

run_list 'chef-client', 'audit_agr', 'cis-win2012r2-l1-hardening'  ## Stage 3
