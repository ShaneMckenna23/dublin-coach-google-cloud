# Google Cloud Setup
This repository documents my google cloud setup for my concept Dublin Coach Progressive Web Application. 

## Service Accouts
These accounts are used to access various google cloud services. For my project I setup two service accounts, one for Circle Ci and the other for cloud-sql-proxy. 

This allowed:
 - Circle Ci to push docker images to Container Registry and update my Kubernetes cluster.
 - cloud-sql-proxy to access my database. 

## Cloud SQL 
Cloud SQL is a fully-managed database service that makes it easy to set up, maintain, manage, and administer your relational databases on Google Cloud Platform. I used the MySQL version for this project.

### Users

 - proxyuser - Used by cloud-sql-proxy. 
 - dbuser - Used by dublin-coach-backend.

### Authentication 
cloud-sql-proxy uses a service account to access the database. When deployed dublin-coach-backend connects to the database through cloud-sql proxy. When developing locally dublin-coach-backend connects directly to the database, the developers IP must be on a pre-approved list.


## Kubernetes Services

### dublin-coach-frontend
### dublin-coach-backend
### cloud-sql-proxy
### kube-lego
