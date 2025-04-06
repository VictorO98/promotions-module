<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="formulario-asociar">
    <h2>Asociar Promoción</h2>

    <form>
        <!-- Número de Servicio -->
        <div class="input-group">
            <label for="numeroServicio">Número de Servicio</label>
            <div style="display: flex; align-items: center;">
                <input type="text" id="numeroServicio" name="numeroServicio" />
                <button type="button" class="search-button">
                    🔍
                </button>
            </div>
        </div>

        <!-- Tipo de Cliente -->
        <div class="input-group">
            <label for="tipoCliente">Tipo de Cliente</label>
            <select id="tipoCliente" name="tipoCliente">
                <option value="">Seleccione</option>
                <option value="residencial">Residencial</option>
                <option value="corporativo">Corporativo</option>
            </select>
        </div>

        <!-- Promociones -->
        <div class="input-group">
            <label>Promociones</label>
            <div class="promociones-box">
                <!-- Aquí podrías incluir una tabla o lista de promociones -->
            </div>
        </div>

        <!-- Botones -->
        <div class="button-group">
            <button type="submit">Asignar</button>
            <button type="button">Cancelar</button>
        </div>
    </form>
</div>
