# Script to send data (message) in JSON format to a Kafka with time interval (TIME_INTERVAL).

import random
import json
import sys
import os
import threading
import urllib.parse
from kafka import KafkaProducer
from json import dumps
from urllib.parse import quote
from datetime import datetime

# To enable debug modei.
#import logging
#logging.basicConfig(level=logging.DEBUG)

# Broker to send data to.
KAFKA_IP = os.getenv('KAFKA_IP')        # Kafka address
KAFKA_PORT = os.getenv('KAFKA_PORT')    # Kafka port
KAFKA_TOPIC = os.getenv('KAFKA_TOPIC')  # Kafka topic
TIME_INTERVAL = 3.0                     # Time interval to send data to the Kafka
MAX_BID_NUMBER = 2                      # Number of bid_x elements
MAX_ASK_NUMBER = 2                      # Number of ask_x elements

def script():

    # Interval to send data to the broker kafka in seconds.
    threading.Timer(TIME_INTERVAL, script).start()

    # To create kafka producer.
    producer = KafkaProducer(
            bootstrap_servers=(KAFKA_IP + ":" + KAFKA_PORT),
            value_serializer=lambda x: dumps(x).encode('utf-8') 
            )

    msg = ""    # To store intermediate values (bid_x, ask_x).
    bid_avg = 0 # Average value for all bid_x
    ask_avg = 0 # Average value for all ask_x

    # To store all bid_x values (in a range to 50) in the msg.
    for i in range(1,MAX_BID_NUMBER+1):
        ran_num = random.uniform(0, i*10)
        bid_avg += ran_num
        if i < 10:
            msg += "bid_0" + str(i) + ":" + f'{ran_num:.2f}' + "\n"
        else:
            msg += "bid_" + str(i) + ":" + f'{ran_num:.2f}' + "\n"

    bid_avg = bid_avg/MAX_ASK_NUMBER # To count average value.

    # To store all ask_x values (in a range to 50) in the msg.
    for i in range(1,MAX_ASK_NUMBER+1):
        ran_num = random.uniform(0, i*10)
        ask_avg += ran_num
        if i < 10:
            msg += "ask_0" + str(i) + ":" + f'{ran_num:.2f}' + "\n"
        else:
            msg += "ask_" + str(i) + ":" + f'{ran_num:.2f}' + "\n"

    ask_avg = ask_avg/MAX_ASK_NUMBER # To count average value. 

    # To get result message for the kafka in JSON format.
    data = {
            "bid_avg": f'{bid_avg:.2f}',
            "ask_avg": f'{ask_avg:.2f}',
        }
    message = {
            "timestamp": datetime.now().strftime("%m/%d/%Y, %H:%M:%S"),
            "data": msg,
            "stats": data
        }

    # To send data to the kafka to a test-topic.
    producer.send(
        KAFKA_TOPIC,
        value=message
        )
    producer.flush()

# To start script.
script()
