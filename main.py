from fastapi import FastAPI, Depends, HTTPException, status
from pydantic import BaseModel
from datetime import date
from typing_extensions import Annotated

import uvicorn
import models
from database import SessionLocal, collection_libros_mongodb
from sqlalchemy.orm import Session
from sqlalchemy import text
from jinja2 import Environment, FileSystemLoader
from fastapi.responses import HTMLResponse, RedirectResponse

app = FastAPI()

class User(BaseModel):
    username: str
    password: str

def get_db():
    db=SessionLocal()
    try:
        yield db
    finally:
        db.close()

db_dependency = Annotated[Session, Depends(get_db)]

@app.post("/login", response_model=User, status_code=status.HTTP_200_OK)
async def login(user: User, db: Session = Depends(get_db)):
    db_user = db.query(models.User).filter(models.User.username == user.username).first()
    if not db_user or db_user.password != user.password:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid credentials")
    return RedirectResponse(url="/consultar")

@app.get("/", include_in_schema=False)
async def root():
    return RedirectResponse(url="/login")

@app.get("/login", response_class=HTMLResponse)
async def login_form():
    with open("login.html", "r") as file:
        html_content = file.read()
    return HTMLResponse(content=html_content, status_code=status.HTTP_200_OK)

@app.get("/consultar", status_code=status.HTTP_200_OK)
async def consultar_registros(db: Session = Depends(get_db)):
    query = text("""
    select l.titulo, a.autor_nombre, pa.pais as autor_nacionalidad, a.autor_fecha_nacimiento, g.genero as autor_genero, e.nombre_editorial, pai.pais as ubicacion_editorial, l.isbn, p.precio, s.stock, geo.latitud, geo.longitud 
    from tbl_libro l
    inner join tbl_autor a on l.fk_id_autor = a.id_autor
    inner join tbl_genero g on g.id_genero = l.fk_id_genero
    inner join tbl_stock s on s.id_stock = l.fk_id_stock
    inner join tbl_precio p on p.id_precio = l.fk_id_precio
    inner join tbl_editorial e on e.id_editorial = l.fk_id_editorial
    inner join tbl_pais pa on pa.id_pais = a.fk_id_pais
    inner join tbl_pais pai on pai.id_pais = e.fk_id_pais 
    inner join tbl_geolocalizacion geo on geo.id_geolocalizacion = e.fk_id_geolocalizacion
    """)

    result = db.execute(query)
    columns = list(result.keys())  # Convertir a lista
    data = result.fetchall()

    registros = []
    for row in data:
        registro = {}
        for i, value in enumerate(row):
            if isinstance(value, date):
                registro[columns[i]] = value.strftime('%Y-%m-%d')
            else:
                registro[columns[i]] = value
        registros.append(registro)

    env = Environment(loader=FileSystemLoader("."))
    template = env.get_template("tabla.html")
    rendered_template = template.render(columns=columns, rows=registros)

    return HTMLResponse(content=rendered_template, status_code=200)

@app.get("/consultar_json", status_code=status.HTTP_200_OK)
async def consultar_registros_json(db: Session = Depends(get_db)):
    query = text("""
    select l.titulo, a.autor_nombre, pa.pais as autor_nacionalidad, a.autor_fecha_nacimiento, g.genero as autor_genero, e.nombre_editorial, pai.pais as ubicacion_editorial, l.isbn, p.precio, s.stock, geo.latitud, geo.longitud 
    from tbl_libro l
    inner join tbl_autor a on l.fk_id_autor = a.id_autor
    inner join tbl_genero g on g.id_genero = l.fk_id_genero
    inner join tbl_stock s on s.id_stock = l.fk_id_stock
    inner join tbl_precio p on p.id_precio = l.fk_id_precio
    inner join tbl_editorial e on e.id_editorial = l.fk_id_editorial
    inner join tbl_pais pa on pa.id_pais = a.fk_id_pais
    inner join tbl_pais pai on pai.id_pais = e.fk_id_pais 
    inner join tbl_geolocalizacion geo on geo.id_geolocalizacion = e.fk_id_geolocalizacion
    """)

    result = db.execute(query)
    columns = list(result.keys())  # Convertir a lista
    data = result.fetchall()

    registros = []
    for row in data:
        registro = {}
        for i, value in enumerate(row):
            if isinstance(value, date):
                registro[columns[i]] = value.strftime('%Y-%m-%d')
            else:
                registro[columns[i]] = value
        registros.append(registro)

    return registros

@app.get("/guardar_mongodb", status_code=status.HTTP_200_OK)
async def guardar_sql_mongo(db: Session = Depends(get_db)):
    query = text("""
    select l.titulo, a.autor_nombre, pa.pais as autor_nacionalidad, a.autor_fecha_nacimiento, g.genero as autor_genero, e.nombre_editorial, pai.pais as ubicacion_editorial, l.isbn, p.precio, s.stock, geo.latitud, geo.longitud 
    from tbl_libro l
    inner join tbl_autor a on l.fk_id_autor = a.id_autor
    inner join tbl_genero g on g.id_genero = l.fk_id_genero
    inner join tbl_stock s on s.id_stock = l.fk_id_stock
    inner join tbl_precio p on p.id_precio = l.fk_id_precio
    inner join tbl_editorial e on e.id_editorial = l.fk_id_editorial
    inner join tbl_pais pa on pa.id_pais = a.fk_id_pais
    inner join tbl_pais pai on pai.id_pais = e.fk_id_pais 
    inner join tbl_geolocalizacion geo on geo.id_geolocalizacion = e.fk_id_geolocalizacion
    """)

    result = db.execute(query)
    columns = list(result.keys())  # Convertir a lista
    data = result.fetchall()

    registros = []
    for row in data:
        registro = {}
        for i, value in enumerate(row):
            if isinstance(value, date):
                registro[columns[i]] = value.strftime('%Y-%m-%d')
            else:
                registro[columns[i]] = value
        registros.append(registro)
    try:    
        collection_libros_mongodb.delete_many({})
        result = collection_libros_mongodb.insert_many(registros)
    except: 
        pass 
    return True 
     
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
    