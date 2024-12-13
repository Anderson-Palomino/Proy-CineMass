<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enchufate - Productos</title>
        <link href="${pageContext.request.contextPath}/resources/css/market.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
            background: url('${pageContext.request.contextPath}/resources/img/inicio/fondoenchufate.png') no-repeat center center fixed;
            background-size: cover;
            }
        </style>
    </head>
    <body>
        <!-- Incluye el encabezado -->
        <jsp:include page="components/encabezado.jsp"/>

        <%
            // Obtener la lista de productos
            List<modelo.dto.Producto> productos = (List<modelo.dto.Producto>) request.getAttribute("listaProductos");

            if (productos == null || productos.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/cntProducto");
                return;
            }

            // Agrupar productos por categorías
            Map<String, List<modelo.dto.Producto>> productosPorCategoria = new HashMap<>();
            for (modelo.dto.Producto producto : productos) {
                productosPorCategoria.computeIfAbsent(producto.getNombreCategoria(), k -> new ArrayList<>()).add(producto);
            }

            // Enviar mapa al request
            request.setAttribute("productosPorCategoria", productosPorCategoria);
        %>

        <header class="text-center text-light py-4">
            <h1>Servicios Adicionales</h1>
            <p>Consulta los servicios adicionales que ofrecemos</p>
        </header>

        <main class="container my-5">
            <section class="menu-section">
                <h2 class="text-primary text-center mb-4">Productos</h2>

                <!-- Validación por si no hay productos o categorías -->
                <c:if test="${productosPorCategoria != null && !productosPorCategoria.isEmpty()}">
                    <!-- Iterar sobre las categorías -->
                    <c:forEach var="categoria" items="${productosPorCategoria.keySet()}">
                        <h3 class="text-secondary mt-5">${categoria}</h3>

                        <div class="row g-4 mt-3">
                            <!-- Iterar sobre los productos de cada categoría -->
                            <c:if test="${not empty productosPorCategoria[categoria]}">
                                <c:forEach var="producto" items="${productosPorCategoria[categoria]}">
                                    <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                                        <div class="card h-100">
                                            <img src="${pageContext.request.contextPath}/resources/img/inicio/${empty producto.imagen ? 'default.png' : producto.imagen}"
                                                 class="card-img-top img-fluid"
                                                 alt="${producto.nombre}">
                                            <div class="card-body">
                                                <h5 class="card-title">${producto.nombre}</h5>
                                                <p class="card-text">${producto.descripcion}</p>
                                                <p class="text-success fw-bold">Precio: S/.${producto.precio}</p>
                                                <form action="${pageContext.request.contextPath}/cntCarrito" method="post">
                                                    <input type="hidden" name="codProducto" value="${producto.codproducto}" />
                                                    <button type="submit" class="btn btn-primary">Agregar al Carrito</button>
                                                </form>

                                                <!-- Mensaje de éxito -->
                                                <c:if test="${not empty param.mensaje}">
                                                    <p class="text-success mt-2">${param.mensaje}</p>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </c:forEach>
                </c:if>

                <!-- Mostrar mensaje si no hay productos -->
                <c:if test="${productosPorCategoria == null || productosPorCategoria.isEmpty()}">
                    <p class="text-danger text-center">No hay productos disponibles.</p>
                </c:if>
            </section>
        </main>

        <!-- Incluye el pie de página -->
        <jsp:include page="components/pie.jsp"/>

        <!-- Script Bootstrap -->
        <script>
            var script = document.createElement('script');
            script.src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js";
            script.onload = function() {
                console.log('Bootstrap loaded from CDN.');
            };
            script.onerror = function() {
                console.error('Failed to load Bootstrap from CDN. Loading local fallback.');
                var fallback = document.createElement('script');
                fallback.src = "${pageContext.request.contextPath}/resources/js/bootstrap.min.js";
                document.head.appendChild(fallback);
            };
            document.head.appendChild(script);
        </script>
    </body>
</html>