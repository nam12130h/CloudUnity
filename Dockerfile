FROM nginx:stable-alpine

COPY ./Build /usr/share/nginx/html/Build
COPY ./TemplateData /usr/share/nginx/html/TemplateData
COPY ./StreamingAssets /usr/share/nginx/html/StreamingAssets
COPY ./index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]