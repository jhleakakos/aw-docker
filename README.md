Instructions for setting up AdventureWorks in Docker on macOS.

Reference pages:

- [AdventureWorks DB](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)
- [Deploy Container](https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-docker-container-deployment?view=sql-server-ver16&pivots=cs1-bash)
- [Deploy Quickstart](https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&preserve-view=true&pivots=cs1-bash)
- [Connect with Azure Data Studio](https://learn.microsoft.com/en-us/sql/azure-data-studio/quickstart-sql-server?view=sql-server-ver16)

Running MSSQL container:

- pull docker image: `docker pull mcr.microsoft.com/mssql/server:2019-latest`
- download AdventureWorks2019.bak from the link above
- create a .env file in project root with a password for the MSSQL_PWD variable
- run `docker compose up -d` to run the container
- when finished, run `docker compose down` to stop the container

Connecting to container from Azure Data Studio (ADS):

- open up the Connections menu in the upper left of ADS
- click on New Connection
- Server: localhost
- 'User name': sa
- Password: use the password from the .env file
- leave the rest of the values as their defaults

Restoring AdventureWorks database from bak file in ADS with GUI:

- if the management pane in AD isn't open, double click on the localhost connection or right click and select Manage
- go to the Home tab
- select Restore
- go to the General tab
- in Source, change 'Restore from' to 'Backup file'
- in 'Backup file path,' select /var/opt/mssql/AdventureWorks2019.bak
- select Restore at the bottom

Restoring AdventureWorks database with SQL script:

- alternatively, you can run restore_script.sql to restore the database programmatically

At this point, we have SQL Server running locally in Docker, we've connected to the container from our local version of Azure Data Studio, and we've loaded the AdventureWorks database.

When we want to work with the database going forward:

- make sure Docker is running
- navigate to the project directory
- run `docker compose up -d` to start the container
- connect through ADS
- when finished, run `docker compose down` to stop the container

After restoring the AdventureWorks database, you can change the ADS connection process above so you directly connect to the working database. By default, the connection is to the master database. After putting in the username and password, you can change the database value to AdventureWorks2019. Alternatively, at the top of the query windows, you can select AdventureWorks2019 to change the context manually. You can also do this in code with a `use` statement or by explicitly naming the database with four-part naming in the `from` clause.