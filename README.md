1- Dockerfile for building an sql file using this command : 
docker build --tag mysqlImage .

2- using this command for running your dockerImage that you builded :
docker run --env-file qq.env -it --rm -p 3306:3306 mysqlImage


