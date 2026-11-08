FROM python:3.7-alpine

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

COPY *.py RFLinkGateway/

ENV RFLINK_CONF_FILE="/config/config.json" \
	RFLINK_LOG_LEVEL="INFO" \
	RFLINK_FILE_LOG_LEVEL="INFO" \
	RFLINK_STREAM_LOG_LEVEL="INFO" \
	RFLINK_LOG_FILE="/log/RFLinkGateway.log" \
	RFLINK_RECONNECT_DELAY="30"

VOLUME /config /log

CMD [ "python", "RFLinkGateway/RFLinkGateway.py" ]
