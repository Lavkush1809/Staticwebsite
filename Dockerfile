# Use the official Nginx base image
FROM nginx:latest

# Copy the custom Nginx configuration file
COPY /home/lavkush/newsite.conf /etc/nginx/conf.d/default.conf

# Copy the HTML file to the Nginx default HTML directory
COPY /home/lavkush/newsite.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]



