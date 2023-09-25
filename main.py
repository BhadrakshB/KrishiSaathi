from fastapi import FastAPI

from app.routers.prediction_router import pred_router
from app.routers.users_router import user_router, auth_router

from app import models
from app import database

app = FastAPI()

models.Base.metadata.create_all(bind=database.engine)

app.include_router(pred_router)
app.include_router(user_router)
app.include_router(auth_router)

@app.get('/')
def starting():
    return {'detail': 'Welcome to KrishiSaarthi Project'}


config = {
    "apiKey": "AIzaSyD5-wA5anQsZoINThICIRwQhAkJ2zUe5Ys",
    "authDomain": "krishisaathi-46977.firebaseapp.com",
    "projectId": "krishisaathi-46977",
    "storageBucket": "krishisaathi-46977.appspot.com",
    "messagingSenderId": "328506790331",
    "appId": "1:328506790331:web:9bb110cd66774bfc7b749e"
  }


