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
<header>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <nav>
        <ul>
            <li><a href="market.jsp">Tienda</a></li>
            <li><a href="Cubiculos.jsp">Cubiculos</a></li>
            <li><a href="acercade.jsp">Acerca de</a></li>
            <li><a href="Contactenos.jsp">Contacto</a></li>
            <li><a href="locales.jsp">Locales</a></li>
        </ul>
        <div class="logo"><a href="Inicio.jsp">ENCHUFATE</a></div>
        <div class="auth-cart">
            <button class="btnnavbar btn-color" style="padding: 0px 16px; cursor: pointer; height: 36px">
                <%= isLoggedIn ? welcomeMessage : "<a href='login.jsp'>" + welcomeMessage + "</a>"%>
            </button>
            <% if (isLoggedIn) { %>
            <button class="btnnavbar btn-color" style="padding: 0px 16px; cursor: pointer; height: 36px">
                <a href="logout">Cerrar sesión</a>
            </button>
            <% }%>   
            <a href="cntCarrito?action=view"><img src="${pageContext.request.contextPath}/resources/img/inicio/CarroCompra.png" alt="">Carrito de compras</a>
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
            
