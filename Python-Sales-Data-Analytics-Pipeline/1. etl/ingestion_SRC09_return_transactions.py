from dotenv import load_dotenv
import os
import psycopg2
import pandas as pd
from sqlalchemy import create_engine
import logging
from datetime import datetime


logging.basicConfig(filename='ingestion_log.txt', level=logging.INFO,\
                    format='%(asctime)s - %(levelname)s - %(message)s')

load_dotenv()

HOST = os.getenv("DB_HOST")
PORT = os.getenv("DB_PORT")
USER = os.getenv("USER_NAME")
PWD = os.getenv("DB_PASSWORD")
DB = os.getenv("DB_DBNAME")


engine = create_engine(f'postgresql+psycopg2://{USER}:{PWD}@{HOST}:{PORT}/{DB}')
file_path = r"C:\Users\Chun\Desktop\Python PJ3\VietDist_SampleData\SRC09_return_transactions.csv"
table_name = 'return_transactions'

def extract_raw_csv(file_path):
    data = pd.read_csv(file_path)
    return data

try:
    table = extract_raw_csv(file_path)
    print(table)

    table.to_sql(
        name = table_name,
        con = engine,
        if_exists= 'replace',
        schema = 'raw'
    )
    print('Load to sql successfully')
    logging.info(f'Load table_name: {table_name} successfully')

except Exception as e:
    print(f'Error! {e}')
    logging.info(f'Load table_name: {table_name} errror: {e}')
