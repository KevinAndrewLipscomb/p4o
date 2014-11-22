REM
REM $Id$
REM
cd "C:\Inetpub\wwwroot\p4o"
start /max explorer /e,/select,C:\Inetpub\wwwroot\p4o\.svn
start /max explorer ftp://kalipso:@frompaper2web.com/ssl/p4o_x
start /max p4o.sln
IF EXIST "C:\Program Files\MySQL\MySQL Workbench\MySQLWorkbench.exe" (start "" /max "C:\Program Files\MySQL\MySQL Workbench\MySQLWorkbench.exe") ELSE start "" /max "C:\Program Files (x86)\MySQL\MySQL Workbench\MySQLWorkbench.exe"
