from sqlalchemy import Engine, create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import Session
from pymongo import MongoClient

# conexion a sql server
server = 'WIN-SCB11LVPTLD\SQLEXPRESS'
database = 'libreria'
username = 'sa'
password = 'admin123'
conn_str = f'mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server'

try:
    engine = create_engine(conn_str)
    SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
    Base = declarative_base()
    print("Conexión exitosa")
except Exception as e:
    print("Error al conectar:", e) 


# conexion a mongo
db_connection = MongoClient("mongodb://localhost:27017")
db = db_connection['libreria']
collection_libros_mongodb = db["libros"]