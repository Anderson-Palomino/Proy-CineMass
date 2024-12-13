<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enchufate</title>
        <link href="resources/css/inicio.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                background: url('${pageContext.request.contextPath}/resources/img/inicio/fondoenchufate.png') no-repeat center center fixed;
                background-attachment: fixed;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <jsp:include page="components/encabezado.jsp"/>
        <main>
            <div class="hero text-center py-5">

                <h1 class="display-3 fw-bold text-white">CineMass</h1>

                <p class="lead text-white">Tu Tiempo, Tu Espacio, Tu Conexión con tus Peliculas Favoritas</p>

                <a href="#" class="btn btn-primary btn-lg">Más información</a>
            </div>

            <!-- Nueva Sección de Cubículos -->
            <section class="cubicles py-5 bg-light">

                <h2 class="text-center mb-5">Salas</h2>

                <div class="cubicle-container d-flex justify-content-around flex-wrap">

                    <div class="cubicle text-center shadow-sm mb-4">

                        <img src="${pageContext.request.contextPath}/resources/img/inicio/SalaNormal.jpg" class="img-fluid rounded mb-3" alt="Cubículo General">

                        <h3 class="h5">Sala General</h3>

                        <p class="text-muted mb-0">S/. 5 x hora</p>
                    </div>
                    <div class="cubicle text-center shadow-sm mb-4">

                        <img src="${pageContext.request.contextPath}/resources/img/inicio/SalaVip.webp" class="img-fluid rounded mb-3" alt="Cubículo VIP">

                        <h3 class="h5">Sala VIP</h3>

                        <p class="text-muted mb-0">S/. 8 x hora</p>
                    </div>
                    <div class="cubicle text-center shadow-sm mb-4">

                        <img src="${pageContext.request.contextPath}/resources/img/inicio/SalaUltraVip.webp" class="img-fluid rounded mb-3" alt="Cubículo ULTRA VIP">

                        <h3 class="h5">Sala ULTRA VIP</h3>

                        <p class="text-muted mb-0">S/. 12 x hora</p>
                    </div>
                </div>
                <a href="#" class="btn btn-secondary btn-lg mt-4 d-block mx-auto">Tienda</a>
            </section>
        </main>
        <jsp:include page="components/pie.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>