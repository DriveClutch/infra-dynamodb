FROM driveclutch/alpine-java:1.0

RUN wget -q http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar zxvf dynamodb_local_latest.tar.gz && \
    rm dynamodb_local_latest.tar.gz &&
    apk -Uuv add groff less python py-pip && \
    pip install awscli && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

EXPOSE 8080

CMD ["java", "-jar", "DynamoDBLocal.jar", "-dbPath", ".", "--sharedDb", "-port", "8080"]
