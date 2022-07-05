1. After pulling this repository via git, ensure to export large file using the following command:
git lfs migrate export --everything --include="OMS/Liberty/wlp.zip, OMS/OMS/foundation/SMCFS_CORE_10.0.jar, OMS/JDK/ibm-java-sdk-8.0-7.11-x86_64-archive.bin" --verbose

2. To build the images, run the required containers and establish the network, run the buildOMSPSQLImage.sh.

3. To delete and clean the images, processes and the network, excute the cleanOMSPSQLImage.sh

4. The buildOMSPSQLImage.sh, performs the following tasks:

    a. Executes OMSPostgreSQL/OMS/dockerimagebuild.sh and OMSPostgreSQL/PostgreSQL/dockerimagebuild.sh. 
    
    b. The OMSPostgreSQL/OMS/dockerimagebuild.sh builds the Sterling Order Management image and runs an instance of the container. It internally triggers the dockerfile located in the OMSPostgreSQL/OMS/ directory. 
    
    c. The OMSPostgreSQL/PostgreSQL/dockerimagebuild.sh builds the PostgreSQL image and runs an instance of the container. It internally triggers the dockerfile located in the OMSPostgreSQL/PostgreSQL/ directory. While starting the container the process also executes postgres-start.sh which starts the database and creates a new DB called OMS. The db name is passed as runtime parameter via docker run in the dockerimagebuild.sh. It creates a new schema called postgres.

5. Once the containers are started and running, enter into the OMS container terminal mode : docker exec -it omsplsql bash. Navigate to /home/admin/manage. Execute the following commands in the same order.

    a. om-install.sh
    b. cc-install.sh
    c. store-install.sh
    d. 3rdparty-install.sh 
    e. om-deploy.sh
    f. om-generateappmanager.sh 

To understand more about what each of the above execution does, read them in text mode. 

6. cleanOMSPSQLImage.sh internally triggers OMSPostgreSQL/OMS/dockerimageclean.sh, /PostgreSQL/dockerimageclean.sh and deletes the network.