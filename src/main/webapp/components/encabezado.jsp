<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="modelo.dto.Customer" %>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    String welcomeMessage = (customer != null) ? "Bienvenido " + customer.getUsuario() : "Iniciar sesión";
    boolean isLoggedIn = (customer != null);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Enchufate</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/chatbot.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="Inicio.jsp">CineMass</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="market.jsp">Tienda</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Cubiculos.jsp">Salas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="acercade.jsp">Acerca de</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Contactenos.jsp">Contacto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="locales.jsp">Locales</a>
                    </li>
                </ul>
                <div class="d-flex align-items-center">
                    <button class="btn btn-light me-2">
                        <%= isLoggedIn ? welcomeMessage : "<a href='login.jsp' class='text-decoration-none'>" + welcomeMessage + "</a>" %>
                    </button>
                    <% if (isLoggedIn) { %>
                    <button class="btn btn-danger me-2">
                        <a href="logout" class="text-white text-decoration-none">Cerrar sesión</a>
                    </button>
                    <% } %>
                    <a href="cntCarrito?action=view" class="btn btn-outline-light">
                        <img src="${pageContext.request.contextPath}/resources/img/inicio/CarroCompra.png" alt="" style="height: 20px;"> Carrito de compras
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/scrip/chat-bot.js"></script>
<div class="chat-bot-container" id="chatBot">
    <div class="chat-header">EnchufateBot</div>
    <div class="chat-body" id="chatBody">
        <!-- Mensajes del chat -->
    </div>
</div>
</body>
</html>