<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asociar Promoción</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #e0e6ef; margin: 0; padding: 0; }
        .container { background-color: #0078d7; color: white; padding: 10px; display: flex; align-items: center; }
        .container img { width: 50px; margin-right: 10px; }
        .form-container { background-color: white; margin: 20px; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 8px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; display: flex; align-items: center; }
        label { width: 150px; font-weight: bold; }
        input[type="text"] { flex: 1; padding: 5px; border-radius: 4px; border: 1px solid #ccc; }
        select { flex: 1; padding: 5px; border-radius: 4px; border: 1px solid #ccc; }
        button { margin-left: 5px; padding: 5px 10px; border: none; border-radius: 4px; cursor: pointer; }
        .search-btn { background-color: #0078d7; color: white; }
        .assign-btn { background-color: #28a745; color: white; }
        .cancel-btn { background-color: #dc3545; color: white; margin-left: 10px; }
        .promotions-list { width: 100%; height: 150px; border: 1px solid #ccc; margin-top: 15px; overflow-y: auto; }
        .buttons { margin-top: 15px; text-align: center; }
    </style>
</head>
<body>
<div class="form-container">
    <div class="form-group">
        <label>Número de Servicio:</label>
        <input type="text" name="serviceNumber">
        <button class="search-btn">🔍</button>
    </div>
    <div class="form-group">
        <label>Tipo de Cliente:</label>
        <select name="clientType">
            <option value="">Seleccionar</option>
            <option value="residencial">Residencial</option>
            <option value="corporativo">Corporativo</option>
        </select>
    </div>
    <div class="form-group">
        <label>Promociones:</label>
    </div>
    <div class="promotions-list"></div>
    <div class="buttons">
        <button class="assign-btn">Asignar</button>
        <button class="cancel-btn">Cancelar</button>
    </div>
</div>
</body>
</html>
