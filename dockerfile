FROM harbor.clouddari.com/jwtest/gradle-project:0.0.1
COPY app.js .
ENTRYPOINT ["docker-entrypoint.sh"]	
CMD ["/bin/sh", "-c", "node app.js"]
