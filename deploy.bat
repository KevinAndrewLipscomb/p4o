@REM
@REM $Id: deploy.bat 3086 2010-03-16 23:45:25Z KevinAnLipscomb $
@REM
@rmdir ready-to-deploy /s /q
@REM      sourcedir----------------------------------------------------------------destdir------------------------[files]---quals---------filter--------
@robocopy C:\Inetpub\wwwroot\p4o                                  ready-to-deploy                                 *.asax    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o                                  ready-to-deploy                                 *.aspx    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o                                  ready-to-deploy                                 *.pdf     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\bin                              ready-to-deploy\bin                             *.dll     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\bin                              ready-to-deploy\bin                             *.pdb     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\bin                              ready-to-deploy\bin                             *.TTF     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\css                              ready-to-deploy\css                                       /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\image                            ready-to-deploy\image                                     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\js                               ready-to-deploy\js                                        /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\noninteractive                   ready-to-deploy\noninteractive                  *.crontab /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\noninteractive                   ready-to-deploy\noninteractive                  *.aspx    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\protected                        ready-to-deploy\protected                       *.asax    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\protected                        ready-to-deploy\protected                       *.aspx    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\protected                        ready-to-deploy\protected                       *.config  /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\protected\image                  ready-to-deploy\protected\image                           /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\protected\template\notification  ready-to-deploy\protected\template\notification           /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\resource                         ready-to-deploy\resource                                  /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\template\notification            ready-to-deploy\template\notification                     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\usercontrol\app                  ready-to-deploy\usercontrol\app                 *.ascx    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\usercontrol\ki                   ready-to-deploy\usercontrol\ki                  *.ascx    /A /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\p4o\usercontrol\ki\image             ready-to-deploy\usercontrol\ki\image                      /A /np /ns /z | qgrep "New "
@pause