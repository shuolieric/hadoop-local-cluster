# My hadoop cluster docker project  

* You shoud add jars in lib directory by yourself   
* Containers' volumns are stored in data directory  

## **Usage**

* Use config/cluster-env.sh.template to setup your own mysql password  

* Use build.sh to build imagesd  
`sh build.sh ${version}`  

* Use cluster.sh to start & stop docker cluster  
`sh cluster.sh start|stop`
