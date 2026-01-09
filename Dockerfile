# select base imge
FROM httpd

# copy index.html from current directory to the htdocs direct
COPY index.html /usr/local/apache2/htdocs

# open port 80 for incominh http requests
EXPOSE 80