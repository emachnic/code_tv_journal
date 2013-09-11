#
# Cookbook Name:: packages
# Recipe:: default
#
# Copyright 2013, Evan Machnic
#
# All rights reserved - Do Not Redistribute
#

if platform? 'ubuntu', 'debian'
	%w{nodejs ruby1.9.1-dev zlib1g-dev git-core sqlite3 libsqlite3-dev}.each do |pkg_name|
		package pkg_name do
			action :install
		end
	end
end
