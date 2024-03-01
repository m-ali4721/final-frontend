# Use a lightweight Nginx image as base
FROM nginx:alpine

# Set working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy frontend files into nginx HTML directory
COPY . .

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
