FROM harbor.clouddari.com/jwtest/app:test
COPY app.js .
ENTRYPOINT ["/bin/sh","docker-entrypoint.sh"]	
CMD ["/bin/sh", "-c", "node app.js"]
