# Start with Red Hat UBI httpd image
FROM registry.access.redhat.com/ubi9/httpd-24:1-277

# Build-time args
ARG APP_VERSION=1.0.0
ARG SITE_NAME="DefaultSite"

# Promote ARG to ENV so runtime can see it
ENV APP_VERSION=${APP_VERSION} \
    SITE_NAME=${SITE_NAME}

# Copy website files (if you have index.html)
COPY ./html/ /var/www/html/

# Write build info
RUN echo "Built ${SITE_NAME} v${APP_VERSION}" > /var/www/html/build-info.txt

EXPOSE 8080

# Default CMD comes from base image: runs httpd
