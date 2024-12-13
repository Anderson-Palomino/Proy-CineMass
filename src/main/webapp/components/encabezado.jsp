
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-WpOoh77ENJvniRxdKpbfbitzQ3uH+mpombsLlDosJNqDNJjHlBXlzE81jDIpD5z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-PJ6ckfw5SIhAy6eMfIGhtKkDxOnx5CXa9/oM/TX8MEcBgvktw5IBDRU96uMpThvC" crossorigin="anonymous"></script>
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
<header>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="Inicio.jsp">ENCHUFATE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="market.jsp">Tienda</a></li>
                <li class="nav-item"><a class="nav-link" href="Cubiculos.jsp">Cubiculos</a></li>
                <li class="nav-item"><a class="nav-link" href="acercade.jsp">Acerca de</a></li>
                <li class="nav-item"><a class="nav-link" href="Contactenos.jsp">Contacto</a></li>
                <li class="nav-item"><a class="nav-link" href="locales.jsp">Locales</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <%= isLoggedIn ? welcomeMessage : "<a class='nav-link' href='login.jsp'>" + welcomeMessage + "</a>"%>
                </li>
                <% if (isLoggedIn) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Cerrar sesión</a>
                    </li>
                <% }%>
                <li class="nav-item">
                    <a class="nav-link" href="cntCarrito?action=view"><img src="${pageContext.request.contextPath}/resources/img/inicio/CarroCompra.png" alt="" width="20px"> Carrito de compras</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
    <link href="resources/css/chatbot.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/resources/scrip/chat-bot.js"></script>
        <div class="chat-bot-container" id="chatBot">
        <div class="chat-header">EnchufateBot</div>
        <div class="chat-body" id="chatBody">
            <!-- Mensajes del chat -->
        </div>
    </div>
</header>
            
