from datetime import datetime
from typing import Annotated, List
from fastapi import Depends, APIRouter, HTTPException, status
from app.schemas.prediction_input import PredictionRequest, PredictionResponse


pred_router = APIRouter(
    tags=['Prediction Endpoints']
)

@pred_router.post('/get_prediction',response_model=PredictionResponse)
def give_prediction(pred_req : PredictionRequest):
    return f"user_id: {pred_req.user_id}\ncrop_name: {pred_req.crop_name}\nseason: {pred_req.season}\nstate: {pred_req.state}\narea_inHectares: {pred_req.area_inHectares}\nannual_rainfall_inMM: {pred_req.annual_rainfall_inMM}\npesticide_inKG: {pred_req.pesticide_inKG}\nfertiliser_inKG: {pred_req.fertiliser_inKG}\nyield_inMetricTons: {pred_req.yield_inMetricTons}"