Pasos para correr el proyecto:
1) Copiar link del repositorio de GitHub
2) Abrir Visual Studio Code (asegurarse de tener instalado Git)
3) Abrir terminal (Ctrl + Shift + Ñ), escribir 'git clone {link del repositorio}' y correr comando.
4) Una vez clonado el repositorio, instalar el certificado de https trust escribiendo 'dotnet dev-certs https --trust' y ejecutando el comando. Se va a abrir una ventana diciendo si quiere intalar el certificado, poner que sí.
5) Abrir Microsoft SQL Server Management Studio y correr el script de la base de datos (ubicación: ProyectoFinal_MedLife/wwwroot/bd/MedLife.sql)
6) Volver a Visual Studio Code y presionar tecla F5. y listo! A probarlo :D

¡AVISO! (A corregir) --> El recordar sesión no recuerda el id del usuario, asi que es necesario volver a iniciar sesión para que corra correctamente.