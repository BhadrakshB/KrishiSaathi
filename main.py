from fastapi import FastAPI
from app.routers.prediction_router import pred_router
from app import models
from app import database

app = FastAPI()

models.Base.metadata.create_all(bind=database.engine)

app.include_router(pred_router)

@app.get('/')
def starting():
    return {'detail': 'Welcome to KrishiSaarthi Project'}
