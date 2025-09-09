import psycopg2

try:
    # Configuración de conexión
    conn = psycopg2.connect(
        host="localhost",
        database="liga_cut",
        user="postgres",
        port="5432",
        password="oswaldo",
       
    )
    cursor = conn.cursor()
    print(" Conexión a PostgreSQL exitosa")
except psycopg2.Error as e:
    print(" Error al conectar a PostgreSQL")
    print(e)
