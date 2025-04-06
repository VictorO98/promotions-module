<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Module de Promociones</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <script>
        const activeSection = "<%= request.getAttribute("activeSection") != null ? request.getAttribute("activeSection") : "" %>";
    </script>
</head>

<body>
<header>
    <div class="container">
        <h1>Modulo de Promociones</h1>
        <div class="menu-toggle" onclick="toggleMenu()">
            <span></span>
            <span></span>
            <span></span>
        </div>
        <nav id="menu">
            <a href="#" onclick="showSection('home')">Inicio</a>
            <a href="#" onclick="showSection('check_promotions')">Consultar Promociones</a>
            <a href="#" onclick="showSection('associate_promotion')">Asociar Promocion</a>
            <%--<a href="#" onclick="showSection('promotion_management')">Gestion de Promociones</a>
            <a href="#" onclick="showSection('promotions_report')">Reporte Promociones</a>
            <a href="#" onclick="showSection('product_management')">Gestión de Producto</a>
            <a href="#" onclick="showSection('check_assigned_promotions')">Consulta Promociones asignadas</a>--%>
        </nav>
    </div>
</header>

<main>
    <div id="home" class="section active">
        <h2>Bienvenido a la aplicación del modulo de Promociones</h2>
        <p>Esta es la plataforma que utiliza las Promociones de manera sencilla y eficiente.</p>
    </div>

    <%--Consultar Promociones--%>
    <div id="check_promotions" class="section">
        <jsp:include page="check_promotions.jsp" />
    </div>

    <%--Consultar Promociones--%>
    <div id="associate_promotion" class="section">
        <jsp:include page="associate_promotion.jsp" />
    </div>
</main>

<footer>
    <p>&copy; 2025 Promociones - Todos los derechos reservados</p>
</footer>

<script src="<%= request.getContextPath() %>/assets/js/scripts.js"></script>

</body>

</html>