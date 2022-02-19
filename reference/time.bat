@echo off
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2%T%ldt:~8,2%:%ldt:~10,2%:%ldt:~12,6%
echo Local date is [%ldt%]



rem https://www.codeproject.com/articles/19677/formats-for-datetime-tostring
rem https://docs.microsoft.com/en-us/dotnet/api/system.datetime.tostring?view=net-6.0
rem [datetime]::now.tostring("yyyy'-'MM'-'dd'T'HH':'mm':'ss")
