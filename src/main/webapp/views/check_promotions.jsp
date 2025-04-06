<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de Promociones</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
</head>
<body>
<div class="consulta-promociones-container">
    <h2>Consulta de Promociones</h2>

    <form class="consulta-form">
        <div class="input-group-individual">
            <label for="nombrePromocion">Nombre promoción: </label>
            <input type="text" id="nombrePromocion">
        </div>

        <div class="input-group">
            <label for="vigenciaInicio">Vigencia de promoción: </label>
            <input type="date" id="vigenciaInicio" placeholder="dd/mm/aaaa">
            <span> a </span>
            <input type="date" id="vigenciaFin" placeholder="dd/mm/aaaa">
        </div>

        <div class="botones-consulta">
            <button type="button" class="cta-button">Consultar</button>
            <button type="reset" class="cta-button">Limpiar Campos</button>
        </div>
    </form>

    <table class="tabla-promociones">
        <thead>
        <tr>
            <th>Código Promoción</th>
            <th>Nombre Promoción</th>
            <th>Departamento</th>
            <th>Localidad</th>
            <th>Mercado</th>
            <th>Estrato</th>
            <th>Tipo</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>001</td>
            <td>Promo Navidad</td>
            <td>Ventas</td>
            <td>Bogotá</td>
            <td>Corporativo</td>
            <td>3</td>
            <td>Especial</td>
        </tr>
        <tr>
            <td>002</td>
            <td>Promo Verano</td>
            <td>Marketing</td>
            <td>Medellín</td>
            <td>Residencial</td>
            <td>4</td>
            <td>Estándar</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
