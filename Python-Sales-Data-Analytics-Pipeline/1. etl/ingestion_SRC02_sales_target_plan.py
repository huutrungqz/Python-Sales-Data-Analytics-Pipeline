from dotenv import load_dotenv
import os
import psycopg2
import pandas as pd
from sqlalchemy import create_engine
import logging


logging.basicConfig(filename='ingestion_log.txt', level=logging.INFO,\
                    format='%(asctime)s - %(levelname)s - %(message)s')

load_dotenv()

HOST = os.getenv("DB_HOST")
PORT = os.getenv("DB_PORT")
USER = os.getenv("USER_NAME")
PWD = os.getenv("DB_PASSWORD")
DB = os.getenv("DB_DBNAME")


engine = create_engine(f'postgresql+psycopg2://{USER}:{PWD}@{HOST}:{PORT}/{DB}')
file_path = r"C:\Users\Chun\Desktop\Python PJ3\VietDist_SampleData\SRC02_sales_target_plan.xlsx"
table_name = 'sales_target_plan'

def extract_raw_excel(file_path):
    data_v1 = pd.read_excel(file_path,sheet_name='Plan_v1_Original')
    data_v2 = pd.read_excel(file_path,sheet_name='Plan_v2_Adjustment_H2')
    data = pd.concat([data_v1, data_v2], ignore_index=True)
    return data

try:
    table = extract_raw_excel(file_path)
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
