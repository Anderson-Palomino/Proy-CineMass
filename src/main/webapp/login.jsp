<%-- 
    Document   : login
    Created on : 24 may. 2024, 12:14:32
    Author     : usuario
--%>

<%@ page contentType="text/html charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <link href="resources/css/login.css" rel="stylesheet" type="text/css"/>
    <style>
        .error-message {
            color: red;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 10px;
            margin-bottom: 15px;
            text-align: center;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div id="user-account-login-root">
        <div class="user-account-container">
            <div class="user-account-log">
                <h1>Inicio de Sesión</h1>
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null) {%>
                    <div class="error-message"><%= errorMessage %></div>
                <% } %>
                <form action="cntLogin" method="POST">
                    <div class="">
                        <div class="user-account">
                            <input type="email" placeholder="Correo electrónico" name="correo" required>
                        </div>
                    </div>
                    <div class="">
                        <div class="user-account">
                            <input type="password" placeholder="Contraseña" name="contrasena" required>
                        </div>
                    </div>
                    <button class="login-account-button" type="submit">
                        <span>Iniciar sesión</span>
                    </button>
                </form>
                <footer>
                    <a href="/account/login/request-reset">
                        <span>¿Olvidaste la contraseña?</span>
                    </a>
                    <a href="create-account.jsp">
                        <span>Crear cuenta</span>
                    </a>
                </footer>
            </div>
        </div>
    </div>
</body>
</html>

