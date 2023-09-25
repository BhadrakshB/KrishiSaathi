from datetime import datetime
import enum
from typing import List
from sqlalchemy import DECIMAL, TIMESTAMP, Boolean, Column, Enum, ForeignKey, Integer, String, Table, func
from sqlalchemy.orm import relationship

from .database import Base


class CropsTable(Base):
    __tablename__ = 'crops_table'
    
    id = Column(Integer, primary_key=True, index=True, autoincrement=True, nullable=False)
    user_id = Column(String, ForeignKey("users.id", verbose_name=""))
    crop_name = Column(String, nullable=False)
    season = Column(String, nullable=False)
    state = Column(String, nullable=False)
    area_inHectares = Column(DECIMAL, nullable=False)
    annual_rainfall_inMM = Column(DECIMAL, nullable=False)
    pesticide_inKG = Column(DECIMAL, nullable=False)
    fertiliser_inKG = Column(DECIMAL, nullable=False)
    yield_inMetricTons = Column(DECIMAL, nullable=False)
    
    user = relationship("User", back_populates='crops')
    
class User(Base):
    __tablename__ = "users"

    id = Column(String, primary_key=True, nullable=False)
    
    username = Column(String, unique = True,nullable=True)
    email = Column(String, unique=True, index=True, nullable=False)
    password = Column(String)
    created_at = Column(TIMESTAMP(timezone=True),
                       nullable=False, server_default=func.now(), default=datetime.now())
    last_edited = Column(TIMESTAMP(timezone=True),
                       nullable=False, onupdate=func.now(), default=datetime.now()) 
    is_seller = Column(Boolean, default=False)
    
    # Foreign key relations
    crops = relationship("CropsTable", back_populates='user')

    