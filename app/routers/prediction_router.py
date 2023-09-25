from datetime import datetime
from typing import Annotated, List
from fastapi import Depends, APIRouter, HTTPException, status
import app.schemas as schemas
from schemas.prediction_input import PredictionRequest


pred_router = APIRouter(
    tags=['Prediction Endpoints']
)

@pred_router.post('/get_prediction',response_model=PredictionRequest)
def give_prediction(pred_req : PredictionRequest):
    return f"user_id: {pred_req.user_id}\ncrop_name: {pred_req.crop_name}"