# Standalone OHS Domain

This project allows us to create silently a Standalone OHS Domain as explained in detail in 
my blog at [Standalone OHS] (https://realworlditblog.wordpress.com/2016/03/14/standalone-ohs-part-1)

The project contains 4 main folders
- bin : Where the environment variables are set
- tools : Where the wlst main scripts exist
- wlst : The wlst scripts
- config : The config files needed
- functions : The shell script functions included by the tools and bin scripts

Inside the wlst folder it also exists a wlstfunctions folder where we should add costum python modules.

I guess that the scripts are quite self explained and are all documented so I'll just note some 
important steps in order to use the scripts:

1. Download the OHS Software from Oracle edelivery site
2. Adjust your configurations 
3. Install (using bin/install.sh)
4. Create the domain (using bin/createDomain.sh)

## Vagrant

There's also a vagrant folder that contains a Vagrantfile that has all the steps needed to provision 
the standalone ohs.

All you have to do is to download the oracle ohs software and put it on the software folder and do the usual vagrant up command.

### The box

The vagrant setup uses a custom made vagrant box that already has everything that is needed to setup any Oracle FMW software.
The box was made using the packer tool.

## More

Check my [blog](http://realworlditblog.wordpress.com "real world IT") for more tips and tricks about Oracle FMW install and administration