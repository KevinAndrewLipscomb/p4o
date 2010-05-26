REM
REM $Id$
REM
cd "C:\Inetpub\wwwroot\p4o"
start /max explorer /e,/select,C:\Inetpub\wwwroot\p4o\.svn
start /max explorer ftp://kalipso:@frompaper2web.com/ssl/p4o_x
start /max explorer ftp://frompaper2web:@frompaper2web.win.aplus.net/WWWROOT/p4o/
start /max p4o.sln
start "" /max "C:\Program Files\MySQL\MySQL Workbench 5.2 OSS\MySQLWorkbench.exe"
