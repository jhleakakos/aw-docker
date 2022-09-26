FROM mcr.microsoft.com/mssql/server:2019-latest

EXPOSE 1433

ADD AdventureWorks2019.bak /var/opt/mssql