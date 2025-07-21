<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Módulo de Promociones - Login</title>

            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Font Awesome -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
            <!-- Google Fonts -->
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
                rel="stylesheet">

            <style>
                body {
                    font-family: 'Roboto', sans-serif;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin: 0;
                    padding: 20px;
                }

                .login-container {
                    background: rgba(255, 255, 255, 0.95);
                    backdrop-filter: blur(10px);
                    border-radius: 20px;
                    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
                    padding: 0;
                    max-width: 900px;
                    width: 100%;
                    overflow: hidden;
                    min-height: 500px;
                }

                .login-left {
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    color: white;
                    padding: 60px 40px;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
                    text-align: center;
                    position: relative;
                    overflow: hidden;
                }

                .login-left::before {
                    content: '';
                    position: absolute;
                    top: -50%;
                    left: -50%;
                    width: 200%;
                    height: 200%;
                    background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="50" cy="50" r="1" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
                    animation: float 20s ease-in-out infinite;
                }

                @keyframes float {

                    0%,
                    100% {
                        transform: translateY(0px) rotate(0deg);
                    }

                    50% {
                        transform: translateY(-20px) rotate(180deg);
                    }
                }

                .login-left h1 {
                    font-size: 2.5rem;
                    font-weight: 700;
                    margin-bottom: 1rem;
                    z-index: 1;
                    position: relative;
                }

                .login-left p {
                    font-size: 1.1rem;
                    opacity: 0.9;
                    z-index: 1;
                    position: relative;
                }

                .login-icon {
                    font-size: 4rem;
                    margin-bottom: 2rem;
                    z-index: 1;
                    position: relative;
                }

                .login-right {
                    padding: 60px 40px;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                }

                .form-title {
                    text-align: center;
                    margin-bottom: 2rem;
                    color: #333;
                }

                .form-title h2 {
                    font-weight: 600;
                    color: #667eea;
                    margin-bottom: 0.5rem;
                }

                .form-title p {
                    color: #666;
                    margin: 0;
                }

                .form-group {
                    margin-bottom: 1.5rem;
                    position: relative;
                }

                .form-control {
                    border: 2px solid #e0e0e0;
                    border-radius: 10px;
                    padding: 15px 50px 15px 20px;
                    font-size: 1rem;
                    transition: all 0.3s ease;
                    background: #f8f9fa;
                }

                .form-control:focus {
                    border-color: #667eea;
                    box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
                    background: white;
                }

                .input-icon {
                    position: absolute;
                    right: 15px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #999;
                    font-size: 1.1rem;
                }

                .btn-login {
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    border: none;
                    border-radius: 10px;
                    padding: 15px;
                    font-size: 1.1rem;
                    font-weight: 600;
                    color: white;
                    transition: all 0.3s ease;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                }

                .btn-login:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
                    color: white;
                }

                .btn-login:active {
                    transform: translateY(0);
                }

                .alert {
                    border-radius: 10px;
                    margin-bottom: 1.5rem;
                    border: none;
                }

                .alert-danger {
                    background: linear-gradient(135deg, #ff6b6b, #ee5a52);
                    color: white;
                }

                .alert-success {
                    background: linear-gradient(135deg, #51cf66, #40c057);
                    color: white;
                }

                .remember-me {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    margin-bottom: 1.5rem;
                }

                .form-check-input {
                    margin-top: 0;
                }

                .forgot-password {
                    color: #667eea;
                    text-decoration: none;
                    font-size: 0.9rem;
                }

                .forgot-password:hover {
                    color: #764ba2;
                    text-decoration: underline;
                }

                .loading {
                    display: none;
                }

                .loading.show {
                    display: inline-block;
                }

                @media (max-width: 768px) {
                    .login-container {
                        margin: 10px;
                        border-radius: 15px;
                    }

                    .login-left,
                    .login-right {
                        padding: 40px 30px;
                    }

                    .login-left h1 {
                        font-size: 2rem;
                    }
                }

                .system-info {
                    position: fixed;
                    bottom: 20px;
                    right: 20px;
                    background: rgba(255, 255, 255, 0.9);
                    padding: 10px 15px;
                    border-radius: 10px;
                    font-size: 0.8rem;
                    color: #666;
                    backdrop-filter: blur(5px);
                }
            </style>
        </head>

        <body>

            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="login-container">
                            <div class="row g-0 h-100">
                                <!-- Lado izquierdo - Información -->
                                <div class="col-md-6 d-flex">
                                    <div class="login-left w-100">
                                        <div class="login-icon">
                                            <i class="fas fa-tags"></i>
                                        </div>
                                        <h1>Promociones</h1>
                                        <p>Sistema de gestión y administración de promociones empresariales</p>
                                        <div class="mt-4">
                                            <small>Acceso seguro • Control total • Gestión eficiente</small>
                                        </div>
                                    </div>
                                </div>

                                <!-- Lado derecho - Formulario -->
                                <div class="col-md-6 d-flex">
                                    <div class="login-right w-100">
                                        <div class="form-title">
                                            <h2>Iniciar Sesión</h2>
                                            <p>Ingrese sus credenciales para acceder al sistema</p>
                                        </div>

                                        <!-- Mensajes de error/éxito -->
                                        <c:if test="${not empty errorMessage}">
                                            <div class="alert alert-danger" role="alert">
                                                <i class="fas fa-exclamation-triangle me-2"></i>
                                                ${errorMessage}
                                            </div>
                                        </c:if>

                                        <c:if test="${param.message == 'logout'}">
                                            <div class="alert alert-success" role="alert">
                                                <i class="fas fa-check-circle me-2"></i>
                                                Sesión cerrada correctamente
                                            </div>
                                        </c:if>

                                        <!-- Formulario de login -->
                                        <form action="${pageContext.request.contextPath}/auth/login" method="post"
                                            id="loginForm">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="username" name="username"
                                                    placeholder="Usuario" value="${username}" required
                                                    autocomplete="username">
                                                <i class="fas fa-user input-icon"></i>
                                            </div>

                                            <div class="form-group">
                                                <input type="password" class="form-control" id="password"
                                                    name="password" placeholder="Contraseña" required
                                                    autocomplete="current-password">
                                                <i class="fas fa-lock input-icon"></i>
                                            </div>

                                            <div class="remember-me">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="on"
                                                        id="rememberMe" name="rememberMe">
                                                    <label class="form-check-label" for="rememberMe">
                                                        Recordarme
                                                    </label>
                                                </div>
                                                <a href="#" class="forgot-password">¿Olvidó su contraseña?</a>
                                            </div>

                                            <button type="submit" class="btn btn-login w-100">
                                                <span class="btn-text">Ingresar</span>
                                                <span class="loading">
                                                    <i class="fas fa-spinner fa-spin"></i> Verificando...
                                                </span>
                                            </button>
                                        </form>

                                        <div class="text-center mt-4">
                                            <small class="text-muted">
                                                <i class="fas fa-shield-alt me-1"></i>
                                                Conexión segura protegida
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Información del sistema -->
            <div class="system-info">
                <i class="fas fa-database me-1"></i>
                Oracle Database • v1.0
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const loginForm = document.getElementById('loginForm');
                    const btnText = document.querySelector('.btn-text');
                    const loading = document.querySelector('.loading');
                    const submitBtn = document.querySelector('.btn-login');

                    // Focus automático en el campo usuario
                    document.getElementById('username').focus();

                    // Manejar envío del formulario
                    loginForm.addEventListener('submit', function (e) {
                        // Mostrar loading state
                        btnText.style.display = 'none';
                        loading.classList.add('show');
                        submitBtn.disabled = true;

                        // Validación básica
                        const username = document.getElementById('username').value.trim();
                        const password = document.getElementById('password').value;

                        if (!username || !password) {
                            e.preventDefault();
                            btnText.style.display = 'inline';
                            loading.classList.remove('show');
                            submitBtn.disabled = false;

                            alert('Por favor complete todos los campos');
                            return;
                        }

                        // El formulario se enviará normalmente
                    });

                    // Manejar Enter en los campos
                    document.getElementById('username').addEventListener('keypress', function (e) {
                        if (e.key === 'Enter') {
                            document.getElementById('password').focus();
                        }
                    });

                    document.getElementById('password').addEventListener('keypress', function (e) {
                        if (e.key === 'Enter') {
                            loginForm.submit();
                        }
                    });

                    // Auto-hide alerts después de 5 segundos
                    const alerts = document.querySelectorAll('.alert');
                    alerts.forEach(alert => {
                        setTimeout(() => {
                            alert.style.opacity = '0';
                            setTimeout(() => {
                                alert.style.display = 'none';
                            }, 300);
                        }, 5000);
                    });
                });

                // Prevenir ataques de clickjacking
                if (top !== self) {
                    top.location = self.location;
                }
            </script>

        </body>

        </html>