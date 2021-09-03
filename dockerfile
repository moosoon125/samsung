FROM harbor.clouddari.com/library/gradle:7.11
COPY app.js .
ENTRYPOINT ["docker-entrypoint.sh"]	
CMD ["/bin/sh", "-c", "node app.js"]
