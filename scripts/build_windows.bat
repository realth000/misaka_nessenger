@echo off
echo build Flutter client...
cd ../misaka_nessenger
flutter build windows --verbose || goto fail
echo build Go HTTP server...
cd ../misaka_nessenger_server
go build --buildmode=exe -o MisakaNessengerServer.exe || goto fail
echo done

pause
exit /b 0

:fail
echo build failed
pause
