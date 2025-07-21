-- =====================================================
-- SCRIPT PARA CONFIGURAR AUTENTICACIÓN EN ORACLE
-- Sistema de Promociones - Módulo de Seguridad
-- =====================================================

-- Conectar como usuario 'promo' a la base de datos
-- sqlplus promo/promo@192.168.1.7:1521/OPENFLEX

-- =====================================================
-- 1. CREAR TABLA DE USUARIOS DEL SISTEMA
-- =====================================================

-- Verificar si la tabla existe y eliminarla si es necesario
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE SYSTEM_USERS CASCADE CONSTRAINTS';
    DBMS_OUTPUT.PUT_LINE('Tabla SYSTEM_USERS eliminada');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Tabla SYSTEM_USERS no existía');
END;
/

-- Crear la tabla de usuarios
CREATE TABLE SYSTEM_USERS (
    username        VARCHAR2(50)    NOT NULL,
    full_name       VARCHAR2(200)   NOT NULL,
    email           VARCHAR2(100),
    active          CHAR(1)         DEFAULT 'Y' CHECK (active IN ('Y', 'N')),
    role            VARCHAR2(50)    DEFAULT 'USER',
    created_date    DATE            DEFAULT SYSDATE,
    last_login      DATE,
    password_hash   VARCHAR2(255),  -- Para futuras implementaciones
    failed_attempts NUMBER(3)       DEFAULT 0,
    locked_until    DATE,
    
    -- Constraints
    CONSTRAINT PK_SYSTEM_USERS PRIMARY KEY (username),
    CONSTRAINT CHK_EMAIL_FORMAT CHECK (email LIKE '%@%' OR email IS NULL),
    CONSTRAINT CHK_ROLE CHECK (role IN ('ADMIN', 'USER', 'VIEWER'))
);

-- Comentarios en la tabla
COMMENT ON TABLE SYSTEM_USERS IS 'Tabla de usuarios del sistema de promociones';
COMMENT ON COLUMN SYSTEM_USERS.username IS 'Nombre de usuario único';
COMMENT ON COLUMN SYSTEM_USERS.full_name IS 'Nombre completo del usuario';
COMMENT ON COLUMN SYSTEM_USERS.email IS 'Correo electrónico del usuario';
COMMENT ON COLUMN SYSTEM_USERS.active IS 'Estado del usuario (Y=Activo, N=Inactivo)';
COMMENT ON COLUMN SYSTEM_USERS.role IS 'Rol del usuario (ADMIN, USER, VIEWER)';
COMMENT ON COLUMN SYSTEM_USERS.created_date IS 'Fecha de creación del usuario';
COMMENT ON COLUMN SYSTEM_USERS.last_login IS 'Última fecha de acceso';
COMMENT ON COLUMN SYSTEM_USERS.failed_attempts IS 'Intentos fallidos de login';
COMMENT ON COLUMN SYSTEM_USERS.locked_until IS 'Fecha hasta la cual está bloqueado';

-- =====================================================
-- 2. CREAR ÍNDICES PARA OPTIMIZAR CONSULTAS
-- =====================================================

CREATE INDEX IDX_SYSTEM_USERS_ACTIVE ON SYSTEM_USERS(active);
CREATE INDEX IDX_SYSTEM_USERS_ROLE ON SYSTEM_USERS(role);
CREATE INDEX IDX_SYSTEM_USERS_EMAIL ON SYSTEM_USERS(email);
CREATE INDEX IDX_SYSTEM_USERS_LAST_LOGIN ON SYSTEM_USERS(last_login);

-- =====================================================
-- 3. INSERTAR USUARIO ADMINISTRADOR POR DEFECTO
-- =====================================================

-- Insertar usuario administrador (usando las credenciales existentes)
INSERT INTO SYSTEM_USERS (
    username, 
    full_name, 
    email, 
    active, 
    role, 
    created_date
) VALUES (
    'promo',
    'Administrador del Sistema',
    'admin@promociones.com',
    'Y',
    'ADMIN',
    SYSDATE
);

-- Insertar algunos usuarios de ejemplo
INSERT INTO SYSTEM_USERS (
    username, 
    full_name, 
    email, 
    active, 
    role, 
    created_date
) VALUES (
    'operador1',
    'Operador de Promociones 1',
    'operador1@promociones.com',
    'Y',
    'USER',
    SYSDATE
);

INSERT INTO SYSTEM_USERS (
    username, 
    full_name, 
    email, 
    active, 
    role, 
    created_date
) VALUES (
    'consultor',
    'Consultor de Solo Lectura',
    'consultor@promociones.com',
    'Y',
    'VIEWER',
    SYSDATE
);

-- =====================================================
-- 4. CREAR SECUENCIAS (SI SE NECESITAN EN EL FUTURO)
-- =====================================================

-- Secuencia para logs de auditoría (futuro)
CREATE SEQUENCE SEQ_AUDIT_LOG
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE
    NOCACHE;

-- =====================================================
-- 5. CREAR TRIGGER PARA AUDITORÍA (OPCIONAL)
-- =====================================================

-- Trigger para registrar cambios en usuarios
CREATE OR REPLACE TRIGGER TRG_SYSTEM_USERS_AUDIT
    AFTER INSERT OR UPDATE OR DELETE ON SYSTEM_USERS
    FOR EACH ROW
DECLARE
    v_operation VARCHAR2(10);
BEGIN
    -- Determinar el tipo de operación
    IF INSERTING THEN
        v_operation := 'INSERT';
    ELSIF UPDATING THEN
        v_operation := 'UPDATE';
    ELSIF DELETING THEN
        v_operation := 'DELETE';
    END IF;
    
    -- Log básico en la consola (en producción se guardaría en tabla de auditoría)
    DBMS_OUTPUT.PUT_LINE('AUDIT: ' || v_operation || ' en SYSTEM_USERS - Usuario: ' || 
        COALESCE(:NEW.username, :OLD.username) || ' - Fecha: ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS'));
        
EXCEPTION
    WHEN OTHERS THEN
        -- No fallar la operación principal por errores de auditoría
        NULL;
END;
/

-- =====================================================
-- 6. CREAR VISTA PARA CONSULTAS DE USUARIOS
-- =====================================================

CREATE OR REPLACE VIEW VW_ACTIVE_USERS AS
SELECT 
    username,
    full_name,
    email,
    role,
    created_date,
    last_login,
    CASE 
        WHEN last_login IS NULL THEN 'Nunca'
        WHEN last_login > SYSDATE - 1 THEN 'Hoy'
        WHEN last_login > SYSDATE - 7 THEN 'Esta semana'
        WHEN last_login > SYSDATE - 30 THEN 'Este mes'
        ELSE 'Hace más de un mes'
    END as last_activity,
    failed_attempts,
    CASE 
        WHEN locked_until IS NOT NULL AND locked_until > SYSDATE THEN 'Bloqueado'
        ELSE 'Activo'
    END as status
FROM SYSTEM_USERS 
WHERE active = 'Y'
ORDER BY last_login DESC NULLS LAST;

-- =====================================================
-- 7. OTORGAR PERMISOS (SI ES NECESARIO)
-- =====================================================

-- Si necesitas otorgar permisos a otros usuarios:
-- GRANT SELECT, INSERT, UPDATE, DELETE ON SYSTEM_USERS TO otro_usuario;
-- GRANT SELECT ON VW_ACTIVE_USERS TO usuario_consulta;

-- =====================================================
-- 8. VERIFICAR LA INSTALACIÓN
-- =====================================================

-- Mostrar información de la tabla creada
SELECT 'Tabla SYSTEM_USERS creada exitosamente' as resultado FROM dual;

-- Mostrar usuarios insertados
SELECT 
    username,
    full_name,
    role,
    active,
    TO_CHAR(created_date, 'DD/MM/YYYY HH24:MI:SS') as fecha_creacion
FROM SYSTEM_USERS
ORDER BY created_date;

-- Mostrar estadísticas
SELECT 
    COUNT(*) as total_usuarios,
    SUM(CASE WHEN active = 'Y' THEN 1 ELSE 0 END) as usuarios_activos,
    SUM(CASE WHEN role = 'ADMIN' THEN 1 ELSE 0 END) as administradores,
    SUM(CASE WHEN role = 'USER' THEN 1 ELSE 0 END) as usuarios_normales,
    SUM(CASE WHEN role = 'VIEWER' THEN 1 ELSE 0 END) as consultores
FROM SYSTEM_USERS;

-- =====================================================
-- INSTRUCCIONES DE USO:
-- =====================================================
/*
1. Ejecutar este script conectado como usuario 'promo'
2. Verificar que la tabla se creó correctamente
3. El sistema ya está configurado para usar:
   - Usuario: promo
   - Contraseña: promo
   
4. Para agregar más usuarios, usar:
   INSERT INTO SYSTEM_USERS (username, full_name, email, role) 
   VALUES ('nuevo_usuario', 'Nombre Completo', 'email@dominio.com', 'USER');

5. Para desactivar un usuario:
   UPDATE SYSTEM_USERS SET active = 'N' WHERE username = 'usuario';

6. Para ver usuarios activos:
   SELECT * FROM VW_ACTIVE_USERS;
*/

COMMIT;

DBMS_OUTPUT.PUT_LINE('=== CONFIGURACIÓN DE AUTENTICACIÓN COMPLETADA ===');
DBMS_OUTPUT.PUT_LINE('Usuario por defecto: promo / promo');
DBMS_OUTPUT.PUT_LINE('El sistema está listo para usar'); 