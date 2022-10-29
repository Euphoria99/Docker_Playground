FROM node AS image1

WORKDIR /app

COPY /node-app/package.json /app/

RUN npm install 

COPY /node-app/ /app

EXPOSE 3000

CMD ["npm" , "start" ]

FROM python AS image2

WORKDIR /app2

COPY /python-app/ /app2

CMD ["python", "bmi.py"]