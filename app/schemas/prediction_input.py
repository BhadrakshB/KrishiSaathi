from datetime import datetime
from typing import List, Optional
from pydantic import BaseModel


class PredictionBase(BaseModel):
    user_id : str
    crop_name : str
    season  : str
    state  : str
    area_inHectares  : float
    annual_rainfall_inMM  : float
    pesticide_inKG  : float
    fertiliser_inKG  : float
    
    class Config:
        orm_mode = True
    
        
class PredictionRequest(PredictionBase):
    yield_inMetricTons  : float   
    
    class Config:
        orm_mode = True
        

