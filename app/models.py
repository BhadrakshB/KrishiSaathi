from datetime import datetime
import enum
from typing import List
from sqlalchemy import DECIMAL, TIMESTAMP, Boolean, Column, Enum, ForeignKey, Integer, String, Table, func
from sqlalchemy.orm import relationship

from .database import Base


class CropsTable(Base):
    __tablename__ = 'crops_table'
    
    id = Column(Integer, primary_key=True, index=True, autoincrement=True, nullable=False)
    crop_name = Column(String, nullable=False)
    season = Column(String, nullable=False)
    state = Column(String, nullable=False)
    area_inHectares = Column(DECIMAL, nullable=False)
    annual_rainfall_inMM = Column(DECIMAL, nullable=False)
    pesticide_inKG = Column(DECIMAL, nullable=False)
    fertiliser_inKG = Column(DECIMAL, nullable=False)
    