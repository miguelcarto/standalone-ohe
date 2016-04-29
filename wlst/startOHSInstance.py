import sys

sys.path.append( os.getenv('WLST_LIB'))

from wlstfunctions import utils

bbShortName = os.getenv('FUNCTIONAL_BLOCK_NAME') + '_' + os.getenv('BUILDING_BLOCK_NAME')
domainName= os.getenv('TARGET_ENVIRONMENT')+ '_' + bbShortName
bbHome = os.getenv('BUILDING_BLOCK_HOME')
domainHome = bbHome + '/' + STANDALONE_SERVER_HOME + '/domains/' + os.getenv('TARGET_ENVIRONMENT') + '_' + bbShortName

nodeManagerPassword = utils.getpassword('nm_admin')
nodeManagerHost = WLS_NM_ADDR
nodeManagerPort = WLS_NM_PORT
instanceName = OHS_INSTANCE_NAME

nmConnect('nm_admin', nodeManagerPassword, nodeManagerHost, nodeManagerPort, domainName, domainHome, 'plain')


nmStart(serverName=instanceName, serverType='OHS')

nmDisconnect()
