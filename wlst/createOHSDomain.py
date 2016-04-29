import sys

sys.path.append( os.getenv('WLST_LIB'))

from wlstfunctions import utils

# Read environment variables 
bbShortName = os.getenv('FUNCTIONAL_BLOCK_NAME') + '_' + os.getenv('BUILDING_BLOCK_NAME')

mwHome = os.getenv('MIDDLEWARE_HOME')
bbHome = os.getenv('BUILDING_BLOCK_HOME')

NM_HOME='cfg/nodemanager'

domainHome = bbHome + '/' + STANDALONE_SERVER_HOME + '/domains/' + os.getenv('TARGET_ENVIRONMENT') + '_' + bbShortName
jdkHome = bbHome + '/jdk'
nodemanagerHome = bbHome + '/' + NM_HOME

domainName= os.getenv('TARGET_ENVIRONMENT')+ '_' + bbShortName

instanceName = OHS_INSTANCE_NAME

instanceAdminPort = OHS_ADMIN_PORT
instanceHTTPPort = OHS_HTTP_PORT
instanceHTTPSPort = OHS_HTTPS_PORT

nodeManagerUsername = WLS_NM_USERNAME
nodeManagerMode = 'plain'
nodeManagerPort = WLS_NM_PORT
nodeManagerHost = WLS_NM_ADDR
nodeManagerPassword = utils.getpassword('nm_admin')



readTemplate(mwHome +'/wlserver/common/templates/wls/base_standalone.jar')
addTemplate(mwHome +'/ohs/common/templates/wls/ohs_standalone_template.jar')

# Configure Nodemanager

cd('/')
create(domainName, 'SecurityConfiguration') 
cd('SecurityConfiguration/' + domainName)
set('NodeManagerUsername',nodeManagerUsername)
set('NodeManagerPasswordEncrypted',nodeManagerPassword)
setOption('NodeManagerType', 'CustomLocationNodeManager');
setOption('NodeManagerHome', nodemanagerHome);
setOption('JavaHome', jdkHome )


cd('/Machines/localmachine/NodeManager/localmachine')
cmo.setListenAddress(nodeManagerHost);
cmo.setListenPort(int(nodeManagerPort));
cmo.setNMType(nodeManagerMode);

# Delete the existing SystemComponent 
# cause we didn't want it
delete('ohs1','SystemComponent')

create (instanceName,'SystemComponent')
cd('/OHS/'+instanceName)
cmo.setAdminPort(instanceAdminPort)
cmo.setListenPort(instanceHTTPPort)
cmo.setSSLListenPort(instanceHTTPSPort)

# create the domain

print "Finishing, this may take a while...."
writeDomain(domainHome)
closeTemplate()


