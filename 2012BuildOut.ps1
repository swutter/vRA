
## Moves AD object and adds GUID to description field
. c:\scripts\MvObjDescGUID.ps1

## Adds the owner to the local administrators group
. c:\scripts\AddUser2012.ps1

## Adds AD object to groups for SCCM
. c:\scripts\AddtoGroup.ps1

## Install SQL 2012
. c:\sql\SQLInstall.bat

## Add owner to SQL Admin group
##. c:\scripts\SQLSysAdmin.ps1

## Script to cleanup files used for install.  ALWAYS RUN LAST
. c:\scripts\Cleanup.ps1