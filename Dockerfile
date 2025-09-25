FROM nginx:alpine

# remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# set working directory
WORKDIR /usr/share/nginx/html

# copy all files to the container working directory
COPY . /usr/share/nginx/html/

EXPOSE 80

# start nginx server
CMD ["nginx", "-g", "daemon off;"]