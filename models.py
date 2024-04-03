from sqlalchemy import String, Integer, Column
from database import Base

class User(Base):
    __tablename__= "usuarios"
    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(50))
    password = Column(String(50))
