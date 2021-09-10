FROM harbor.clouddari.com/jwtest/app:test
COPY app.js .
ENTRYPOINT ["bash","docker-entrypoint.sh"]	
CMD ["/bin/sh", "-c", "node app.js"]
