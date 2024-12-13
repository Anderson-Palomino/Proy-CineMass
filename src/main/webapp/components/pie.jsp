<footer>
    <style>
        footer {
            background-color: #222; /* Fondo oscuro para contraste */
            color: #fff; /* Texto blanco */
            padding: 20px 10px; /* Espaciado para más aire */
            text-align: center; /* Alineamos el texto al centro */
        }

        .footer-container {
            display: flex; /* Usamos flexbox para la disposición */
            justify-content: space-around; /* Espaciado uniforme entre secciones */
            flex-wrap: wrap; /* Adaptarse al espacio disponible */
            max-width: 1200px;
            margin: 0 auto; /* Centramos el contenido */
            padding: 10px 0;
        }

        .footer-section {
            margin: 10px; /* Espaciado entre las secciones */
            flex: 1; /* Permitir que cada sección crezca proporcionalmente */
            min-width: 200px; /* Evitar que colapsen en pantallas pequeñas */
        }

        .footer-section h3 {
            font-size: 1.2rem;
            margin-bottom: 10px;
            color: #ffa726; /* Color llamativo para los títulos */
            text-transform: uppercase;
        }

        .footer-section p,
        .footer-section a {
            font-size: 0.9rem;
            color: #ddd; /* Texto gris claro */
            text-decoration: none; /* Sin subrayado en los links por defecto */
        }

        .footer-section a:hover {
            color: #ffa726; /* Cambian de color al pasar el mouse */
            text-decoration: underline; /* Subrayado solo al pasar el mouse */
        }
    </style>

    <div class="footer-container">
        <div class="footer-section">
            <h3>Horario</h3>
            <p>Lunes a viernes<br>De 6:30 a. m. a 11 p. m.</p>
            <p><a href="Reclamos.jsp">Libro de Reclamaciones</a></p>
        </div>
        <div class="footer-section">
            <h3>Contacto</h3>
            <p><a href="mailto:cinemass@gmail.com">cinemass@gmail.com</a><br>(555) 555-5555</p>
        </div>
    </div>
</footer>