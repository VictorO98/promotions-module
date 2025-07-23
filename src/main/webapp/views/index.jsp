<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Módulo de Promociones</title>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
                <style>
                    :root {
                        --primary-color: #2563eb;
                        --primary-dark: #1d4ed8;
                        --primary-light: #3b82f6;
                        --secondary-color: #64748b;
                        --success-color: #10b981;
                        --warning-color: #f59e0b;
                        --error-color: #ef4444;
                        --background-color: #f8fafc;
                        --surface-color: #ffffff;
                        --text-primary: #1e293b;
                        --text-secondary: #64748b;
                        --border-color: #e2e8f0;
                        --border-radius: 12px;
                        --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
                        --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
                        --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
                        --transition: all 0.2s ease-in-out;
                    }

                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }

                    body {
                        font-family: 'Inter', sans-serif;
                        background-color: var(--background-color);
                        color: var(--text-primary);
                        line-height: 1.6;
                    }

                    /* Header */
                    .header {
                        background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
                        color: white;
                        padding: 1.5rem 0;
                        box-shadow: var(--shadow-lg);
                        position: sticky;
                        top: 0;
                        z-index: 1000;
                    }

                    .header-container {
                        max-width: 1400px;
                        margin: 0 auto;
                        padding: 0 1.5rem;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .logo {
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                        font-size: 1.5rem;
                        font-weight: 700;
                    }

                    .logo i {
                        background: rgba(255, 255, 255, 0.2);
                        padding: 0.5rem;
                        border-radius: 8px;
                    }

                    .header-right {
                        display: flex;
                        align-items: center;
                        gap: 2rem;
                    }

                    .nav-menu {
                        display: flex;
                        gap: 0.5rem;
                        list-style: none;
                        flex-wrap: wrap;
                    }

                    .nav-item {
                        position: relative;
                    }

                    .user-info {
                        display: flex;
                        align-items: center;
                        gap: 1.5rem;
                        color: white;
                        font-size: 0.875rem;
                        padding: 0.5rem 1rem;
                        background: rgba(255, 255, 255, 0.1);
                        border-radius: 8px;
                        min-width: 180px;
                    }

                    .user-display {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        flex: 1;
                    }

                    .user-avatar {
                        width: 32px;
                        height: 32px;
                        background: rgba(255, 255, 255, 0.2);
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-weight: 600;
                    }

                    .logout-btn {
                        background: rgba(255, 255, 255, 0.1);
                        color: white;
                        border: 1px solid rgba(255, 255, 255, 0.2);
                        padding: 0.5rem 1rem;
                        border-radius: 6px;
                        text-decoration: none;
                        transition: var(--transition);
                        font-size: 0.875rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .logout-btn:hover {
                        background: rgba(255, 255, 255, 0.2);
                        color: white;
                        text-decoration: none;
                    }



                    .nav-link {
                        color: white;
                        text-decoration: none;
                        padding: 0.625rem 1rem;
                        border-radius: 8px;
                        transition: var(--transition);
                        font-weight: 500;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        font-size: 0.9rem;
                        white-space: nowrap;
                    }

                    .nav-link:hover {
                        background: rgba(255, 255, 255, 0.1);
                        transform: translateY(-1px);
                    }

                    .nav-link.active {
                        background: rgba(255, 255, 255, 0.2);
                    }

                    .mobile-menu-toggle {
                        display: none;
                        background: none;
                        border: none;
                        color: white;
                        font-size: 1.5rem;
                        cursor: pointer;
                    }

                    /* Main Content */
                    .main-content {
                        max-width: 1400px;
                        margin: 2rem auto;
                        padding: 0 1.5rem;
                    }

                    .section {
                        display: none;
                    }

                    .section.active {
                        display: block;
                        animation: fadeIn 0.3s ease-in;
                    }

                    @keyframes fadeIn {
                        from {
                            opacity: 0;
                            transform: translateY(10px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    /* Home Section */
                    .welcome-card {
                        background: var(--surface-color);
                        border-radius: var(--border-radius);
                        padding: 3rem;
                        box-shadow: var(--shadow-md);
                        text-align: center;
                        border: 1px solid var(--border-color);
                    }

                    .welcome-card h2 {
                        font-size: 2.5rem;
                        font-weight: 700;
                        color: var(--primary-color);
                        margin-bottom: 1rem;
                    }

                    .welcome-card p {
                        font-size: 1.25rem;
                        color: var(--text-secondary);
                        max-width: 600px;
                        margin: 0 auto 2rem;
                    }

                    .feature-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                        gap: 1.5rem;
                        margin-top: 2rem;
                    }

                    .feature-card {
                        background: var(--background-color);
                        padding: 2rem;
                        border-radius: var(--border-radius);
                        text-align: center;
                        border: 1px solid var(--border-color);
                        transition: var(--transition);
                    }

                    .feature-card:hover {
                        transform: translateY(-4px);
                        box-shadow: var(--shadow-lg);
                    }

                    .feature-card .icon {
                        background: var(--primary-color);
                        color: white;
                        width: 60px;
                        height: 60px;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto 1rem;
                        font-size: 1.5rem;
                    }

                    .feature-card h3 {
                        color: var(--text-primary);
                        margin-bottom: 0.5rem;
                        font-weight: 600;
                    }

                    .feature-card p {
                        color: var(--text-secondary);
                        font-size: 0.9rem;
                    }

                    /* Container Styles */
                    .content-container {
                        background: var(--surface-color);
                        border-radius: var(--border-radius);
                        padding: 2rem;
                        box-shadow: var(--shadow-md);
                        border: 1px solid var(--border-color);
                    }

                    .section-header {
                        display: flex;
                        align-items: center;
                        gap: 1rem;
                        margin-bottom: 2rem;
                        padding-bottom: 1rem;
                        border-bottom: 2px solid var(--border-color);
                    }

                    .section-header h2 {
                        font-size: 1.875rem;
                        font-weight: 700;
                        color: var(--text-primary);
                    }

                    .section-header i {
                        color: var(--primary-color);
                        font-size: 1.5rem;
                    }

                    /* Development Notice */
                    .development-notice {
                        background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
                        border: 1px solid var(--border-color);
                        border-radius: var(--border-radius);
                        padding: 3rem;
                        text-align: center;
                        margin-top: 2rem;
                    }

                    .development-notice .icon {
                        background: var(--warning-color);
                        color: white;
                        width: 80px;
                        height: 80px;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto 1.5rem;
                        font-size: 2rem;
                    }

                    .development-notice h3 {
                        color: var(--text-primary);
                        font-size: 1.5rem;
                        margin-bottom: 1rem;
                    }

                    .development-notice p {
                        color: var(--text-secondary);
                        font-size: 1.1rem;
                        max-width: 500px;
                        margin: 0 auto;
                    }

                    /* Form Styles */
                    .search-form {
                        background: var(--background-color);
                        border-radius: var(--border-radius);
                        padding: 1.5rem;
                        margin-bottom: 2rem;
                        border: 1px solid var(--border-color);
                    }

                    .form-grid {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 1.5rem;
                        margin-bottom: 1.5rem;
                    }

                    .form-group {
                        display: flex;
                        flex-direction: column;
                    }

                    .form-label {
                        font-weight: 600;
                        color: var(--text-primary);
                        margin-bottom: 0.5rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .required {
                        color: var(--error-color);
                    }

                    .form-input {
                        padding: 0.875rem 1rem;
                        border: 2px solid var(--border-color);
                        border-radius: 8px;
                        font-size: 1rem;
                        transition: var(--transition);
                        background: var(--surface-color);
                    }

                    .form-input:focus {
                        outline: none;
                        border-color: var(--primary-color);
                        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
                    }

                    /* Plan Search Container */
                    .plan-search-container {
                        position: relative;
                        width: 100%;
                    }

                    .plan-search-input {
                        width: 100%;
                        padding-right: 2.5rem;
                    }

                    .plan-search-results {
                        position: absolute;
                        top: 100%;
                        left: 0;
                        right: 0;
                        background: white;
                        border: 2px solid var(--border-color);
                        border-top: none;
                        border-radius: 0 0 8px 8px;
                        max-height: 250px;
                        overflow-y: auto;
                        z-index: 1000;
                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                    }

                    .plan-search-item {
                        padding: 0.75rem 1rem;
                        border-bottom: 1px solid var(--border-color);
                        cursor: pointer;
                        transition: background-color 0.2s;
                        display: flex;
                        flex-direction: column;
                        gap: 0.25rem;
                    }

                    .plan-search-item:hover {
                        background-color: #f8fafc;
                    }

                    .plan-search-item:last-child {
                        border-bottom: none;
                    }

                    .plan-search-item.selected {
                        background-color: var(--primary-color);
                        color: white;
                    }

                    .plan-codigo {
                        font-size: 0.875rem;
                        font-weight: 600;
                        color: var(--primary-color);
                    }

                    .plan-descripcion {
                        font-size: 0.8rem;
                        color: var(--text-secondary);
                    }

                    .plan-search-item.selected .plan-codigo,
                    .plan-search-item.selected .plan-descripcion {
                        color: white;
                    }

                    .loading-message,
                    .no-results-message {
                        padding: 1rem;
                        text-align: center;
                        color: var(--text-secondary);
                        font-style: italic;
                    }

                    .date-range {
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                    }

                    .date-range .form-input {
                        flex: 1;
                    }

                    .date-separator {
                        font-weight: 500;
                        color: var(--text-secondary);
                    }

                    .form-actions {
                        display: flex;
                        justify-content: flex-start;
                        align-items: center;
                        gap: 1rem;
                        margin-top: 1.5rem;
                    }

                    .export-actions {
                        margin-left: auto;
                        display: flex;
                        gap: 1rem;
                    }

                    .pagination-container {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        padding: 1rem;
                        border-top: 1px solid var(--border-color);
                        margin-top: 1rem;
                    }

                    .pagination-info {
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .pagination-info select {
                        padding: 0.25rem;
                        border: 1px solid var(--border-color);
                        border-radius: 4px;
                        background: white;
                    }

                    .pagination-controls {
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .pagination-controls button {
                        padding: 0.5rem;
                        border: 1px solid var(--border-color);
                        background: white;
                        border-radius: 4px;
                        cursor: pointer;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        min-width: 2rem;
                    }

                    .pagination-controls button:disabled {
                        opacity: 0.5;
                        cursor: not-allowed;
                    }

                    .pagination-controls button:not(:disabled):hover {
                        background: var(--primary-color);
                        color: white;
                        border-color: var(--primary-color);
                    }

                    .pagination-controls span {
                        padding: 0.5rem 1rem;
                        background: var(--surface-color);
                        border: 1px solid var(--border-color);
                        border-radius: 4px;
                    }

                    .btn {
                        padding: 0.875rem 2rem;
                        border: none;
                        border-radius: 8px;
                        font-size: 1rem;
                        font-weight: 600;
                        cursor: pointer;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        text-decoration: none;
                    }

                    .btn-primary {
                        background: var(--primary-color);
                        color: white;
                    }

                    .btn-primary:hover {
                        background: var(--primary-dark);
                        transform: translateY(-1px);
                        box-shadow: var(--shadow-md);
                    }

                    .btn-primary:disabled {
                        background: #94a3b8;
                        color: #64748b;
                        cursor: not-allowed;
                        transform: none;
                        box-shadow: none;
                        opacity: 0.7;
                    }

                    .btn-primary:disabled:hover {
                        background: #94a3b8;
                        transform: none;
                        box-shadow: none;
                    }

                    .btn-secondary {
                        background: var(--surface-color);
                        color: var(--text-primary);
                        border: 2px solid var(--border-color);
                    }

                    .btn-secondary:hover {
                        background: var(--background-color);
                        border-color: var(--primary-color);
                    }

                    /* Results */
                    .results-container {
                        margin-top: 2rem;
                    }

                    .results-header {
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        margin-bottom: 1rem;
                    }

                    .results-count {
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        color: var(--success-color);
                        font-weight: 600;
                    }

                    .alert {
                        padding: 1rem 1.25rem;
                        border-radius: 8px;
                        margin-bottom: 1rem;
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                    }

                    .alert-success {
                        background: #ecfdf5;
                        color: #065f46;
                        border: 1px solid #a7f3d0;
                    }

                    .alert-warning {
                        background: #fffbeb;
                        color: #92400e;
                        border: 1px solid #fde68a;
                    }

                    .alert-info {
                        background: #eff6ff;
                        color: #1e40af;
                        border: 1px solid #bfdbfe;
                    }

                    /* Table */
                    .table-container {
                        overflow-x: auto;
                        border-radius: var(--border-radius);
                        border: 1px solid var(--border-color);
                        background: var(--surface-color);
                    }

                    .data-table {
                        width: 100%;
                        border-collapse: collapse;
                        font-size: 0.85rem;
                        min-width: 1400px;
                        /* Tabla más ancha para acomodar las nuevas columnas */
                    }

                    .data-table th {
                        background: var(--background-color);
                        padding: 1rem 0.75rem;
                        text-align: left;
                        font-weight: 600;
                        color: var(--text-primary);
                        border-bottom: 2px solid var(--border-color);
                        white-space: nowrap;
                    }

                    .data-table td {
                        padding: 0.75rem 0.5rem;
                        border-bottom: 1px solid var(--border-color);
                        vertical-align: middle;
                    }

                    .data-table td.text-center {
                        text-align: center;
                    }

                    .data-table td.text-right {
                        text-align: right;
                    }

                    .data-table .codigo-col {
                        font-weight: bold;
                        color: var(--primary-color);
                    }

                    .data-table .porcentaje-col {
                        font-weight: bold;
                        color: var(--success-color);
                    }

                    .data-table tbody tr:hover {
                        background: var(--background-color);
                    }

                    .status-badge {
                        padding: 0.25rem 0.75rem;
                        border-radius: 20px;
                        font-size: 0.85rem;
                        font-weight: 500;
                    }

                    .status-active {
                        background: #ecfdf5;
                        color: #065f46;
                    }

                    .status-inactive {
                        background: #fef2f2;
                        color: #991b1b;
                    }

                    /* Responsive */
                    @media (max-width: 1024px) {
                        .nav-menu {
                            gap: 0.25rem;
                        }

                        .nav-link {
                            padding: 0.5rem 0.75rem;
                            font-size: 0.85rem;
                        }
                    }

                    @media (max-width: 768px) {
                        .header-container {
                            flex-direction: column;
                            gap: 1rem;
                        }

                        .mobile-menu-toggle {
                            display: block;
                            position: absolute;
                            right: 1.5rem;
                            top: 50%;
                            transform: translateY(-50%);
                        }

                        .nav-menu {
                            display: none;
                            width: 100%;
                            flex-direction: column;
                            gap: 0.5rem;
                        }

                        .nav-menu.active {
                            display: flex;
                        }

                        .nav-link {
                            justify-content: center;
                            padding: 0.75rem;
                        }

                        .form-grid {
                            grid-template-columns: 1fr;
                        }

                        .form-actions {
                            flex-direction: column;
                        }

                        .main-content {
                            padding: 0 1rem;
                        }

                        .content-container {
                            padding: 1rem;
                        }

                        .feature-grid {
                            grid-template-columns: 1fr;
                        }
                    }

                    /* Loading State */
                    .loading {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        padding: 2rem;
                        color: var(--text-secondary);
                    }

                    .spinner {
                        border: 2px solid var(--border-color);
                        border-top: 2px solid var(--primary-color);
                        border-radius: 50%;
                        width: 20px;
                        height: 20px;
                        animation: spin 1s linear infinite;
                        margin-right: 0.5rem;
                    }

                    @keyframes spin {
                        0% {
                            transform: rotate(0deg);
                        }

                        100% {
                            transform: rotate(360deg);
                        }
                    }

                    /* Association Form Styles */
                    .association-form {
                        background: var(--background-color);
                        border-radius: var(--border-radius);
                        padding: 2rem;
                        border: 1px solid var(--border-color);
                    }

                    .input-with-button {
                        display: flex;
                        gap: 0.5rem;
                    }

                    .input-with-button .form-input {
                        flex: 1;
                    }

                    .search-btn {
                        background: var(--primary-color);
                        color: white;
                        border: none;
                        border-radius: 8px;
                        padding: 0.875rem 1rem;
                        cursor: pointer;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        min-width: 50px;
                    }

                    .search-btn:hover {
                        background: var(--primary-dark);
                        transform: translateY(-1px);
                    }

                    .service-info {
                        margin: 1.5rem 0;
                    }

                    .info-card {
                        background: var(--surface-color);
                        border: 1px solid var(--border-color);
                        border-radius: var(--border-radius);
                        padding: 1.5rem;
                    }

                    .info-card h4 {
                        color: var(--primary-color);
                        margin-bottom: 1rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        font-size: 1.1rem;
                    }

                    .info-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 1rem;
                    }

                    .info-item {
                        display: flex;
                        flex-direction: column;
                        gap: 0.25rem;
                    }

                    .info-item label {
                        font-weight: 600;
                        color: var(--text-secondary);
                        font-size: 0.9rem;
                    }

                    .info-item span {
                        color: var(--text-primary);
                        font-weight: 500;
                    }

                    .promotions-section {
                        margin: 2rem 0;
                    }

                    .promotions-container {
                        background: var(--surface-color);
                        border: 2px solid var(--border-color);
                        border-radius: var(--border-radius);
                        min-height: 300px;
                        max-height: 400px;
                        overflow-y: auto;
                    }

                    .loading-message {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        padding: 3rem;
                        color: var(--text-secondary);
                    }

                    .promotions-list {
                        padding: 1rem;
                    }

                    .no-promotions {
                        text-align: center;
                        padding: 3rem;
                        color: var(--text-secondary);
                    }

                    .no-promotions i {
                        font-size: 3rem;
                        margin-bottom: 1rem;
                        color: var(--border-color);
                    }

                    .promotion-item {
                        background: var(--background-color);
                        border: 2px solid var(--border-color);
                        border-radius: 8px;
                        padding: 1rem;
                        margin-bottom: 0.75rem;
                        cursor: pointer;
                        transition: var(--transition);
                    }

                    .promotion-item:hover {
                        border-color: var(--primary-color);
                        background: rgba(37, 99, 235, 0.05);
                    }

                    .promotion-item.selected {
                        border-color: var(--primary-color);
                        background: rgba(37, 99, 235, 0.1);
                    }

                    .promotion-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 0.5rem;
                    }

                    .promotion-title {
                        font-weight: 600;
                        color: var(--text-primary);
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .promotion-value {
                        background: var(--success-color);
                        color: white;
                        padding: 0.25rem 0.75rem;
                        border-radius: 20px;
                        font-size: 0.85rem;
                        font-weight: 600;
                    }

                    .promotion-details {
                        color: var(--text-secondary);
                        font-size: 0.9rem;
                        display: flex;
                        gap: 1rem;
                        flex-wrap: wrap;
                    }

                    .promotion-detail {
                        display: flex;
                        align-items: center;
                        gap: 0.25rem;
                    }

                    /* Mobile Responsive for Association Form */
                    @media (max-width: 768px) {
                        .input-with-button {
                            flex-direction: column;
                        }

                        .search-btn {
                            width: 100%;
                        }

                        .info-grid {
                            grid-template-columns: 1fr;
                        }

                        .promotions-container {
                            min-height: 250px;
                        }

                        .promotion-details {
                            flex-direction: column;
                            gap: 0.5rem;
                        }
                    }

                    /* Promotion Management Form Styles */
                    .promotion-management-form {
                        background: var(--background-color);
                        border-radius: var(--border-radius);
                        padding: 2rem;
                        border: 1px solid var(--border-color);
                    }

                    .promotion-main-data {
                        margin-bottom: 2rem;
                    }

                    .form-grid-3 {
                        display: grid;
                        grid-template-columns: repeat(3, 1fr);
                        gap: 1.5rem;
                        align-items: start;
                    }

                    .form-group.full-width {
                        grid-column: span 3;
                    }

                    .promotion-details-section {
                        margin: 2rem 0;
                        background: var(--surface-color);
                        border-radius: var(--border-radius);
                        padding: 1.5rem;
                        border: 1px solid var(--border-color);
                    }

                    .details-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 1.5rem;
                        padding-bottom: 1rem;
                        border-bottom: 2px solid var(--border-color);
                    }

                    .details-header h3 {
                        color: var(--primary-color);
                        font-size: 1.25rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        margin: 0;
                    }

                    .btn-sm {
                        padding: 0.5rem 1rem;
                        font-size: 0.875rem;
                    }

                    .details-table-container {
                        overflow-x: auto;
                        border-radius: var(--border-radius);
                        border: 1px solid var(--border-color);
                        background: var(--surface-color);
                        max-height: 400px;
                        overflow-y: auto;
                    }

                    .details-table {
                        width: 100%;
                        border-collapse: collapse;
                        font-size: 0.85rem;
                        min-width: 1200px;
                    }

                    .details-table th {
                        background: var(--primary-color);
                        color: white;
                        padding: 0.75rem 0.5rem;
                        text-align: left;
                        font-weight: 600;
                        font-size: 0.8rem;
                        white-space: nowrap;
                        position: sticky;
                        top: 0;
                        z-index: 10;
                    }

                    .details-table td {
                        padding: 0.5rem;
                        border-bottom: 1px solid var(--border-color);
                        vertical-align: middle;
                        background: var(--surface-color);
                    }

                    .details-table tbody tr:hover {
                        background: var(--background-color);
                    }

                    .details-input {
                        width: 100%;
                        padding: 0.375rem 0.5rem;
                        border: 1px solid var(--border-color);
                        border-radius: 4px;
                        font-size: 0.8rem;
                        background: var(--surface-color);
                    }

                    .details-input:focus {
                        outline: none;
                        border-color: var(--primary-color);
                        box-shadow: 0 0 0 2px rgba(37, 99, 235, 0.1);
                    }

                    .details-checkbox {
                        width: 18px;
                        height: 18px;
                        accent-color: var(--primary-color);
                    }

                    .details-select {
                        width: 100%;
                        padding: 0.375rem 0.5rem;
                        border: 1px solid var(--border-color);
                        border-radius: 4px;
                        font-size: 0.8rem;
                        background: var(--surface-color);
                    }

                    .action-buttons {
                        display: flex;
                        gap: 0.25rem;
                    }

                    .btn-action {
                        padding: 0.25rem 0.5rem;
                        border: none;
                        border-radius: 4px;
                        font-size: 0.75rem;
                        cursor: pointer;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        min-width: 28px;
                        height: 28px;
                    }

                    .btn-primary {
                        background: var(--primary-color);
                        color: white;
                    }

                    .btn-primary:hover {
                        background: var(--primary-dark);
                    }

                    .btn-edit {
                        background: var(--warning-color);
                        color: white;
                    }

                    .btn-edit:hover {
                        background: #d97706;
                    }

                    .btn-delete {
                        background: var(--error-color);
                        color: white;
                    }

                    .btn-delete:hover {
                        background: #dc2626;
                    }

                    .promotion-actions {
                        justify-content: center;
                        gap: 1.5rem;
                        margin-top: 2rem;
                    }

                    .btn-warning {
                        background: var(--warning-color);
                        color: white;
                    }

                    .btn-warning:hover {
                        background: #d97706;
                        transform: translateY(-1px);
                        box-shadow: var(--shadow-md);
                    }

                    /* Mobile Responsive for Promotion Management */
                    @media (max-width: 1024px) {
                        .form-grid-3 {
                            grid-template-columns: repeat(2, 1fr);
                        }

                        .form-group.full-width {
                            grid-column: span 2;
                        }

                        .details-table {
                            min-width: 1000px;
                        }
                    }

                    @media (max-width: 768px) {
                        .form-grid-3 {
                            grid-template-columns: 1fr;
                        }

                        .form-group.full-width {
                            grid-column: span 1;
                        }

                        .details-header {
                            flex-direction: column;
                            gap: 1rem;
                            align-items: stretch;
                        }

                        .promotion-actions {
                            flex-direction: column;
                        }

                        .details-table {
                            min-width: 1200px;
                            /* Incrementar debido a las nuevas columnas */
                        }

                        .table-container {
                            font-size: 0.8rem;
                            /* Texto más pequeño en móviles */
                        }

                        .promotion-management-form {
                            padding: 1rem;
                        }
                    }

                    /* Reports Form Styles */
                    .reports-form {
                        background: var(--background-color);
                        border-radius: var(--border-radius);
                        padding: 2rem;
                        border: 1px solid var(--border-color);
                        margin-bottom: 2rem;
                    }

                    .reports-filters {
                        margin-bottom: 2rem;
                    }

                    .form-grid-reports {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 1.5rem;
                        align-items: start;
                    }

                    .form-group.full-width-reports {
                        grid-column: span 2;
                    }

                    .date-input-wrapper {
                        position: relative;
                        display: flex;
                        align-items: center;
                    }

                    .date-input-wrapper .form-input {
                        flex: 1;
                        padding-right: 2.5rem;
                    }

                    .date-icon {
                        position: absolute;
                        right: 0.75rem;
                        color: var(--text-secondary);
                        pointer-events: none;
                        font-size: 0.9rem;
                    }

                    .reports-actions {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        flex-wrap: wrap;
                        gap: 1rem;
                        padding-top: 1.5rem;
                        border-top: 2px solid var(--border-color);
                    }

                    .primary-actions,
                    .export-actions {
                        display: flex;
                        gap: 1rem;
                    }

                    .btn-success {
                        background: var(--success-color);
                        color: white;
                    }

                    .btn-success:hover {
                        background: #059669;
                        transform: translateY(-1px);
                        box-shadow: var(--shadow-md);
                    }

                    /* Reports Results */
                    .reports-results {
                        background: var(--surface-color);
                        border-radius: var(--border-radius);
                        border: 1px solid var(--border-color);
                        overflow: hidden;
                    }

                    .results-section {
                        padding: 1.5rem;
                    }

                    .section-title {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 1.5rem;
                        padding-bottom: 1rem;
                        border-bottom: 2px solid var(--border-color);
                    }

                    .section-title h3 {
                        color: var(--primary-color);
                        font-size: 1.25rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        margin: 0;
                    }

                    .pagination-info {
                        display: flex;
                        align-items: center;
                        gap: 1rem;
                        font-size: 0.9rem;
                    }

                    .pagination-controls {
                        display: flex;
                        align-items: center;
                        gap: 0.25rem;
                    }

                    .pagination-btn {
                        background: var(--surface-color);
                        border: 1px solid var(--border-color);
                        color: var(--text-primary);
                        padding: 0.375rem 0.5rem;
                        border-radius: 4px;
                        cursor: pointer;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        min-width: 32px;
                        height: 32px;
                    }

                    .pagination-btn:hover {
                        background: var(--primary-color);
                        color: white;
                        border-color: var(--primary-color);
                    }

                    .pagination-btn:disabled {
                        opacity: 0.5;
                        cursor: not-allowed;
                        background: var(--background-color);
                    }

                    .current-page {
                        padding: 0.375rem 0.75rem;
                        background: var(--primary-color);
                        color: white;
                        border-radius: 4px;
                        font-weight: 600;
                        min-width: 32px;
                        text-align: center;
                        font-size: 0.875rem;
                    }

                    .reports-table-container {
                        overflow-x: auto;
                        border-radius: var(--border-radius);
                        border: 1px solid var(--border-color);
                        background: var(--surface-color);
                        max-height: 500px;
                        overflow-y: auto;
                    }

                    .reports-table {
                        width: 100%;
                        border-collapse: collapse;
                        font-size: 0.9rem;
                        min-width: 800px;
                    }

                    .reports-table th {
                        background: var(--primary-color);
                        color: white;
                        padding: 1rem 0.75rem;
                        text-align: left;
                        font-weight: 600;
                        font-size: 0.875rem;
                        white-space: nowrap;
                        position: sticky;
                        top: 0;
                        z-index: 10;
                    }

                    .reports-table td {
                        padding: 0.875rem 0.75rem;
                        border-bottom: 1px solid var(--border-color);
                        vertical-align: middle;
                        background: var(--surface-color);
                    }

                    .reports-table tbody tr:hover {
                        background: var(--background-color);
                    }

                    .no-data {
                        text-align: center;
                        padding: 3rem 1rem;
                    }

                    .no-data-message {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 1rem;
                        color: var(--text-secondary);
                    }

                    .no-data-message i {
                        font-size: 3rem;
                        color: var(--border-color);
                    }

                    .no-data-message p {
                        margin: 0;
                        font-size: 1.1rem;
                    }

                    /* Mobile Responsive for Reports */
                    @media (max-width: 768px) {
                        .form-grid-reports {
                            grid-template-columns: 1fr;
                        }

                        .form-group.full-width-reports {
                            grid-column: span 1;
                        }

                        .reports-actions {
                            flex-direction: column;
                            align-items: stretch;
                        }

                        .primary-actions,
                        .export-actions {
                            justify-content: center;
                        }

                        .section-title {
                            flex-direction: column;
                            gap: 1rem;
                            align-items: stretch;
                        }

                        .pagination-info {
                            justify-content: space-between;
                        }

                        .reports-table {
                            min-width: 600px;
                        }

                        .reports-form {
                            padding: 1rem;
                        }
                    }

                    /* Product Management Styles */
                    .products-list-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 2rem;
                        padding: 1.5rem;
                        background: var(--background-color);
                        border-radius: var(--border-radius);
                        border: 1px solid var(--border-color);
                    }

                    .products-actions {
                        display: flex;
                        gap: 1rem;
                    }

                    .products-info {
                        color: var(--text-secondary);
                        font-weight: 600;
                        font-size: 0.9rem;
                    }

                    .products-list-container {
                        background: var(--surface-color);
                        border-radius: var(--border-radius);
                        border: 1px solid var(--border-color);
                        min-height: 400px;
                    }

                    .loading-state {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        justify-content: center;
                        padding: 3rem;
                        color: var(--text-secondary);
                    }

                    .loading-state .spinner {
                        margin-bottom: 1rem;
                    }

                    .products-list-area {
                        padding: 1.5rem;
                    }

                    .no-products-message {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        justify-content: center;
                        text-align: center;
                        padding: 3rem;
                        color: var(--text-secondary);
                    }

                    .no-products-message i {
                        font-size: 3rem;
                        margin-bottom: 1rem;
                        color: var(--border-color);
                    }

                    .products-list {
                        display: grid;
                        gap: 1rem;
                    }

                    .product-item {
                        background: var(--background-color);
                        border: 2px solid var(--border-color);
                        border-radius: 8px;
                        padding: 1.5rem;
                        transition: var(--transition);
                        cursor: pointer;
                    }

                    .product-item:hover {
                        border-color: var(--primary-color);
                        background: rgba(37, 99, 235, 0.05);
                        transform: translateY(-2px);
                        box-shadow: var(--shadow-md);
                    }

                    .product-item-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 1rem;
                    }

                    .product-item-title {
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                    }

                    .product-item-icon {
                        background: var(--primary-color);
                        color: white;
                        width: 40px;
                        height: 40px;
                        border-radius: 8px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 1.2rem;
                    }

                    .product-item-info h4 {
                        margin: 0;
                        color: var(--text-primary);
                        font-size: 1.1rem;
                        font-weight: 600;
                    }

                    .product-item-info .product-code {
                        color: var(--text-secondary);
                        font-size: 0.9rem;
                        margin-top: 0.25rem;
                    }

                    .product-item-actions {
                        display: flex;
                        gap: 0.5rem;
                    }

                    .btn-details {
                        background: var(--primary-color);
                        color: white;
                        border: none;
                        padding: 0.5rem 1rem;
                        border-radius: 6px;
                        font-size: 0.85rem;
                        cursor: pointer;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .btn-details:hover {
                        background: var(--primary-dark);
                        transform: translateY(-1px);
                    }

                    /* Product Modal Styles */
                    .product-modal {
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        z-index: 10000;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                    }

                    .modal-overlay {
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background: rgba(0, 0, 0, 0.5);
                        backdrop-filter: blur(4px);
                    }

                    .modal-content {
                        position: relative;
                        background: var(--surface-color);
                        border-radius: var(--border-radius);
                        box-shadow: var(--shadow-lg);
                        width: 90%;
                        max-width: 800px;
                        max-height: 90vh;
                        overflow-y: auto;
                        border: 1px solid var(--border-color);
                    }

                    .modal-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        padding: 1.5rem;
                        border-bottom: 2px solid var(--border-color);
                        background: var(--background-color);
                    }

                    .modal-header h3 {
                        margin: 0;
                        color: var(--primary-color);
                        font-size: 1.25rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .modal-close-btn {
                        background: none;
                        border: none;
                        color: var(--text-secondary);
                        font-size: 1.5rem;
                        cursor: pointer;
                        padding: 0.5rem;
                        border-radius: 4px;
                        transition: var(--transition);
                    }

                    .modal-close-btn:hover {
                        background: var(--border-color);
                        color: var(--text-primary);
                    }

                    .modal-body {
                        padding: 2rem;
                    }

                    .modal-associations {
                        margin-top: 2rem;
                        padding-top: 2rem;
                        border-top: 2px solid var(--border-color);
                    }

                    .modal-associations h4 {
                        color: var(--primary-color);
                        margin-bottom: 1rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .association-buttons {
                        display: flex;
                        gap: 1rem;
                        margin-bottom: 1.5rem;
                    }

                    .btn-association {
                        flex: 1;
                        padding: 1rem;
                        font-size: 1rem;
                        font-weight: 600;
                    }

                    .association-results {
                        background: var(--background-color);
                        border-radius: var(--border-radius);
                        padding: 1.5rem;
                        border: 1px solid var(--border-color);
                        min-height: 200px;
                    }

                    .no-association {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 1rem;
                        color: var(--text-secondary);
                        text-align: center;
                        padding: 2rem;
                    }

                    .no-association i {
                        font-size: 2.5rem;
                        color: var(--border-color);
                    }

                    .no-association p {
                        margin: 0;
                        font-size: 1rem;
                        max-width: 300px;
                    }

                    .modal-footer {
                        display: flex;
                        justify-content: flex-end;
                        gap: 1rem;
                        padding: 1.5rem;
                        border-top: 2px solid var(--border-color);
                        background: var(--background-color);
                        position: sticky;
                        bottom: 0;
                        z-index: 10;
                    }

                    /* Associations Results Table */
                    .associations-table-container {
                        overflow-x: auto;
                        border-radius: var(--border-radius);
                        border: 1px solid var(--border-color);
                        background: var(--surface-color);
                        max-height: 300px;
                        overflow-y: auto;
                    }

                    .associations-table {
                        width: 100%;
                        border-collapse: collapse;
                        font-size: 0.85rem;
                    }

                    .associations-table th {
                        background: var(--primary-color);
                        color: white;
                        padding: 0.75rem 0.5rem;
                        text-align: left;
                        font-weight: 600;
                        font-size: 0.8rem;
                        white-space: nowrap;
                        position: sticky;
                        top: 0;
                        z-index: 10;
                    }

                    .associations-table td {
                        padding: 0.5rem;
                        border-bottom: 1px solid var(--border-color);
                        vertical-align: middle;
                        background: var(--surface-color);
                    }

                    .associations-table tbody tr:hover {
                        background: var(--background-color);
                    }

                    /* Mobile Responsive for Product Management */
                    @media (max-width: 1024px) {
                        .product-management-container {
                            grid-template-columns: 1fr;
                        }

                        .product-actions {
                            grid-column: span 1;
                        }
                    }

                    @media (max-width: 768px) {
                        .products-navigation {
                            justify-content: center;
                            flex-wrap: wrap;
                            gap: 0.5rem;
                        }

                        .nav-info {
                            width: 100%;
                            justify-content: center;
                            margin: 0.5rem 0;
                        }

                        .association-buttons {
                            flex-direction: column;
                        }

                        .product-actions {
                            flex-direction: column;
                            align-items: stretch;
                        }

                        .products-section,
                        .association-section {
                            padding: 1rem;
                        }
                    }

                    /* Assigned Promotions Styles */
                    .assigned-promotions-container {
                        background: var(--background-color);
                        border-radius: var(--border-radius);
                        padding: 2rem;
                        border: 1px solid var(--border-color);
                    }

                    .assigned-form {
                        display: flex;
                        flex-direction: column;
                        gap: 2rem;
                    }

                    .service-client-section {
                        display: flex;
                        flex-direction: column;
                        gap: 1.5rem;
                    }

                    .client-type-section {
                        display: flex;
                        flex-direction: column;
                    }

                    .input-with-clear {
                        display: flex;
                        gap: 0.5rem;
                        align-items: flex-end;
                    }

                    .input-with-clear .form-input {
                        flex: 1;
                    }

                    .clear-btn {
                        background: var(--secondary-color);
                        color: white;
                        border: none;
                        border-radius: 8px;
                        padding: 0.875rem 1rem;
                        cursor: pointer;
                        transition: var(--transition);
                        font-weight: 500;
                        white-space: nowrap;
                        height: fit-content;
                    }

                    .clear-btn:hover {
                        background: #475569;
                        transform: translateY(-1px);
                    }

                    .promotions-display-section {
                        background: var(--surface-color);
                        border-radius: var(--border-radius);
                        border: 1px solid var(--border-color);
                        overflow: hidden;
                    }

                    .promotions-header {
                        background: var(--primary-color);
                        color: white;
                        padding: 1rem 1.5rem;
                    }

                    .promotions-header h3 {
                        margin: 0;
                        font-size: 1.125rem;
                        font-weight: 600;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .promotions-display-area {
                        min-height: 350px;
                        max-height: 500px;
                        overflow-y: auto;
                        padding: 1.5rem;
                        background: var(--surface-color);
                    }

                    .no-promotions-assigned {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        justify-content: center;
                        text-align: center;
                        height: 300px;
                        color: var(--text-secondary);
                    }

                    .no-promotions-assigned i {
                        font-size: 3rem;
                        margin-bottom: 1rem;
                        color: var(--border-color);
                    }

                    .no-promotions-assigned p {
                        margin: 0;
                        font-size: 1rem;
                        max-width: 400px;
                        line-height: 1.5;
                    }

                    .assigned-promotion-item {
                        background: var(--background-color);
                        border: 1px solid var(--border-color);
                        border-radius: 8px;
                        padding: 1.25rem;
                        margin-bottom: 1rem;
                        transition: var(--transition);
                    }

                    .assigned-promotion-item:hover {
                        border-color: var(--primary-color);
                        box-shadow: var(--shadow-md);
                    }

                    .assigned-promotion-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 1rem;
                    }

                    .assigned-promotion-title {
                        font-weight: 600;
                        color: var(--text-primary);
                        font-size: 1.1rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .assigned-promotion-status {
                        display: flex;
                        gap: 0.5rem;
                        align-items: center;
                    }

                    .status-badge-small {
                        padding: 0.25rem 0.75rem;
                        border-radius: 12px;
                        font-size: 0.75rem;
                        font-weight: 500;
                        text-transform: uppercase;
                    }

                    .status-vigente {
                        background: #ecfdf5;
                        color: #065f46;
                        border: 1px solid #a7f3d0;
                    }

                    .status-vencida {
                        background: #fef2f2;
                        color: #991b1b;
                        border: 1px solid #fecaca;
                    }

                    .status-proxima {
                        background: #fffbeb;
                        color: #92400e;
                        border: 1px solid #fde68a;
                    }

                    .assigned-promotion-details {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
                        gap: 1rem;
                    }

                    .assigned-detail-item {
                        display: flex;
                        flex-direction: column;
                        gap: 0.25rem;
                    }

                    .assigned-detail-label {
                        font-size: 0.8rem;
                        color: var(--text-secondary);
                        font-weight: 500;
                        text-transform: uppercase;
                        letter-spacing: 0.025em;
                    }

                    .assigned-detail-value {
                        color: var(--text-primary);
                        font-weight: 600;
                        font-size: 0.95rem;
                    }

                    .assigned-detail-value.highlight {
                        color: var(--primary-color);
                        font-size: 1.1rem;
                    }

                    .highlight-placa {
                        color: var(--primary-color);
                        background-color: rgba(52, 152, 219, 0.1);
                        padding: 0.25rem 0.5rem;
                        border-radius: 4px;
                        border: 1px solid rgba(52, 152, 219, 0.3);
                    }

                    /* Estilos para las tarjetas de promociones */
                    .promotion-card {
                        background: var(--surface-color);
                        border: 1px solid var(--border-color);
                        border-radius: var(--border-radius);
                        padding: 1.5rem;
                        margin-bottom: 1rem;
                        transition: var(--transition);
                        box-shadow: var(--shadow-sm);
                    }

                    .promotion-card:hover {
                        transform: translateY(-2px);
                        box-shadow: var(--shadow-md);
                        border-color: var(--primary-color);
                    }

                    .promotion-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 1rem;
                        padding-bottom: 1rem;
                        border-bottom: 1px solid var(--border-color);
                    }

                    .promotion-code {
                        background: var(--primary-color);
                        color: white;
                        padding: 0.25rem 0.75rem;
                        border-radius: 20px;
                        font-weight: bold;
                        font-size: 0.9rem;
                    }

                    .promotion-title {
                        font-size: 1.1rem;
                        font-weight: 600;
                        color: var(--text-primary);
                        flex: 1;
                        margin-left: 1rem;
                    }

                    .promotion-details-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 0.75rem;
                        margin-bottom: 1.5rem;
                    }

                    .promotion-detail {
                        display: flex;
                        flex-direction: column;
                        gap: 0.25rem;
                    }

                    .promotion-detail label {
                        font-size: 0.8rem;
                        color: var(--text-secondary);
                        font-weight: 500;
                        text-transform: uppercase;
                        letter-spacing: 0.05em;
                    }

                    .promotion-detail span {
                        font-size: 0.9rem;
                        color: var(--text-primary);
                        font-weight: 500;
                    }

                    .discount-percentage {
                        background: linear-gradient(45deg, #27ae60, #2ecc71);
                        color: white !important;
                        padding: 0.25rem 0.5rem;
                        border-radius: 4px;
                        font-weight: bold;
                        display: inline-block;
                    }

                    .promotion-actions {
                        display: flex;
                        justify-content: center;
                        padding-top: 1rem;
                        border-top: 1px solid var(--border-color);
                    }

                    .btn-associate {
                        background: linear-gradient(45deg, var(--primary-color), #2980b9);
                        color: white;
                        border: none;
                        padding: 0.75rem 1.5rem;
                        border-radius: var(--border-radius);
                        font-weight: 600;
                        cursor: pointer;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .btn-associate:hover {
                        background: linear-gradient(45deg, #2980b9, #1e6091);
                        transform: translateY(-1px);
                        box-shadow: var(--shadow-md);
                    }

                    .no-promotions {
                        text-align: center;
                        padding: 3rem;
                        color: var(--text-secondary);
                    }

                    .no-promotions i {
                        font-size: 3rem;
                        margin-bottom: 1rem;
                        color: var(--warning-color);
                    }

                    .no-promotions p {
                        font-size: 1.1rem;
                        margin: 0;
                    }

                    .assigned-actions {
                        display: flex;
                        justify-content: center;
                        gap: 1.5rem;
                        padding-top: 2rem;
                        border-top: 2px solid var(--border-color);
                    }

                    .loading-assigned {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        justify-content: center;
                        height: 300px;
                        color: var(--text-secondary);
                    }

                    .loading-assigned .spinner {
                        margin-bottom: 1rem;
                    }

                    /* Service Info Card for Assigned Promotions */
                    .service-info-assigned {
                        background: var(--primary-color);
                        color: white;
                        border-radius: 8px;
                        padding: 1rem;
                        margin-bottom: 1.5rem;
                    }

                    .service-info-assigned h4 {
                        margin: 0 0 0.75rem 0;
                        font-size: 1rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .service-info-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
                        gap: 0.75rem;
                    }

                    .service-info-item {
                        display: flex;
                        flex-direction: column;
                        gap: 0.125rem;
                    }

                    .service-info-label {
                        font-size: 0.75rem;
                        opacity: 0.9;
                        text-transform: uppercase;
                        letter-spacing: 0.025em;
                    }

                    .service-info-value {
                        font-weight: 600;
                        font-size: 0.9rem;
                    }

                    /* Mobile Responsive for Assigned Promotions */
                    @media (max-width: 768px) {
                        .service-client-section {
                            gap: 1rem;
                        }

                        .assigned-promotion-details {
                            grid-template-columns: 1fr;
                        }

                        .assigned-actions {
                            flex-direction: column;
                            align-items: stretch;
                        }

                        .assigned-promotions-container {
                            padding: 1rem;
                        }

                        .promotions-display-area {
                            padding: 1rem;
                        }

                        .service-info-grid {
                            grid-template-columns: 1fr;
                        }
                    }

                    /* Product Detail Modal Styles */
                    .product-detail-container {
                        display: flex;
                        flex-direction: column;
                        gap: 1.5rem;
                    }

                    .product-info-section {
                        background: var(--primary-color);
                        color: white;
                        padding: 1rem 1.5rem;
                        border-radius: var(--border-radius);
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .product-name-display {
                        flex: 1;
                    }

                    .product-name-display h4 {
                        margin: 0 0 0.25rem 0;
                        font-size: 1.125rem;
                        font-weight: 600;
                    }

                    .product-code {
                        font-size: 0.85rem;
                        opacity: 0.9;
                    }

                    .product-info-extra {
                        display: flex;
                        flex-direction: column;
                        align-items: flex-end;
                        gap: 0.25rem;
                        font-size: 0.85rem;
                        opacity: 0.9;
                    }

                    .product-status {
                        background: rgba(255, 255, 255, 0.2);
                        padding: 0.25rem 0.75rem;
                        border-radius: 12px;
                        font-weight: 500;
                    }

                    .product-type {
                        font-weight: 500;
                    }

                    .association-section {
                        background: var(--background-color);
                        padding: 1.5rem;
                        border-radius: var(--border-radius);
                        border: 1px solid var(--border-color);
                    }

                    .association-section h4 {
                        color: var(--primary-color);
                        margin-bottom: 1.5rem;
                        font-size: 1.25rem;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                    }

                    .association-buttons {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 1rem;
                        margin-bottom: 1.5rem;
                    }

                    .btn-association {
                        padding: 1rem;
                        font-size: 1rem;
                        font-weight: 600;
                        border-radius: var(--border-radius);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 0.5rem;
                        transition: var(--transition);
                    }

                    .btn-association:hover {
                        transform: translateY(-2px);
                        box-shadow: var(--shadow-lg);
                    }

                    .association-results {
                        background: var(--surface-color);
                        border: 2px solid var(--border-color);
                        border-radius: var(--border-radius);
                        min-height: 300px;
                        max-height: 400px;
                        overflow-y: auto;
                        padding: 1.5rem;
                        width: 100%;
                        box-sizing: border-box;
                    }

                    .no-association {
                        text-align: center;
                        color: var(--text-secondary);
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        justify-content: center;
                        min-height: 200px;
                    }

                    .no-association i {
                        font-size: 2.5rem;
                        margin-bottom: 1rem;
                        color: var(--border-color);
                    }

                    .no-association p {
                        margin: 0;
                        font-size: 1rem;
                        max-width: 300px;
                        line-height: 1.5;
                    }

                    /* Conceptos y Servicios Results */
                    .concepts-list,
                    .services-list {
                        display: grid;
                        gap: 0.75rem;
                        padding: 0;
                        margin: 0;
                        width: 100%;
                    }

                    .concept-item,
                    .service-item {
                        background: var(--background-color);
                        border: 1px solid var(--border-color);
                        border-radius: 8px;
                        padding: 1.25rem;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        transition: var(--transition);
                        width: 100%;
                        box-sizing: border-box;
                    }

                    .concept-item:hover,
                    .service-item:hover {
                        border-color: var(--primary-color);
                        background: rgba(37, 99, 235, 0.05);
                    }

                    .item-info {
                        display: flex;
                        flex-direction: column;
                        gap: 0.5rem;
                        flex: 1;
                        padding-right: 1rem;
                    }

                    .item-name {
                        font-weight: 600;
                        color: var(--text-primary);
                        font-size: 1.1rem;
                        line-height: 1.3;
                    }

                    .item-description {
                        color: var(--text-secondary);
                        font-size: 0.95rem;
                        line-height: 1.4;
                    }

                    .item-actions {
                        display: flex;
                        gap: 0.5rem;
                    }

                    .btn-associate {
                        background: var(--success-color);
                        color: white;
                        border: none;
                        padding: 0.5rem 1rem;
                        border-radius: 6px;
                        font-size: 0.85rem;
                        cursor: pointer;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        gap: 0.25rem;
                    }

                    .btn-associate:hover {
                        background: #059669;
                        transform: translateY(-1px);
                    }

                    .btn-associated {
                        background: var(--secondary-color);
                        color: white;
                        border: none;
                        padding: 0.5rem 1rem;
                        border-radius: 6px;
                        font-size: 0.85rem;
                        cursor: not-allowed;
                        display: flex;
                        align-items: center;
                        gap: 0.25rem;
                        opacity: 0.7;
                    }

                    /* Search Filter Styles */
                    .search-filter-container {
                        margin-bottom: 1rem;
                        padding: 1rem;
                        background: var(--background-color);
                        border: 1px solid var(--border-color);
                        border-radius: var(--border-radius);
                    }

                    .search-filter-input {
                        position: relative;
                        display: flex;
                        align-items: center;
                        background: var(--surface-color);
                        border: 2px solid var(--border-color);
                        border-radius: 8px;
                        padding: 0.75rem 1rem;
                        transition: var(--transition);
                    }

                    .search-filter-input:focus-within {
                        border-color: var(--primary-color);
                        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
                    }

                    .search-filter-input i {
                        color: var(--text-secondary);
                        margin-right: 0.75rem;
                        font-size: 0.9rem;
                    }

                    .search-filter-input input {
                        flex: 1;
                        border: none;
                        outline: none;
                        background: transparent;
                        font-size: 0.95rem;
                        color: var(--text-primary);
                        padding: 0;
                    }

                    .search-filter-input input::placeholder {
                        color: var(--text-secondary);
                        font-style: italic;
                    }

                    .clear-search-btn {
                        background: none;
                        border: none;
                        color: var(--text-secondary);
                        cursor: pointer;
                        padding: 0.25rem;
                        border-radius: 4px;
                        margin-left: 0.5rem;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 0.8rem;
                    }

                    .clear-search-btn:hover {
                        background: var(--border-color);
                        color: var(--text-primary);
                    }

                    /* Botón Crear Producto Mejorado */
                    .btn-create-product {
                        background: linear-gradient(135deg, var(--success-color) 0%, #059669 100%);
                        color: white;
                        border: none;
                        padding: 0.875rem 1.5rem;
                        border-radius: 8px;
                        font-size: 0.95rem;
                        font-weight: 600;
                        cursor: pointer;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        box-shadow: var(--shadow-md);
                    }

                    .btn-create-product:hover {
                        transform: translateY(-1px);
                        box-shadow: var(--shadow-lg);
                        background: linear-gradient(135deg, #059669 0%, var(--success-color) 100%);
                    }

                    .btn-create-product:active {
                        transform: translateY(0);
                        box-shadow: var(--shadow-md);
                    }

                    .btn-create-product i {
                        font-size: 1rem;
                    }

                    .associate-all-container {
                        margin-bottom: 1.5rem;
                        padding: 1rem;
                        background: rgba(245, 158, 11, 0.1);
                        border: 2px dashed var(--warning-color);
                        border-radius: var(--border-radius);
                        text-align: center;
                    }

                    .btn-associate-all {
                        padding: 1rem 2.5rem;
                        font-size: 1.1rem;
                        font-weight: 700;
                        border-radius: var(--border-radius);
                        display: inline-flex;
                        align-items: center;
                        gap: 0.75rem;
                        transition: var(--transition);
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .btn-associate-all:hover {
                        transform: translateY(-2px);
                        box-shadow: var(--shadow-lg);
                    }

                    /* Confirmation Modal Styles (Equivalente a FrmConfAsignacion) */
                    .confirmation-modal-overlay {
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background: rgba(0, 0, 0, 0.6);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        z-index: 2000;
                        animation: fadeIn 0.3s ease-out;
                    }

                    .confirmation-modal {
                        background: var(--surface-color);
                        border-radius: var(--border-radius);
                        box-shadow: var(--shadow-lg);
                        max-width: 600px;
                        width: 90%;
                        max-height: 80vh;
                        overflow-y: auto;
                        animation: slideIn 0.3s ease-out;
                        border: 1px solid var(--border-color);
                    }

                    .confirmation-header {
                        background: linear-gradient(135deg, var(--warning-color) 0%, #d97706 100%);
                        color: white;
                        padding: 1.5rem;
                        border-radius: var(--border-radius) var(--border-radius) 0 0;
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                    }

                    .confirmation-header h3 {
                        margin: 0;
                        font-size: 1.25rem;
                        font-weight: 600;
                        display: flex;
                        align-items: center;
                        gap: 0.75rem;
                    }

                    .confirmation-header i {
                        font-size: 1.5rem;
                        color: rgba(255, 255, 255, 0.9);
                    }

                    .confirmation-body {
                        padding: 2rem;
                        border-bottom: 1px solid var(--border-color);
                    }

                    .confirmation-message {
                        font-size: 1rem;
                        line-height: 1.6;
                        color: var(--text-primary);
                        margin: 0;
                        white-space: pre-line;
                        background: var(--background-color);
                        padding: 1.25rem;
                        border-radius: 8px;
                        border-left: 4px solid var(--warning-color);
                    }

                    .confirmation-actions {
                        padding: 1.5rem;
                        display: flex;
                        gap: 1rem;
                        justify-content: flex-end;
                        background: var(--background-color);
                        border-radius: 0 0 var(--border-radius) var(--border-radius);
                    }

                    .confirmation-actions .btn {
                        min-width: 120px;
                        padding: 0.75rem 1.5rem;
                        font-weight: 600;
                        border-radius: 8px;
                        transition: var(--transition);
                        border: none;
                        cursor: pointer;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        justify-content: center;
                    }

                    .confirmation-actions .btn-primary {
                        background: var(--primary-color);
                        color: white;
                    }

                    .confirmation-actions .btn-primary:hover {
                        background: var(--primary-dark);
                        transform: translateY(-1px);
                        box-shadow: var(--shadow-md);
                    }

                    .confirmation-actions .btn-secondary {
                        background: var(--secondary-color);
                        color: white;
                    }

                    .confirmation-actions .btn-secondary:hover {
                        background: #475569;
                        transform: translateY(-1px);
                        box-shadow: var(--shadow-md);
                    }

                    @keyframes slideIn {
                        from {
                            opacity: 0;
                            transform: scale(0.95) translateY(-20px);
                        }

                        to {
                            opacity: 1;
                            transform: scale(1) translateY(0);
                        }
                    }

                    /* Error Modal */
                    .error-modal-overlay {
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background: rgba(0, 0, 0, 0.6);
                        display: none;
                        align-items: center;
                        justify-content: center;
                        z-index: 10001;
                        animation: fadeIn 0.3s ease-out;
                        backdrop-filter: blur(4px);
                    }

                    .error-modal-overlay.show {
                        display: flex;
                    }

                    .error-modal {
                        background: var(--surface-color);
                        border-radius: 16px;
                        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
                        max-width: 450px;
                        width: 90%;
                        overflow: hidden;
                        animation: slideInScale 0.3s ease-out;
                        border: 1px solid var(--border-color);
                    }

                    .error-modal-header {
                        background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
                        color: white;
                        padding: 2rem 2rem 1.5rem;
                        text-align: center;
                        position: relative;
                    }

                    .error-modal-icon {
                        background: rgba(255, 255, 255, 0.2);
                        width: 64px;
                        height: 64px;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto 1rem;
                        font-size: 1.8rem;
                    }

                    .error-modal-title {
                        font-size: 1.5rem;
                        font-weight: 700;
                        margin: 0;
                        text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
                    }

                    .error-modal-body {
                        padding: 2rem;
                        text-align: center;
                    }

                    .error-modal-message {
                        font-size: 1.1rem;
                        color: var(--text-primary);
                        line-height: 1.6;
                        margin: 0 0 2rem;
                        background: var(--background-color);
                        padding: 1.25rem;
                        border-radius: 8px;
                        border-left: 4px solid #ef4444;
                    }

                    .error-modal-actions {
                        display: flex;
                        justify-content: center;
                    }

                    .error-modal-btn {
                        background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
                        color: white;
                        border: none;
                        border-radius: 12px;
                        padding: 0.875rem 2rem;
                        font-size: 1rem;
                        font-weight: 600;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        min-width: 120px;
                        justify-content: center;
                    }

                    .error-modal-btn:hover {
                        background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
                        transform: translateY(-2px);
                        box-shadow: 0 8px 20px rgba(239, 68, 68, 0.4);
                    }

                    /* Success Modal */
                    .success-modal-overlay {
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background: rgba(0, 0, 0, 0.6);
                        display: none;
                        align-items: center;
                        justify-content: center;
                        z-index: 10001;
                        animation: fadeIn 0.3s ease-out;
                        backdrop-filter: blur(4px);
                    }

                    .success-modal-overlay.show {
                        display: flex;
                    }

                    .success-modal {
                        background: var(--surface-color);
                        border-radius: 16px;
                        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
                        max-width: 450px;
                        width: 90%;
                        overflow: hidden;
                        animation: slideInScale 0.3s ease-out;
                        border: 1px solid var(--border-color);
                    }

                    .success-modal-header {
                        background: linear-gradient(135deg, #10b981 0%, #059669 100%);
                        color: white;
                        padding: 2rem 2rem 1.5rem;
                        text-align: center;
                        position: relative;
                    }

                    .success-modal-icon {
                        background: rgba(255, 255, 255, 0.2);
                        width: 64px;
                        height: 64px;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto 1rem;
                        font-size: 1.8rem;
                    }

                    .success-modal-title {
                        font-size: 1.5rem;
                        font-weight: 700;
                        margin: 0;
                        text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
                    }

                    .success-modal-body {
                        padding: 2rem;
                        text-align: center;
                    }

                    .success-modal-message {
                        font-size: 1.1rem;
                        color: var(--text-primary);
                        line-height: 1.6;
                        margin: 0 0 2rem;
                        background: var(--background-color);
                        padding: 1.25rem;
                        border-radius: 8px;
                        border-left: 4px solid #10b981;
                    }

                    .success-modal-actions {
                        display: flex;
                        gap: 1rem;
                        justify-content: center;
                    }

                    .success-modal-btn {
                        padding: 0.875rem 1.5rem;
                        border: none;
                        border-radius: 12px;
                        font-size: 1rem;
                        font-weight: 600;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        min-width: 120px;
                        justify-content: center;
                    }

                    .success-primary-btn {
                        background: linear-gradient(135deg, #10b981 0%, #059669 100%);
                        color: white;
                    }

                    .success-primary-btn:hover {
                        background: linear-gradient(135deg, #059669 0%, #047857 100%);
                        transform: translateY(-2px);
                        box-shadow: 0 8px 20px rgba(16, 185, 129, 0.4);
                    }

                    .success-secondary-btn {
                        background: var(--secondary-color);
                        color: white;
                    }

                    .success-secondary-btn:hover {
                        background: #475569;
                        transform: translateY(-2px);
                        box-shadow: 0 8px 20px rgba(100, 116, 139, 0.4);
                    }

                    /* Logout Confirmation Modal */
                    .logout-modal-overlay {
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background: rgba(0, 0, 0, 0.6);
                        display: none;
                        align-items: center;
                        justify-content: center;
                        z-index: 10000;
                        animation: fadeIn 0.3s ease-out;
                        backdrop-filter: blur(4px);
                    }

                    .logout-modal-overlay.show {
                        display: flex;
                    }

                    .logout-modal {
                        background: var(--surface-color);
                        border-radius: 16px;
                        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
                        max-width: 420px;
                        width: 90%;
                        overflow: hidden;
                        animation: slideInScale 0.3s ease-out;
                        border: 1px solid var(--border-color);
                    }

                    .logout-modal-header {
                        background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
                        color: white;
                        padding: 2rem 2rem 1.5rem;
                        text-align: center;
                        position: relative;
                    }

                    .logout-modal-icon {
                        background: rgba(255, 255, 255, 0.2);
                        width: 64px;
                        height: 64px;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto 1rem;
                        font-size: 1.8rem;
                    }

                    .logout-modal-title {
                        font-size: 1.5rem;
                        font-weight: 700;
                        margin: 0;
                        text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
                    }

                    .logout-modal-body {
                        padding: 2rem;
                        text-align: center;
                    }

                    .logout-modal-message {
                        font-size: 1.1rem;
                        color: var(--text-secondary);
                        line-height: 1.6;
                        margin: 0 0 2rem;
                    }

                    .logout-modal-actions {
                        display: flex;
                        gap: 1rem;
                        justify-content: center;
                    }

                    .logout-modal-btn {
                        padding: 0.875rem 2rem;
                        border: none;
                        border-radius: 12px;
                        font-size: 1rem;
                        font-weight: 600;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        min-width: 120px;
                        justify-content: center;
                        text-decoration: none;
                    }

                    .logout-confirm-btn {
                        background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
                        color: white;
                        box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
                    }

                    .logout-confirm-btn:hover {
                        background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
                        transform: translateY(-2px);
                        box-shadow: 0 8px 20px rgba(239, 68, 68, 0.4);
                        color: white;
                        text-decoration: none;
                    }

                    .logout-cancel-btn {
                        background: var(--secondary-color);
                        color: white;
                        box-shadow: 0 4px 12px rgba(100, 116, 139, 0.3);
                    }

                    .logout-cancel-btn:hover {
                        background: #475569;
                        transform: translateY(-2px);
                        box-shadow: 0 8px 20px rgba(100, 116, 139, 0.4);
                    }

                    @keyframes slideInScale {
                        from {
                            opacity: 0;
                            transform: scale(0.9) translateY(-20px);
                        }

                        to {
                            opacity: 1;
                            transform: scale(1) translateY(0);
                        }
                    }

                    /* Mobile Responsive for Product Detail Modal */
                    @media (max-width: 768px) {
                        .association-buttons {
                            grid-template-columns: 1fr;
                        }

                        .product-detail-container {
                            gap: 1rem;
                        }

                        .modal-content {
                            width: 95%;
                            max-height: 95vh;
                        }

                        .association-results {
                            min-height: 250px;
                        }

                        .confirmation-modal {
                            width: 95%;
                            max-width: none;
                        }

                        .logout-modal {
                            width: 95%;
                            max-width: 380px;
                        }

                        .logout-modal-actions {
                            flex-direction: column;
                        }

                        .logout-modal-btn {
                            width: 100%;
                        }

                        .confirmation-actions {
                            flex-direction: column;
                        }

                        .confirmation-actions .btn {
                            width: 100%;
                        }
                    }
                </style>
            </head>

            <body>
                <header class="header">
                    <div class="header-container">
                        <div class="logo">
                            <i class="fas fa-tags"></i>
                            Módulo de Promociones
                        </div>
                        <button class="mobile-menu-toggle" onclick="toggleMobileMenu()">
                            <i class="fas fa-bars"></i>
                        </button>
                        <nav>
                            <ul class="nav-menu" id="navMenu">
                                <li class="nav-item">
                                    <a href="#" class="nav-link ${showPromotions != 'true' ? 'active' : ''}"
                                        onclick="showSection('home')">
                                        <i class="fas fa-home"></i>
                                        Inicio
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%= request.getContextPath() %>/InitialPromotions"
                                        class="nav-link ${showPromotions == 'true' ? 'active' : ''}">
                                        <i class="fas fa-search"></i>
                                        Consultar Promociones
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link" onclick="showSection('associate_promotion')">
                                        <i class="fas fa-plus-circle"></i>
                                        Asociar Promoción
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link" onclick="showSection('manage_promotions')">
                                        <i class="fas fa-cogs"></i>
                                        Gestión de Promociones
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%= request.getContextPath() %>/InitialProducts"
                                        class="nav-link ${showProducts == 'true' ? 'active' : ''}">
                                        <i class="fas fa-box"></i>
                                        Gestión de Productos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%= request.getContextPath() %>/InitialPromocionesActivas"
                                        class="nav-link ${showPromocionesActivas == 'true' ? 'active' : ''}">
                                        <i class="fas fa-link"></i>
                                        Promociones Activas
                                    </a>
                                </li>
                            </ul>
                        </nav>

                        <!-- Información del usuario logueado -->
                        <div class="user-info">
                            <div class="user-display">
                                <span style="font-weight: 600; font-size: 0.95rem;">USER: PROMO</span>
                            </div>
                            <a href="#" class="logout-btn" onclick="return showLogoutModal()">
                                <i class="fas fa-sign-out-alt"></i>
                                Salir
                            </a>
                        </div>
                    </div>
                    </div>
                </header>

                <main class="main-content">
                    <!-- Home Section -->
                    <div id="home" class="section ${showPromotions != 'true' ? 'active' : ''}">
                        <div class="welcome-card">
                            <h2>Bienvenido al Módulo de Promociones</h2>
                            <p>Gestiona y consulta promociones de manera eficiente y profesional. Utiliza las
                                herramientas disponibles para obtener la información que necesitas.</p>

                            <div class="feature-grid">
                                <div class="feature-card">
                                    <div class="icon">
                                        <i class="fas fa-search"></i>
                                    </div>
                                    <h3>Consultar Promociones</h3>
                                    <p>Busca promociones por nombre y fechas de vigencia</p>
                                </div>
                                <div class="feature-card">
                                    <div class="icon">
                                        <i class="fas fa-cogs"></i>
                                    </div>
                                    <h3>Gestión de Promociones</h3>
                                    <p>Administra el ciclo de vida completo de promociones</p>
                                </div>

                                <div class="feature-card">
                                    <div class="icon">
                                        <i class="fas fa-box"></i>
                                    </div>
                                    <h3>Gestión de Productos</h3>
                                    <p>Administra productos y su relación con promociones</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Promotions Section -->
                    <div id="check_promotions" class="section ${showPromotions == 'true' ? 'active' : ''}">
                        <div class="content-container">
                            <div class="section-header">
                                <i class="fas fa-search"></i>
                                <h2>Consulta de Promociones</h2>
                            </div>

                            <form class="search-form" method="get" onsubmit="return submitSearchForm(event)">
                                <div class="form-grid">
                                    <div class="form-group">
                                        <label for="nombrePromocion" class="form-label">
                                            <i class="fas fa-tag"></i>
                                            Nombre de la Promoción
                                            <span class="text-secondary">(Opcional)</span>
                                        </label>
                                        <input type="text" id="nombrePromocion" name="nombrePromocion"
                                            class="form-input"
                                            placeholder="Ej: Promo Navidad (déjelo vacío para ver todas)"
                                            value="${param.nombrePromocion}">
                                    </div>
                                    <div class="form-group">
                                        <label for="vigenciaInicio" class="form-label">
                                            <i class="fas fa-calendar-alt"></i>
                                            Vigencia
                                        </label>
                                        <div class="date-range">
                                            <input type="date" id="vigenciaInicio" name="vigenciaInicio"
                                                class="form-input" value="${param.vigenciaInicio}">
                                            <span class="date-separator">hasta</span>
                                            <input type="date" id="vigenciaFin" name="vigenciaFin" class="form-input"
                                                value="${param.vigenciaFin}">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-search"></i>
                                        Consultar
                                    </button>
                                    <button type="button" class="btn btn-secondary" onclick="clearForm()">
                                        <i class="fas fa-eraser"></i>
                                        Limpiar Campos
                                    </button>
                                    <div class="export-actions">
                                        <button type="button" class="btn btn-success" onclick="exportToCSV()">
                                            <i class="fas fa-file-csv"></i>
                                            Exportar CSV
                                        </button>
                                    </div>
                                </div>
                            </form>

                            <div class="results-container" id="resultsContainer">
                                <c:choose>
                                    <c:when test="${recordCount > 0}">
                                        <c:choose>
                                            <c:when test="${isInitialLoad}">
                                                <div class="alert alert-info">
                                                    <i class="fas fa-info-circle"></i>
                                                    ${debugInfo}. Use los filtros de búsqueda para obtener resultados
                                                    específicos.
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="alert alert-success">
                                                    <i class="fas fa-check-circle"></i>
                                                    ${debugInfo}
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="table-container">
                                            <table class="data-table">
                                                <thead>
                                                    <tr>
                                                        <th><i class="fas fa-hashtag"></i> Código Promoción</th>
                                                        <th><i class="fas fa-tag"></i> Nombre Promoción</th>
                                                        <th><i class="fas fa-map"></i> Departamento</th>
                                                        <th><i class="fas fa-map-marker-alt"></i> Localidad</th>
                                                        <th><i class="fas fa-tags"></i> Categoría</th>
                                                        <th><i class="fas fa-layer-group"></i> Estrato</th>
                                                        <th><i class="fas fa-cubes"></i> Tipo Plan</th>
                                                        <th><i class="fas fa-box"></i> Tipo Producto</th>
                                                        <th><i class="fas fa-percent"></i> % Descuento</th>
                                                        <th><i class="fas fa-clock"></i> Duración</th>
                                                        <th><i class="fas fa-calendar-check"></i> Periodicidad</th>
                                                        <th><i class="fas fa-calendar-plus"></i> Fecha Creación</th>
                                                        <th><i class="fas fa-user"></i> Usuario</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${promotions}" var="promotion">
                                                        <tr>
                                                            <td class="codigo-col">${promotion.ticododi}</td>
                                                            <td>${promotion.ticodesc}</td>
                                                            <td>${promotion.depadesc}</td>
                                                            <td>${promotion.locandmb}</td>
                                                            <td>${promotion.catedesc}</td>
                                                            <td class="text-center">${promotion.sucacate}</td>
                                                            <td>${promotion.plsudesc}</td>
                                                            <td>${promotion.concdesc}</td>
                                                            <td class="porcentaje-col text-center">
                                                                ${promotion.cocoporc}%</td>
                                                            <td class="text-center">${promotion.cocotiap} meses</td>
                                                            <td class="text-center">${promotion.ticoperiodicidad}</td>
                                                            <td class="text-center">
                                                                <fmt:formatDate value="${promotion.ticofech}"
                                                                    pattern="dd/MM/yyyy" />
                                                            </td>
                                                            <td>${promotion.ticouser}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <!-- Paginación -->
                                            <div class="pagination-container">
                                                <div class="pagination-info">
                                                    <span>Tamaño de página:</span>
                                                    <select id="pageSizeSelect" onchange="changePageSize(this.value)">
                                                        <option value="10" ${pageSize==10 ? 'selected="selected"' : ''
                                                            }>10</option>
                                                        <option value="20" ${pageSize==20 ? 'selected="selected"' : ''
                                                            }>20</option>
                                                        <option value="30" ${pageSize==30 ? 'selected="selected"' : ''
                                                            }>30</option>
                                                    </select>
                                                </div>
                                                <div class="pagination-controls">
                                                    <button type="button" onclick="goToPage(1)" class="pagination-btn"
                                                        ${currentPage==1 ? 'disabled' : '' }>
                                                        <i class="fas fa-angle-double-left"></i>
                                                    </button>
                                                    <button type="button"
                                                        onclick="goToPage(<c:out value='${currentPage - 1}'/>)"
                                                        class="pagination-btn" ${currentPage==1 ? 'disabled' : '' }>
                                                        <i class="fas fa-angle-left"></i>
                                                    </button>
                                                    <span class="current-page">Página ${currentPage} de
                                                        ${totalPages}</span>
                                                    <button type="button"
                                                        onclick="goToPage(<c:out value='${currentPage + 1}'/>)"
                                                        class="pagination-btn" ${currentPage==totalPages ? 'disabled'
                                                        : '' }>
                                                        <i class="fas fa-angle-right"></i>
                                                    </button>
                                                    <button type="button"
                                                        onclick="goToPage(<c:out value='${totalPages}'/>)"
                                                        class="pagination-btn" ${currentPage==totalPages ? 'disabled'
                                                        : '' }>
                                                        <i class="fas fa-angle-double-right"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${showPromotions == 'true' && recordCount == 0}">
                                        <div class="alert alert-warning">
                                            <i class="fas fa-exclamation-triangle"></i>
                                            ${debugInfo}
                                            <br><small>Intente con diferentes criterios de búsqueda o haga clic en
                                                "Consultar" sin filtros para ver todas las promociones.</small>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-info">
                                            <i class="fas fa-info-circle"></i>
                                            Para consultar promociones, haga clic en el botón "Consultar". Puede usar
                                            filtros opcionales para búsquedas específicas.
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <!-- Associate Promotion Section -->
                    <div id="associate_promotion" class="section">
                        <div class="content-container">
                            <div class="section-header">
                                <i class="fas fa-plus-circle"></i>
                                <h2>Asociar Promoción</h2>
                            </div>

                            <form class="association-form" onsubmit="return submitAssociationForm(event)">
                                <!-- Service Number and Client Type -->
                                <div class="form-grid">
                                    <div class="form-group">
                                        <label for="numeroServicio" class="form-label">
                                            <i class="fas fa-phone"></i>
                                            Número de Servicio
                                            <span class="required">*</span>
                                        </label>
                                        <div class="input-with-button">
                                            <input type="text" id="numeroServicio" name="numeroServicio"
                                                class="form-input" placeholder="Ingrese número de servicio" required>
                                            <button type="button" class="search-btn" onclick="searchService()">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </div>

                                </div>

                                <!-- Service Information Display -->
                                <div id="serviceInfo" class="service-info" style="display: none;">
                                    <div class="info-card">
                                        <h4><i class="fas fa-info-circle"></i> Información del Servicio</h4>
                                        <div class="info-grid">
                                            <div class="info-item">
                                                <label>Cliente:</label>
                                                <span id="clienteName">-</span>
                                            </div>
                                            <div class="info-item">
                                                <label>Dirección:</label>
                                                <span id="clienteAddress">-</span>
                                            </div>
                                            <div class="info-item">
                                                <label>Estado:</label>
                                                <span id="serviceStatus">-</span>
                                            </div>
                                            <div class="info-item">
                                                <label>Plan:</label>
                                                <span id="servicePlan">-</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Promotions Section -->
                                <div class="promotions-section">
                                    <label class="form-label">
                                        <i class="fas fa-tags"></i>
                                        Promociones Disponibles
                                        <span class="required">*</span>
                                    </label>
                                    <div class="promotions-container">
                                        <div id="promotionsLoading" class="loading-message" style="display: none;">
                                            <div class="spinner"></div>
                                            Cargando promociones disponibles...
                                        </div>
                                        <div id="promotionsList" class="promotions-list">
                                            <div class="no-promotions">
                                                <i class="fas fa-search"></i>
                                                <p>Busque un servicio para ver las promociones disponibles</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Action Buttons -->
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary" id="assignBtn" disabled>
                                        <i class="fas fa-check"></i>
                                        Asignar
                                    </button>
                                    <button type="button" class="btn btn-secondary" onclick="cancelAssociation()">
                                        <i class="fas fa-times"></i>
                                        Cancelar
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Manage Promotions Section -->
                    <div id="manage_promotions" class="section">
                        <div class="content-container">
                            <div class="section-header">
                                <i class="fas fa-cogs"></i>
                                <h2>Gestión de Promociones</h2>
                            </div>

                            <form class="promotion-management-form" onsubmit="return submitPromotionForm(event)">
                                <!-- Main Promotion Data -->
                                <div class="promotion-main-data">
                                    <div class="form-grid-3">
                                        <div class="form-group full-width">
                                            <label for="descripcionPromocion" class="form-label">
                                                <i class="fas fa-file-alt"></i>
                                                Descripción
                                                <span class="required">*</span>
                                            </label>
                                            <input type="text" id="descripcionPromocion" name="descripcionPromocion"
                                                class="form-input"
                                                placeholder="Ej: DESCUENTO 33.02% CONCEPTO CONSUMO LOCAL" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="departamento" class="form-label">
                                                <i class="fas fa-map"></i>
                                                Departamento
                                                <span class="required">*</span>
                                            </label>
                                            <select id="departamento" name="departamento" class="form-input" required
                                                onchange="loadLocalidades()">
                                                <option value="">Seleccione Departamento</option>
                                                <!-- Los departamentos se cargan dinámicamente desde la BD -->
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="localidad" class="form-label">
                                                <i class="fas fa-map-marker-alt"></i>
                                                Localidad
                                            </label>
                                            <select id="localidad" name="localidad" class="form-input">
                                                <option value="">Selección Localidad</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="mercado" class="form-label">
                                                <i class="fas fa-tags"></i>
                                                Categoría
                                            </label>
                                            <select id="mercado" name="mercado" class="form-input"
                                                onchange="loadSubcategorias()">
                                                <option value="">Selección Categoría</option>
                                                <!-- Las categorías se cargan dinámicamente desde la BD -->
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="subcategoria" class="form-label">
                                                <i class="fas fa-list"></i>
                                                Subcategoría
                                            </label>
                                            <select id="subcategoria" name="subcategoria" class="form-input">
                                                <option value="">Selección Subcategoría</option>
                                                <!-- Las subcategorías se cargan dinámicamente según la categoría seleccionada -->
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="tipoPlan" class="form-label">
                                                <i class="fas fa-layer-group"></i>
                                                Tipo Plan
                                            </label>
                                            <div class="plan-search-container">
                                                <input type="text" id="tipoPlanSearch"
                                                    class="form-input plan-search-input"
                                                    placeholder="Buscar plan por descripción..."
                                                    oninput="buscarPlanes(this.value)" onfocus="mostrarListaPlanes()"
                                                    autocomplete="off">
                                                <input type="hidden" id="tipoPlan" name="tipoPlan" value="">
                                                <div id="planSearchResults" class="plan-search-results"
                                                    style="display: none;">
                                                    <div class="loading-message">Cargando planes...</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="codigoExterno" class="form-label">
                                                <i class="fas fa-barcode"></i>
                                                Código Externo
                                                <span class="required">*</span>
                                            </label>
                                            <input type="text" id="codigoExterno" name="codigoExterno"
                                                class="form-input" placeholder="Ej: PROMO 10 2012" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="periodicidad" class="form-label">
                                                <i class="fas fa-calendar-alt"></i>
                                                Periodicidad
                                                <span class="required">*</span>
                                            </label>
                                            <select id="periodicidad" name="periodicidad" class="form-input" required>
                                                <option value="">Seleccione Periodicidad</option>
                                                <option value="MENSUAL">Mensual</option>
                                                <option value="DIARIA">Diaria</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="estadoPromocion" class="form-label">
                                                <i class="fas fa-toggle-on"></i>
                                                Estado
                                            </label>
                                            <select id="estadoPromocion" name="estadoPromocion" class="form-input">
                                                <option value="ACTIVO">Activo</option>
                                                <option value="INACTIVO">Inactivo</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!-- Promotion Details Section -->
                                <div class="promotion-details-section">
                                    <div class="details-header">
                                        <h3><i class="fas fa-list"></i> Detalles Promoción</h3>
                                        <button type="button" class="btn btn-primary btn-sm"
                                            onclick="addPromotionDetail()">
                                            <i class="fas fa-plus"></i>
                                            Agregar Detalle
                                        </button>
                                    </div>

                                    <div class="details-table-container">
                                        <table class="details-table" id="promotionDetailsTable">
                                            <thead>
                                                <tr>
                                                    <th>Fecha Inicio</th>
                                                    <th>Fecha Finalización</th>
                                                    <th>Tiempo Aplicación</th>
                                                    <th>Porcentaje Desc.</th>
                                                    <th>Valor Desc.</th>
                                                    <th>Tipo Producto</th>
                                                    <th>Retención</th>
                                                    <th>Activo</th>
                                                    <th>Index</th>
                                                    <th>Conf. Index</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody id="promotionDetailsBody">
                                                <!-- Details rows will be added here -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- Form Actions -->
                                <div class="form-actions promotion-actions">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save"></i>
                                        Guardar Promoción
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Product Management Section -->
                    <div id="product_management" class="section ${showProducts == 'true' ? 'active' : ''}">
                        <div class="content-container">
                            <div class="section-header">
                                <i class="fas fa-box"></i>
                                <h2>Gestión de Productos</h2>
                                <button type="button" class="btn-create-product" onclick="abrirModalCrearProducto()">
                                    <i class="fas fa-plus"></i>
                                    Crear Producto
                                </button>
                            </div>

                            <!-- Buscador de productos -->
                            <form class="search-form" onsubmit="return buscarProductos(event)">
                                <div class="form-group">
                                    <label for="buscarProducto" class="form-label">
                                        <i class="fas fa-search"></i>
                                        Buscar Producto
                                    </label>
                                    <div class="input-with-button">
                                        <input type="text" id="buscarProducto" name="buscarProducto" class="form-input"
                                            placeholder="Buscar por código o nombre..." value="${param.buscarProducto}">
                                        <button type="submit" class="search-btn">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <button type="button" class="btn btn-secondary"
                                        onclick="limpiarBusquedaProductos()">
                                        <i class="fas fa-eraser"></i>
                                        Limpiar
                                    </button>
                                </div>
                            </form>

                            <div class="results-container" id="productResults">
                                <c:choose>
                                    <c:when test="${recordCount > 0}">
                                        <div class="alert alert-success">
                                            <i class="fas fa-check-circle"></i>
                                            ${debugInfo}
                                        </div>
                                        <div class="table-container">
                                            <table class="data-table">
                                                <thead>
                                                    <tr>
                                                        <th><i class="fas fa-hashtag"></i> Código Producto</th>
                                                        <th><i class="fas fa-tag"></i> Nombre Producto</th>
                                                        <th><i class="fas fa-cog"></i> Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${productos}" var="producto">
                                                        <tr>
                                                            <td class="codigo-col">${producto.tiposervcodi}</td>
                                                            <td>${producto.paradesc}</td>
                                                            <td class="text-center">
                                                                <button type="button" class="btn-details"
                                                                    onclick="verDetalleProducto('${producto.tiposervcodi}')">
                                                                    <i class="fas fa-eye"></i>
                                                                    Ver Detalle
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <!-- Paginación para productos -->
                                            <div class="pagination-container">
                                                <div class="pagination-info">
                                                    <span>Tamaño de página:</span>
                                                    <select id="pageSizeSelectProducts"
                                                        onchange="changePageSizeProducts(this.value)">
                                                        <option value="10" ${pageSize==10 ? 'selected="selected"' : ''
                                                            }>10</option>
                                                        <option value="20" ${pageSize==20 ? 'selected="selected"' : ''
                                                            }>20</option>
                                                        <option value="30" ${pageSize==30 ? 'selected="selected"' : ''
                                                            }>30</option>
                                                    </select>
                                                </div>
                                                <div class="pagination-controls">
                                                    <button type="button" onclick="goToPageProducts(1)"
                                                        class="pagination-btn" ${currentPage==1 ? 'disabled' : '' }>
                                                        <i class="fas fa-angle-double-left"></i>
                                                    </button>
                                                    <button type="button"
                                                        onclick="goToPageProducts(<c:out value='${currentPage - 1}'/>)"
                                                        class="pagination-btn" ${currentPage==1 ? 'disabled' : '' }>
                                                        <i class="fas fa-angle-left"></i>
                                                    </button>
                                                    <span class="current-page">Página ${currentPage} de
                                                        ${totalPages}</span>
                                                    <button type="button"
                                                        onclick="goToPageProducts(<c:out value='${currentPage + 1}'/>)"
                                                        class="pagination-btn" ${currentPage==totalPages ? 'disabled'
                                                        : '' }>
                                                        <i class="fas fa-angle-right"></i>
                                                    </button>
                                                    <button type="button"
                                                        onclick="goToPageProducts(<c:out value='${totalPages}'/>)"
                                                        class="pagination-btn" ${currentPage==totalPages ? 'disabled'
                                                        : '' }>
                                                        <i class="fas fa-angle-double-right"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${showProducts == 'true' && recordCount == 0}">
                                        <div class="alert alert-warning">
                                            <i class="fas fa-exclamation-triangle"></i>
                                            ${debugInfo}
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-info">
                                            <i class="fas fa-info-circle"></i>
                                            Cargando productos del sistema...
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <!-- Modal para Ver Detalle del Producto -->
                    <div id="productDetailModal" class="product-modal" style="display: none;">
                        <div class="modal-overlay" onclick="cerrarDetalleProducto()"></div>
                        <div class="modal-content modal-wide">
                            <div class="modal-header">
                                <h3><i class="fas fa-box"></i> Detalle del Producto</h3>
                                <button type="button" class="modal-close-btn" onclick="cerrarDetalleProducto()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="product-detail-container">
                                    <!-- Información del Producto -->
                                    <div class="product-info-section">
                                        <div class="product-name-display">
                                            <h4 id="productNameModal">Nombre del Producto</h4>
                                            <span class="product-code" id="productCodeModal">Código: </span>
                                        </div>
                                        <div class="product-info-extra">
                                            <span class="product-status">Activo</span>
                                            <span class="product-type">Producto de Servicios</span>
                                            <span id="productDateCreated">Creado: 01/01/2024</span>
                                        </div>
                                    </div>

                                    <!-- Sección de Asociaciones -->
                                    <div class="association-section">
                                        <h4><i class="fas fa-link"></i> Asociar</h4>
                                        <p
                                            style="color: var(--text-secondary); font-size: 0.9rem; margin-bottom: 1rem; text-align: center;">
                                            <i class="fas fa-info-circle"></i> Los conceptos se cargan automáticamente.
                                            Use los botones para alternar entre conceptos y servicios.
                                        </p>
                                        <div class="association-buttons">
                                            <button type="button" class="btn btn-primary btn-association"
                                                onclick="mostrarConceptos()">
                                                <i class="fas fa-lightbulb"></i>
                                                Conceptos
                                            </button>
                                            <button type="button" class="btn btn-secondary btn-association"
                                                onclick="mostrarServicios()">
                                                <i class="fas fa-cogs"></i>
                                                Servicios
                                            </button>
                                        </div>

                                        <!-- Área de resultados -->
                                        <div class="association-results" id="associationResults">
                                            <div class="no-association">
                                                <i class="fas fa-info-circle"></i>
                                                <p>Seleccione "Conceptos" o "Servicios" para gestionar las asociaciones
                                                    del producto actual</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" onclick="cerrarDetalleProducto()">
                                    <i class="fas fa-times"></i>
                                    Cerrar
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Modal para Crear Nuevo Producto -->
                    <div id="createProductModal" class="product-modal" style="display: none;">
                        <div class="modal-overlay" onclick="cerrarModalCrearProducto()"></div>
                        <div class="modal-content" style="max-width: 500px;">
                            <div class="modal-header">
                                <h3><i class="fas fa-plus"></i> Crear Nuevo Producto</h3>
                                <button type="button" class="modal-close-btn" onclick="cerrarModalCrearProducto()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="createProductForm" onsubmit="crearProducto(event)">
                                    <div class="product-detail-container">
                                        <!-- Información del Producto -->
                                        <div class="form-group" style="margin-bottom: 2rem;">
                                            <label for="newProductName" class="form-label">
                                                <i class="fas fa-tag"></i>
                                                Nombre del Producto
                                                <span class="required">*</span>
                                            </label>
                                            <input type="text" id="newProductName" name="newProductName"
                                                class="form-input" placeholder="Ej: Internet Fibra Óptica" required
                                                maxlength="30" oninput="validarDescripcionEnTiempoReal()">
                                            <div id="descripcionValidation" class="validation-feedback"
                                                style="display: none;">
                                                <span id="validationMessage"></span>
                                                <span id="characterCounter" class="character-counter">0/30</span>
                                            </div>
                                            <small class="form-help">
                                                <i class="fas fa-info-circle"></i>
                                                Ingrese una descripción clara del tipo de servicio o producto (máximo 30
                                                caracteres).
                                            </small>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" onclick="cerrarModalCrearProducto()">
                                    <i class="fas fa-times"></i>
                                    Cancelar
                                </button>
                                <button type="button" class="btn btn-primary" onclick="crearNuevoProducto()"
                                    id="saveProductBtn">
                                    <i class="fas fa-save"></i>
                                    Crear Producto
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Modal de Confirmación Personalizado -->
                    <div id="confirmationModal" class="product-modal" style="display: none;">
                        <div class="modal-overlay" onclick="cerrarModalConfirmacion()"></div>
                        <div class="modal-content" style="max-width: 500px;">
                            <div class="modal-header">
                                <h3><i class="fas fa-question-circle" style="color: #f39c12;"></i> Confirmación</h3>
                                <button type="button" class="modal-close-btn" onclick="cerrarModalConfirmacion()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div style="text-align: center; padding: 1rem 0;">
                                    <div style="font-size: 3rem; color: #f39c12; margin-bottom: 1rem;">
                                        <i class="fas fa-exclamation-triangle"></i>
                                    </div>
                                    <h4 id="confirmationTitle" style="color: var(--text-primary); margin-bottom: 1rem;">
                                        ¿Está seguro de realizar esta acción?
                                    </h4>
                                    <p id="confirmationMessage"
                                        style="color: var(--text-secondary); font-size: 1rem; line-height: 1.5;">
                                        Esta acción no se puede deshacer.
                                    </p>
                                </div>
                            </div>
                            <div class="modal-footer" style="justify-content: center; gap: 1rem;">
                                <button type="button" class="btn btn-secondary" onclick="cerrarModalConfirmacion()"
                                    style="min-width: 120px;">
                                    <i class="fas fa-times"></i>
                                    Cancelar
                                </button>
                                <button type="button" id="confirmActionBtn" class="btn btn-danger"
                                    style="min-width: 120px;">
                                    <i class="fas fa-check"></i>
                                    Confirmar
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Assigned Promotions Section -->
                    <div id="assigned_promotions" class="section">
                        <div class="content-container">
                            <div class="section-header">
                                <i class="fas fa-link"></i>
                                <h2>Promociones Activas</h2>
                            </div>

                            <!-- Formulario de filtros -->
                            <form class="search-form">
                                <div class="form-group">
                                    <label for="numeroServicioAsignado" class="form-label">
                                        <i class="fas fa-phone"></i>
                                        Filtrar por número de servicio o placa (opcional)
                                    </label>
                                    <div class="input-with-button">
                                        <input type="text" id="numeroServicioAsignado" name="numeroServicioAsignado"
                                            class="form-input"
                                            placeholder="Ingrese número de servicio o placa para filtrar">
                                        <button type="button" class="search-btn" onclick="filtrarPromocionesActivas()">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>

                            <!-- Resultados -->
                            <div class="results-container" id="resultsContainer">
                                <div id="promocionesAsignadasArea">
                                    <c:choose>
                                        <c:when test="${recordCount > 0}">
                                            <c:choose>
                                                <c:when test="${isInitialLoad}">
                                                    <div class="alert alert-info">
                                                        <i class="fas fa-info-circle"></i>
                                                        ${debugInfo}
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="alert alert-success">
                                                        <i class="fas fa-check-circle"></i>
                                                        ${debugInfo}
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="table-container">
                                                <table class="data-table">
                                                    <thead>
                                                        <tr>
                                                            <th><i class="fas fa-id-card"></i> Placa</th>
                                                            <th><i class="fas fa-hashtag"></i> Código Promoción
                                                            </th>
                                                            <th><i class="fas fa-tag"></i> Promoción</th>
                                                            <th><i class="fas fa-map"></i> Departamento</th>
                                                            <th><i class="fas fa-map-marker-alt"></i> Municipio
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${promocionesActivas}" var="promocion">
                                                            <tr>
                                                                <td class="codigo-col">${promocion.placa}</td>
                                                                <td class="text-center">${promocion.codPromo}
                                                                </td>
                                                                <td>${promocion.promocion}</td>
                                                                <td>${promocion.departamento}</td>
                                                                <td>${promocion.municipio}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <!-- Paginación -->
                                                <div class="pagination-container">
                                                    <div class="pagination-info">
                                                        <span>Tamaño de página:</span>
                                                        <select id="pageSizeSelectActivas"
                                                            onchange="changePageSizeActivas(this.value)">
                                                            <option value="10" ${pageSize==10 ? 'selected="selected"'
                                                                : '' }>10</option>
                                                            <option value="20" ${pageSize==20 ? 'selected="selected"'
                                                                : '' }>20</option>
                                                            <option value="30" ${pageSize==30 ? 'selected="selected"'
                                                                : '' }>30</option>
                                                        </select>
                                                    </div>
                                                    <div class="pagination-controls">
                                                        <button type="button" onclick="goToPageActivas(1)"
                                                            class="pagination-btn" ${currentPage==1 ? 'disabled' : '' }>
                                                            <i class="fas fa-angle-double-left"></i>
                                                        </button>
                                                        <button type="button"
                                                            onclick="goToPageActivas(<c:out value='${currentPage - 1}'/>)"
                                                            class="pagination-btn" ${currentPage==1 ? 'disabled' : '' }>
                                                            <i class="fas fa-angle-left"></i>
                                                        </button>
                                                        <span class="current-page">Página ${currentPage} de
                                                            ${totalPages}</span>
                                                        <button type="button"
                                                            onclick="goToPageActivas(<c:out value='${currentPage + 1}'/>)"
                                                            class="pagination-btn" ${currentPage==totalPages
                                                            ? 'disabled' : '' }>
                                                            <i class="fas fa-angle-right"></i>
                                                        </button>
                                                        <button type="button"
                                                            onclick="goToPageActivas(<c:out value='${totalPages}'/>)"
                                                            class="pagination-btn" ${currentPage==totalPages
                                                            ? 'disabled' : '' }>
                                                            <i class="fas fa-angle-double-right"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${showPromocionesActivas == 'true' && recordCount == 0}">
                                            <div class="alert alert-warning">
                                                <i class="fas fa-exclamation-triangle"></i>
                                                ${debugInfo}
                                                <br><small>Intente con un número de placa diferente.</small>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="no-promotions-assigned">
                                                <i class="fas fa-search"></i>
                                                <p>Cargando promociones activas... Si no ve datos, use el filtro
                                                    para buscar por número específico.</p>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

                <footer
                    style="background: var(--text-primary); color: white; text-align: center; padding: 2rem; margin-top: 4rem;">
                    <p>&copy; 2025 Promociones - Todos los derechos reservados</p>
                </footer>

                <script>
                    // Verificar que JavaScript se está cargando correctamente
                    console.log('=== SCRIPT PROMOCIONES CARGADO CORRECTAMENTE ===');
                    console.log('Las funciones de exportación deberían estar disponibles ahora');

                    // Test inicial de notificaciones después de 2 segundos
                    setTimeout(() => {
                        console.log('Probando sistema de notificaciones...');
                        console.log('Sistema de notificaciones funcionando correctamente');
                    }, 2000);

                    function showSection(sectionId) {
                        // Hide all sections
                        document.querySelectorAll('.section').forEach(section => {
                            section.classList.remove('active');
                        });

                        // Remove active class from all nav links
                        document.querySelectorAll('.nav-link').forEach(link => {
                            link.classList.remove('active');
                        });

                        // Show selected section
                        document.getElementById(sectionId).classList.add('active');

                        // Add active class to clicked nav link
                        if (event && event.target) {
                            event.target.classList.add('active');
                        }

                        // Load data specific to each section
                        if (sectionId === 'manage_promotions') {
                            loadDepartamentos();
                            loadCategorias();
                        }

                        // Close mobile menu if open
                        const navMenu = document.getElementById('navMenu');
                        navMenu.classList.remove('active');
                    }

                    function toggleMobileMenu() {
                        const navMenu = document.getElementById('navMenu');
                        navMenu.classList.toggle('active');
                    }

                    function submitSearchForm(event) {
                        event.preventDefault();

                        // Show loading state
                        showLoadingState();

                        // Submit form via window location to stay in same tab
                        const form = event.target;
                        const formData = new FormData(form);
                        const params = new URLSearchParams(formData);

                        // Add pagination parameters
                        params.set('page', '1'); // Reset to first page on new search
                        params.set('pageSize', document.getElementById('pageSizeSelect')?.value || '10');

                        window.location.href = '<%= request.getContextPath() %>/LoadPromotions?' + params.toString();

                        return false;
                    }

                    function goToPage(page) {
                        // Mantener los parámetros de búsqueda actuales
                        const form = document.querySelector('.search-form');
                        const formData = new FormData(form);
                        const params = new URLSearchParams(formData);

                        // Agregar página y tamaño de página
                        params.set('page', page);
                        params.set('pageSize', document.getElementById('pageSizeSelect')?.value || '10');

                        window.location.href = '<%= request.getContextPath() %>/LoadPromotions?' + params.toString();
                    }

                    function changePageSize(size) {
                        // Mantener los parámetros de búsqueda actuales
                        const form = document.querySelector('.search-form');
                        const formData = new FormData(form);
                        const params = new URLSearchParams(formData);

                        // Agregar nuevo tamaño de página y resetear a primera página
                        params.set('pageSize', size);
                        params.set('page', '1');

                        window.location.href = '<%= request.getContextPath() %>/LoadPromotions?' + params.toString();
                    }

                    function clearForm() {
                        document.getElementById('nombrePromocion').value = '';
                        document.getElementById('vigenciaInicio').value = '';
                        document.getElementById('vigenciaFin').value = '';

                        // Navigate to clean state
                        window.location.href = '<%= request.getContextPath() %>/views/index.jsp';
                    }

                    function exportToCSV() {
                        console.log('=== FUNCIÓN EXPORTTOCSV LLAMADA ===');
                        console.log('Verificando que JavaScript funciona correctamente...');

                        const recordCount = '${recordCount}';
                        console.log('Record count:', recordCount);
                        console.log('Record count type:', typeof recordCount);
                        console.log('Record count length:', recordCount.length);

                        // Revisar si hay datos en la tabla en lugar de confiar solo en recordCount
                        const tableRows = document.querySelectorAll('.data-table tbody tr');
                        console.log('Filas en tabla:', tableRows.length);

                        if (tableRows.length === 0) {
                            console.log('No hay filas en la tabla, mostrando alert...');
                            showErrorModal('No hay datos para exportar. Realice una consulta primero.');
                            return;
                        }

                        // Obtener los parámetros actuales de búsqueda
                        const nombrePromocion = document.getElementById('nombrePromocion').value;
                        const vigenciaInicio = document.getElementById('vigenciaInicio').value;
                        const vigenciaFin = document.getElementById('vigenciaFin').value;
                        const pageSize = document.getElementById('pageSizeSelect').value || '10';

                        console.log('Parámetros de exportación:');
                        console.log('- nombrePromocion:', nombrePromocion);
                        console.log('- vigenciaInicio:', vigenciaInicio);
                        console.log('- vigenciaFin:', vigenciaFin);
                        console.log('- pageSize:', pageSize);

                        console.log('Pasando validación, construyendo URL...');

                        // Construir URL con parámetros
                        const params = new URLSearchParams();
                        params.set('format', 'csv');
                        console.log('Parámetros agregados: format=csv');

                        if (nombrePromocion) {
                            params.set('nombrePromocion', nombrePromocion);
                            console.log('Agregado nombrePromocion:', nombrePromocion);
                        }
                        if (vigenciaInicio) {
                            params.set('vigenciaInicio', vigenciaInicio);
                            console.log('Agregado vigenciaInicio:', vigenciaInicio);
                        }
                        if (vigenciaFin) {
                            params.set('vigenciaFin', vigenciaFin);
                            console.log('Agregado vigenciaFin:', vigenciaFin);
                        }
                        params.set('pageSize', pageSize);
                        console.log('Agregado pageSize:', pageSize);

                        const exportUrl = '<%= request.getContextPath() %>/ExportPromotions?' + params.toString();
                        console.log('URL de exportación completa:', exportUrl);

                        // Mostrar mensaje de descarga
                        console.log('Mostrando alert...');
                        console.log('Generando archivo CSV...');

                        // Probar con window.location primero en lugar de window.open
                        try {
                            console.log('Intentando navegar a:', exportUrl);
                            console.log('Ejecutando window.location.href...');
                            window.location.href = exportUrl;
                            console.log('window.location.href ejecutado');
                        } catch (error) {
                            console.error('Error al exportar:', error);
                            showErrorModal('Error al exportar: ' + error.message);
                        }
                    }

                    // Funciones exportToPDF y testExport eliminadas - solo mantenemos exportToCSV



                    // Función de validación en tiempo real para la descripción del producto
                    function validarDescripcionEnTiempoReal() {
                        const input = document.getElementById('newProductName');
                        const validationDiv = document.getElementById('descripcionValidation');
                        const messageSpan = document.getElementById('validationMessage');
                        const counterSpan = document.getElementById('characterCounter');
                        const saveBtn = document.getElementById('saveProductBtn');

                        const valor = input.value;
                        const valorTrimmed = valor.trim();
                        const length = valor.length;

                        // Actualizar contador
                        counterSpan.textContent = length + '/30';

                        // Resetear estilos
                        input.style.borderColor = '';
                        validationDiv.style.display = 'none';

                        let isValid = true;
                        let message = '';

                        if (length > 0) {
                            validationDiv.style.display = 'flex';
                            validationDiv.style.justifyContent = 'space-between';
                            validationDiv.style.alignItems = 'center';
                            validationDiv.style.marginTop = '0.5rem';
                            validationDiv.style.fontSize = '0.85rem';

                            if (length > 30) {
                                isValid = false;
                                message = '⚠️ Excede el límite de caracteres';
                                input.style.borderColor = '#ef4444';
                                messageSpan.style.color = '#ef4444';
                                counterSpan.style.color = '#ef4444';
                                counterSpan.style.fontWeight = 'bold';
                            } else if (valorTrimmed.length === 0) {
                                isValid = false;
                                message = '⚠️ No puede ser solo espacios';
                                input.style.borderColor = '#f59e0b';
                                messageSpan.style.color = '#f59e0b';
                                counterSpan.style.color = '#6b7280';
                            } else if (valor.includes("'") || valor.includes('"')) {
                                isValid = false;
                                message = '⚠️ No puede contener comillas';
                                input.style.borderColor = '#f59e0b';
                                messageSpan.style.color = '#f59e0b';
                                counterSpan.style.color = '#6b7280';
                            } else if (length >= 25) {
                                message = '⚡ Cerca del límite';
                                input.style.borderColor = '#f59e0b';
                                messageSpan.style.color = '#f59e0b';
                                counterSpan.style.color = '#f59e0b';
                            } else {
                                message = '✅ Válido';
                                input.style.borderColor = '#10b981';
                                messageSpan.style.color = '#10b981';
                                counterSpan.style.color = '#6b7280';
                            }

                            messageSpan.textContent = message;
                        } else {
                            counterSpan.style.color = '#6b7280';
                        }

                        // Habilitar/deshabilitar botón de guardar
                        if (saveBtn) {
                            saveBtn.disabled = !isValid || valorTrimmed.length === 0;
                            if (saveBtn.disabled) {
                                saveBtn.style.opacity = '0.5';
                                saveBtn.style.cursor = 'not-allowed';
                            } else {
                                saveBtn.style.opacity = '1';
                                saveBtn.style.cursor = 'pointer';
                            }
                        }
                    }

                    function showLoadingState() {
                        const resultsContainer = document.getElementById('resultsContainer');
                        resultsContainer.innerHTML = '<div class="loading">' +
                            '<div class="spinner"></div>' +
                            'Buscando promociones...' +
                            '</div>';
                    }

                    // Auto-show sections if there are search results
                    document.addEventListener('DOMContentLoaded', function () {
                        var showPromotions = '<c:out value="${showPromotions}" default="false"/>';
                        var showPromocionesActivas = '<c:out value="${showPromocionesActivas}" default="false"/>';
                        var showProducts = '<c:out value="${showProducts}" default="false"/>';

                        if (showPromotions === 'true') {
                            showSection('check_promotions');
                        } else if (showPromocionesActivas === 'true') {
                            showSection('assigned_promotions');

                            // Rellenar el campo de placa desde la URL
                            const urlParams = new URLSearchParams(window.location.search);
                            const placa = urlParams.get('placa');
                            if (placa) {
                                const placaInput = document.getElementById('numeroServicioAsignado');
                                if (placaInput) {
                                    placaInput.value = placa;
                                }
                            }
                        } else if (showProducts === 'true') {
                            showSection('product_management');
                        }
                    });

                    // Close mobile menu when clicking outside
                    document.addEventListener('click', function (event) {
                        const navMenu = document.getElementById('navMenu');
                        const toggleButton = document.querySelector('.mobile-menu-toggle');

                        if (!navMenu.contains(event.target) && !toggleButton.contains(event.target)) {
                            navMenu.classList.remove('active');
                        }
                    });

                    // Association Form Functions
                    function searchService() {
                        const numeroServicio = document.getElementById('numeroServicio').value.trim();

                        if (numeroServicio === '') {
                            showErrorModal('Por favor, ingrese un número de servicio para buscar.');
                            document.getElementById('numeroServicio').focus();
                            return;
                        }

                        // Show loading state
                        showServiceLoading(true);

                        // Call the SearchService endpoint
                        fetch('SearchService', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded',
                            },
                            body: 'numeroServicio=' + encodeURIComponent(numeroServicio)
                        })
                            .then(response => response.json())
                            .then(data => {
                                showServiceLoading(false);
                                if (data.success) {
                                    displayServiceInfo(data.data);
                                    displayPromotionsFromService(data.promociones);
                                } else {
                                    showErrorModal('Error: ' + data.message);
                                    document.getElementById('serviceInfo').style.display = 'none';
                                    showNoPromotionsMessage();
                                }
                            })
                            .catch(error => {
                                showServiceLoading(false);
                                console.error('Error:', error);
                                showErrorModal('Error al buscar el servicio. Por favor, intente nuevamente.');
                                document.getElementById('serviceInfo').style.display = 'none';
                                showNoPromotionsMessage();
                            });
                    }

                    function showServiceLoading(show) {
                        const serviceInfo = document.getElementById('serviceInfo');
                        if (show) {
                            serviceInfo.style.display = 'block';
                            serviceInfo.innerHTML = '<div class="loading-message">' +
                                '<div class="spinner"></div>' +
                                'Buscando información del servicio...' +
                                '</div>';
                        } else {
                            serviceInfo.style.display = 'none';
                        }
                    }

                    function displayServiceInfo(data) {
                        const serviceInfo = document.getElementById('serviceInfo');

                        serviceInfo.innerHTML = '<div class="info-card">' +
                            '<h4><i class="fas fa-info-circle"></i> Información del Servicio</h4>' +
                            '<div class="info-grid">' +
                            '<div class="info-item">' +
                            '<label>Placa:</label>' +
                            '<span class="highlight-placa"><strong>' + (data.placa || '-') + '</strong></span>' +
                            '</div>' +
                            '<div class="info-item">' +
                            '<label>Suscripción:</label>' +
                            '<span>' + (data.suscripcion || '-') + '</span>' +
                            '</div>' +
                            '<div class="info-item">' +
                            '<label>Departamento:</label>' +
                            '<span>' + (data.departamento || '-') + '</span>' +
                            '</div>' +
                            '<div class="info-item">' +
                            '<label>Municipio:</label>' +
                            '<span>' + (data.municipio || '-') + '</span>' +
                            '</div>' +
                            '<div class="info-item">' +
                            '<label>Categoría:</label>' +
                            '<span>' + (data.categoria || '-') + '</span>' +
                            '</div>' +
                            '<div class="info-item">' +
                            '<label>Subcategoría:</label>' +
                            '<span>' + (data.subcategoria || '-') + '</span>' +
                            '</div>' +
                            '<div class="info-item">' +
                            '<label>Plan:</label>' +
                            '<span>' + (data.plan || '-') + '</span>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                        serviceInfo.style.display = 'block';
                    }

                    function loadAvailablePromotions(numeroServicio) {
                        const promotionsLoading = document.getElementById('promotionsLoading');
                        const promotionsList = document.getElementById('promotionsList');

                        promotionsLoading.style.display = 'flex';
                        promotionsList.innerHTML = '';

                        // Simulate API call for promotions - Replace with actual service call
                        setTimeout(() => {
                            const mockPromotions = [
                                {
                                    id: 1,
                                    nombre: 'Promo Navidad 2025',
                                    descripcion: 'Descuento especial para temporada navideña',
                                    valor: 15000,
                                    vigencia: 'Hasta 31/12/2025',
                                    categoria: 'Internet'
                                },
                                {
                                    id: 2,
                                    nombre: 'Upgrade Gratis',
                                    descripcion: 'Aumento de velocidad sin costo adicional',
                                    valor: 25000,
                                    vigencia: 'Hasta 28/02/2025',
                                    categoria: 'Internet'
                                },
                                {
                                    id: 3,
                                    nombre: 'HBO Max Incluido',
                                    descripcion: 'Servicio de streaming incluido por 6 meses',
                                    valor: 35000,
                                    vigencia: 'Hasta 15/03/2025',
                                    categoria: 'TV'
                                }
                            ];

                            displayPromotions(mockPromotions);
                            promotionsLoading.style.display = 'none';
                        }, 1500);
                    }

                    function displayPromotions(promotions) {
                        const promotionsList = document.getElementById('promotionsList');

                        if (promotions.length === 0) {
                            promotionsList.innerHTML = '<div class="no-promotions">' +
                                '<i class="fas fa-tags"></i>' +
                                '<p>No hay promociones disponibles para este servicio</p>' +
                                '</div>';
                            return;
                        }

                        var promotionsHtml = '';
                        for (var i = 0; i < promotions.length; i++) {
                            var promo = promotions[i];
                            promotionsHtml += '<div class="promotion-item" onclick="selectPromotion(' + promo.id + ')" data-promo-id="' + promo.id + '">' +
                                '<div class="promotion-header">' +
                                '<div class="promotion-title">' +
                                '<i class="fas fa-tag"></i>' +
                                promo.nombre +
                                '</div>' +
                                '<div class="promotion-value">$' + promo.valor.toLocaleString() + '</div>' +
                                '</div>' +
                                '<div class="promotion-details">' +
                                '<div class="promotion-detail">' +
                                '<i class="fas fa-info-circle"></i>' +
                                promo.descripcion +
                                '</div>' +
                                '<div class="promotion-detail">' +
                                '<i class="fas fa-calendar"></i>' +
                                promo.vigencia +
                                '</div>' +
                                '<div class="promotion-detail">' +
                                '<i class="fas fa-layer-group"></i>' +
                                promo.categoria +
                                '</div>' +
                                '</div>' +
                                '</div>';
                        }
                        promotionsList.innerHTML = promotionsHtml;
                    }

                    function displayPromotionsFromService(promociones) {
                        const promotionsLoading = document.getElementById('promotionsLoading');
                        const promotionsList = document.getElementById('promotionsList');

                        promotionsLoading.style.display = 'none';

                        if (!promociones || promociones.length === 0) {
                            showNoPromotionsMessage();
                            return;
                        }

                        var promotionsHtml = '';
                        for (var i = 0; i < promociones.length; i++) {
                            var promo = promociones[i];
                            var duracionText = '';
                            if (promo.cocotiap && promo.ticoperiodicidad) {
                                duracionText = promo.cocotiap + ' ' +
                                    (promo.ticoperiodicidad === 'M' ? 'meses' :
                                        promo.ticoperiodicidad === 'A' ? 'años' : 'periodos');
                            }

                            promotionsHtml += '<div class="promotion-card" data-promo-id="' + promo.ticocodi + '">' +
                                '<div class="promotion-header">' +
                                '<div class="promotion-code">' + promo.ticocodi + '</div>' +
                                '<div class="promotion-title">' + (promo.ticodesc || '-') + '</div>' +
                                '</div>' +
                                '<div class="promotion-details-grid">' +
                                '<div class="promotion-detail">' +
                                '<label>Departamento:</label>' +
                                '<span>' + (promo.depadesc || '-') + '</span>' +
                                '</div>' +
                                '<div class="promotion-detail">' +
                                '<label>Localidad:</label>' +
                                '<span>' + (promo.locanomb || '-') + '</span>' +
                                '</div>' +
                                '<div class="promotion-detail">' +
                                '<label>Categoría:</label>' +
                                '<span>' + (promo.catedesc || '-') + '</span>' +
                                '</div>' +
                                '<div class="promotion-detail">' +
                                '<label>Estrato:</label>' +
                                '<span>' + (promo.sucadesc || '-') + '</span>' +
                                '</div>' +
                                '<div class="promotion-detail">' +
                                '<label>Tipo Plan:</label>' +
                                '<span>' + (promo.plsudesc || '-') + '</span>' +
                                '</div>' +
                                '<div class="promotion-detail">' +
                                '<label>Tipo Producto:</label>' +
                                '<span>' + (promo.paradesc || '-') + '</span>' +
                                '</div>' +
                                '<div class="promotion-detail">' +
                                '<label>% Descuento:</label>' +
                                '<span class="discount-percentage">' + (promo.cocoporc || 0) + '%</span>' +
                                '</div>' +
                                '<div class="promotion-detail">' +
                                '<label>Duración:</label>' +
                                '<span>' + duracionText + '</span>' +
                                '</div>' +
                                '<div class="promotion-detail">' +
                                '<label>Usuario:</label>' +
                                '<span>' + (promo.ticouser || '-') + '</span>' +
                                '</div>' +
                                '</div>' +
                                '<div class="promotion-actions">' +
                                '<button type="button" class="btn btn-primary btn-associate" ' +
                                'onclick="associatePromotion(' + promo.ticocodi + ')">' +
                                '<i class="fas fa-link"></i> Asociar Promoción' +
                                '</button>' +
                                '</div>' +
                                '</div>';
                        }

                        promotionsList.innerHTML = promotionsHtml;
                    }

                    function showNoPromotionsMessage() {
                        const promotionsList = document.getElementById('promotionsList');
                        promotionsList.innerHTML = '<div class="no-promotions">' +
                            '<i class="fas fa-exclamation-triangle"></i>' +
                            '<p>No hay promociones disponibles para este servicio</p>' +
                            '</div>';
                    }



                    function associatePromotion(promotionId) {
                        // Obtener el número de servicio del campo de entrada
                        const numeroServicio = document.getElementById('numeroServicio').value.trim();

                        if (!numeroServicio) {
                            showErrorModal('No hay número de servicio disponible. Por favor, busque un servicio primero.');
                            return;
                        }

                        // Confirmar la acción con el usuario usando el modal personalizado
                        mostrarConfirmacion(
                            'Confirmar Asociación',
                            '¿Está seguro que desea asociar la promoción ID ' + promotionId + ' al servicio ' + numeroServicio + '?',
                            function () {
                                executeAssociatePromotion(promotionId, numeroServicio);
                            },
                            false // No es peligroso, usar botón primario
                        );
                    }

                    function executeAssociatePromotion(promotionId, numeroServicio) {
                        // Cambiar el texto del botón a "Procesando..."
                        const button = document.querySelector('[onclick="associatePromotion(' + promotionId + ')"]');
                        const originalText = button.innerHTML;
                        button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Procesando...';
                        button.disabled = true;

                        // Llamar al endpoint para asociar la promoción directamente
                        const params = new URLSearchParams({
                            action: 'associatePromotionDirect',
                            promotionId: promotionId,
                            numeroServicio: numeroServicio
                        });

                        fetch('LoadProductAssociations?' + params.toString(), {
                            method: 'GET',
                            headers: {
                                'Content-Type': 'application/json'
                            }
                        })
                            .then(response => {
                                // Siempre intentar leer el JSON, sin importar el status
                                return response.json().then(data => {
                                    return { data, status: response.status, ok: response.ok };
                                });
                            })
                            .then(result => {
                                // Restaurar el botón
                                button.innerHTML = originalText;
                                button.disabled = false;

                                if (result.ok && result.data.success) {
                                    showSuccessModal(result.data.message);
                                    // Opcional: Recargar las promociones para reflejar cambios
                                    searchService();
                                } else {
                                    // Mostrar el mensaje específico del servidor (incluye casos de HTTP 409)
                                    showErrorModal(result.data.error || result.data.message || 'Error desconocido');
                                }
                            })
                            .catch(error => {
                                console.error('Error asociando promoción:', error);
                                button.innerHTML = originalText;
                                button.disabled = false;
                                showErrorModal('Error al asociar promoción: ' + error.message);
                            });
                    }

                    let selectedPromotionId = null;

                    function selectPromotion(promotionId) {
                        // Remove selection from all promotions
                        document.querySelectorAll('.promotion-item').forEach(item => {
                            item.classList.remove('selected');
                        });

                        // Add selection to clicked promotion
                        const selectedItem = document.querySelector('[data-promo-id="' + promotionId + '"]');
                        selectedItem.classList.add('selected');

                        selectedPromotionId = promotionId;

                        // Enable assign button
                        document.getElementById('assignBtn').disabled = false;
                    }

                    function submitAssociationForm(event) {
                        event.preventDefault();

                        const numeroServicio = document.getElementById('numeroServicio').value.trim();
                        const tipoCliente = 'I'; // Valor por defecto: 'I' para Individual

                        if (numeroServicio === '') {
                            showErrorModal('Por favor, ingrese un número de servicio.');
                            return false;
                        }

                        if (selectedPromotionId === null) {
                            showErrorModal('Por favor, seleccione una promoción para asociar.');
                            return false;
                        }

                        // Obtener datos de la promoción seleccionada para la confirmación
                        const selectedPromoElement = document.querySelector('[data-promo-id="' + selectedPromotionId + '"]');
                        const descripcionPromo = selectedPromoElement ?
                            selectedPromoElement.querySelector('.promotion-title').textContent.trim().replace('🏷️', '').trim() :
                            'Promoción seleccionada';

                        // Verificar promociones existentes antes de asignar (equivalente al constructor de FrmConfAsignacion)
                        checkExistingPromotionsAndConfirm(numeroServicio, tipoCliente, selectedPromotionId, descripcionPromo);

                        return false;
                    }

                    /**
                     * Verifica promociones existentes y muestra modal de confirmación
                     * Equivalente a la funcionalidad del constructor de FrmConfAsignacion en C#
                     */
                    function checkExistingPromotionsAndConfirm(numeroServicio, tipoCliente, promotionId, descripcionPromo) {
                        // Mostrar loading
                        const assignBtn = document.getElementById('assignBtn');
                        const originalText = assignBtn.innerHTML;
                        assignBtn.innerHTML = '<div class="spinner"></div> Verificando...';
                        assignBtn.disabled = true;

                        // Llamar al endpoint para verificar promociones existentes
                        const params = new URLSearchParams({
                            action: 'checkExistingPromotions',
                            suscriptor: numeroServicio,
                            tipoPromo: tipoCliente, // 'I' para Individual, 'D' para Departamento
                            inPromocion: promotionId,
                            descripcionPromo: descripcionPromo
                        });

                        fetch('LoadProductAssociations?' + params.toString(), {
                            method: 'GET',
                            headers: {
                                'Content-Type': 'application/json'
                            }
                        })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Error en la respuesta del servidor');
                                }
                                return response.json();
                            })
                            .then(data => {
                                // Restaurar el botón
                                assignBtn.innerHTML = originalText;
                                assignBtn.disabled = false;

                                if (data.promocionYaExiste) {
                                    // Mostrar mensaje de error si la promoción ya existe
                                    alert(data.mensajeError);
                                } else {
                                    // Mostrar modal de confirmación con el mensaje equivalente al de C#
                                    showConfirmationModal(data, numeroServicio, tipoCliente, promotionId);
                                }
                            })
                            .catch(error => {
                                console.error('Error verificando promociones existentes:', error);
                                assignBtn.innerHTML = originalText;
                                assignBtn.disabled = false;
                                showErrorModal('Error al verificar promociones existentes: ' + error.message);
                            });
                    }

                    /**
                     * Muestra el modal de confirmación equivalente a FrmConfAsignacion
                     */
                    function showConfirmationModal(data, numeroServicio, tipoCliente, promotionId) {
                        // Crear modal dinámicamente (equivalente a la ventana de confirmación del C#)
                        const modal = document.createElement('div');
                        modal.className = 'confirmation-modal-overlay';
                        modal.innerHTML =
                            '<div class="confirmation-modal">' +
                            '<div class="confirmation-header">' +
                            '<h3><i class="fas fa-exclamation-triangle"></i> Confirmación de Asignación</h3>' +
                            '</div>' +
                            '<div class="confirmation-body">' +
                            '<p class="confirmation-message">' + data.mensajeConfirmacion.replace(/\\n/g, '<br>') + '</p>' +
                            '</div>' +
                            '<div class="confirmation-actions">' +
                            '<button type="button" class="btn btn-primary" onclick="confirmAssignment(\'' + numeroServicio + '\', \'' + tipoCliente + '\', \'' + promotionId + '\', \'' + data.promocionRegistrado + '\', \'' + data.inPromocion + '\', \'' + data.suscriptor + '\')">' +
                            '<i class="fas fa-check"></i> Aceptar' +
                            '</button>' +
                            '<button type="button" class="btn btn-secondary" onclick="cancelConfirmation()">' +
                            '<i class="fas fa-times"></i> Cancelar' +
                            '</button>' +
                            '</div>' +
                            '</div>';

                        document.body.appendChild(modal);

                        // Almacenar datos adicionales para la asignación
                        window.confirmationData = {
                            departamentoPromo: data.departamentoPromo || 0,
                            localidadPromo: data.localidadPromo || 0,
                            categoriaPromo: data.categoriaPromo || 0
                        };
                    }

                    /**
                     * Ejecuta la asignación después de la confirmación
                     * Equivalente al btnAceptar_Click del código C#
                     */
                    function confirmAssignment(numeroServicio, tipoCliente, promotionId, promocionRegistrado, inPromocion, suscriptor) {
                        // Remover modal
                        const modal = document.querySelector('.confirmation-modal-overlay');
                        if (modal) {
                            modal.remove();
                        }

                        // Mostrar loading en el botón
                        const assignBtn = document.getElementById('assignBtn');
                        const originalText = assignBtn.innerHTML;
                        assignBtn.innerHTML = '<div class="spinner"></div> Asignando...';
                        assignBtn.disabled = true;

                        // Preparar datos para la asignación
                        const formData = new URLSearchParams({
                            action: 'assignPromotion',
                            suscriptor: numeroServicio,
                            tipoPromo: tipoCliente,
                            inPromocion: promotionId,
                            promocionRegistrado: promocionRegistrado,
                            departamentoPromo: window.confirmationData?.departamentoPromo || 0,
                            localidadPromo: window.confirmationData?.localidadPromo || 0,
                            categoriaPromo: window.confirmationData?.categoriaPromo || 0
                        });

                        // Realizar la asignación (equivalente al método asignarPromocion del C#)
                        fetch('LoadProductAssociations', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: formData
                        })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Error en la respuesta del servidor');
                                }
                                return response.json();
                            })
                            .then(data => {
                                if (data.success) {
                                    // Mostrar mensaje de éxito (equivalente al MessageBox.Show del C#)
                                    showSuccessModal(data.message);

                                    // Reset form
                                    document.querySelector('.association-form').reset();
                                    document.getElementById('serviceInfo').style.display = 'none';
                                    document.getElementById('promotionsList').innerHTML = '<div class="no-promotions">' +
                                        '<i class="fas fa-search"></i>' +
                                        '<p>Busque un servicio para ver las promociones disponibles</p>' +
                                        '</div>';
                                    selectedPromotionId = null;

                                    // Reset button
                                    assignBtn.innerHTML = originalText;
                                    assignBtn.disabled = true;
                                } else {
                                    throw new Error(data.message || 'Error en la asignación');
                                }
                            })
                            .catch(error => {
                                console.error('Error asignando promoción:', error);
                                assignBtn.innerHTML = originalText;
                                assignBtn.disabled = false;
                                showErrorModal('Error al asignar promoción: ' + error.message);
                            });
                    }

                    /**
                     * Cancela la confirmación
                     * Equivalente al btnCancelar_Click del código C#
                     */
                    function cancelConfirmation() {
                        const modal = document.querySelector('.confirmation-modal-overlay');
                        if (modal) {
                            modal.remove();
                        }
                    }

                    function cancelAssociation() {
                        if (confirm('¿Está seguro que desea cancelar la asociación? Se perderán todos los datos ingresados.')) {
                            // Reset form
                            document.querySelector('.association-form').reset();
                            document.getElementById('serviceInfo').style.display = 'none';
                            document.getElementById('promotionsList').innerHTML = '<div class="no-promotions">' +
                                '<i class="fas fa-search"></i>' +
                                '<p>Busque un servicio para ver las promociones disponibles</p>' +
                                '</div>';
                            selectedPromotionId = null;
                            document.getElementById('assignBtn').disabled = true;
                        }
                    }

                    // Promotion Management Functions

                    /**
                     * Carga los departamentos desde la base de datos
                     */
                    function loadDepartamentos() {
                        const departamentoSelect = document.getElementById('departamento');

                        // Mostrar loading en el select
                        departamentoSelect.innerHTML = '<option value="">Cargando departamentos...</option>';
                        departamentoSelect.disabled = true;

                        // Realizar llamada AJAX
                        fetch('<%= request.getContextPath() %>/LoadDepartamentos')
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Error al cargar departamentos: ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                if (data.success) {
                                    // Limpiar el select
                                    departamentoSelect.innerHTML = '<option value="">Seleccione Departamento</option>';

                                    // Ordenar departamentos por código (ID) de menor a mayor
                                    data.departamentos.sort((a, b) => {
                                        const codigoA = parseInt(a.codigo) || 0;
                                        const codigoB = parseInt(b.codigo) || 0;
                                        return codigoA - codigoB;
                                    });

                                    // Agregar los departamentos con formato "ID - Descripción"
                                    data.departamentos.forEach(dept => {
                                        const option = document.createElement('option');
                                        option.value = dept.codigo;
                                        option.textContent = dept.codigo + ' - ' + dept.descripcion;
                                        departamentoSelect.appendChild(option);
                                    });

                                    departamentoSelect.disabled = false;
                                    console.log('Departamentos cargados exitosamente:', data.departamentos.length);
                                } else {
                                    throw new Error(data.error || 'Error desconocido al cargar departamentos');
                                }
                            })
                            .catch(error => {
                                console.error('Error cargando departamentos:', error);
                                departamentoSelect.innerHTML = '<option value="">Error al cargar departamentos</option>';
                                departamentoSelect.disabled = false;

                                // Mostrar mensaje de error al usuario
                                alert('Error al cargar departamentos: ' + error.message);
                            });
                    }

                    /**
                     * Carga las categorías desde la base de datos
                     */
                    function loadCategorias() {
                        const mercadoSelect = document.getElementById('mercado');

                        // Mostrar loading en el select
                        mercadoSelect.innerHTML = '<option value="">Cargando categorías...</option>';
                        mercadoSelect.disabled = true;

                        // Realizar llamada AJAX
                        fetch('<%= request.getContextPath() %>/LoadCategorias')
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Error al cargar categorías: ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                if (data.success) {
                                    // Limpiar el select
                                    mercadoSelect.innerHTML = '<option value="">Selección Categoría</option>';

                                    // Ordenar categorías por código (ID) de menor a mayor
                                    data.categorias.sort((a, b) => {
                                        const codigoA = parseInt(a.codigo) || 0;
                                        const codigoB = parseInt(b.codigo) || 0;
                                        return codigoA - codigoB;
                                    });

                                    // Agregar las categorías con formato "ID - Descripción"
                                    data.categorias.forEach(categoria => {
                                        const option = document.createElement('option');
                                        option.value = categoria.codigo;
                                        option.textContent = categoria.codigo + ' - ' + categoria.descripcion;
                                        // Agregar información adicional como data attributes si es necesario
                                        option.setAttribute('data-evalco', categoria.evalco);
                                        mercadoSelect.appendChild(option);
                                    });

                                    mercadoSelect.disabled = false;
                                    console.log('Categorías cargadas exitosamente:', data.categorias.length);
                                } else {
                                    throw new Error(data.error || 'Error desconocido al cargar categorías');
                                }
                            })
                            .catch(error => {
                                console.error('Error cargando categorías:', error);
                                mercadoSelect.innerHTML = '<option value="">Error al cargar categorías</option>';
                                mercadoSelect.disabled = false;

                                // Mostrar mensaje de error al usuario
                                alert('Error al cargar categorías: ' + error.message);
                            });
                    }

                    /**
                     * Carga las subcategorías filtradas por la categoría seleccionada
                     */
                    function loadSubcategorias() {
                        const mercadoSelect = document.getElementById('mercado');
                        const subcategoriaSelect = document.getElementById('subcategoria');
                        const categoriaId = mercadoSelect.value;

                        // Limpiar el select de subcategorías
                        subcategoriaSelect.innerHTML = '<option value="">Selección Subcategoría</option>';

                        // Si no hay categoría seleccionada, deshabilitar subcategorías
                        if (categoriaId === '') {
                            subcategoriaSelect.disabled = true;
                            return;
                        }

                        // Mostrar loading en el select
                        subcategoriaSelect.innerHTML = '<option value="">Cargando subcategorías...</option>';
                        subcategoriaSelect.disabled = true;

                        // Realizar llamada AJAX para cargar subcategorías de la categoría seleccionada
                        fetch('<%= request.getContextPath() %>/LoadSubcategorias?categoriaId=' + encodeURIComponent(categoriaId))
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Error al cargar subcategorías: ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                if (data.success) {
                                    // Limpiar el select
                                    subcategoriaSelect.innerHTML = '<option value="">Selección Subcategoría</option>';

                                    // Ordenar subcategorías por código (ID) de menor a mayor
                                    data.subcategorias.sort((a, b) => {
                                        const codigoA = parseInt(a.codigo) || 0;
                                        const codigoB = parseInt(b.codigo) || 0;
                                        return codigoA - codigoB;
                                    });

                                    // Agregar las subcategorías con formato "ID - Descripción"
                                    data.subcategorias.forEach(subcategoria => {
                                        const option = document.createElement('option');
                                        option.value = subcategoria.codigo;
                                        option.textContent = subcategoria.codigo + ' - ' + subcategoria.descripcion;
                                        // Agregar información adicional como data attributes si es necesario
                                        option.setAttribute('data-categoria', subcategoria.categoria);
                                        subcategoriaSelect.appendChild(option);
                                    });

                                    subcategoriaSelect.disabled = false;
                                    console.log('Subcategorías cargadas exitosamente para categoría ' + categoriaId + ':', data.subcategorias.length);
                                } else {
                                    throw new Error(data.error || 'Error desconocido al cargar subcategorías');
                                }
                            })
                            .catch(error => {
                                console.error('Error cargando subcategorías:', error);
                                subcategoriaSelect.innerHTML = '<option value="">Error al cargar subcategorías</option>';
                                subcategoriaSelect.disabled = false;

                                // Mostrar mensaje de error al usuario
                                alert('Error al cargar subcategorías: ' + error.message);
                            });
                    }

                    // Variables globales para el buscador de planes
                    let planesData = [];
                    let searchTimeout = null;
                    let selectedPlanIndex = -1;

                    /**
                     * Busca planes en tiempo real mientras el usuario escribe
                     */
                    function buscarPlanes(busqueda) {
                        // Limpiar timeout anterior
                        if (searchTimeout) {
                            clearTimeout(searchTimeout);
                        }

                        // Establecer nuevo timeout para evitar demasiadas llamadas
                        searchTimeout = setTimeout(() => {
                            realizarBusquedaPlanes(busqueda);
                        }, 300);
                    }

                    /**
                     * Realiza la búsqueda de planes en el servidor
                     */
                    function realizarBusquedaPlanes(busqueda) {
                        const resultsContainer = document.getElementById('planSearchResults');

                        // Mostrar el contenedor de resultados
                        resultsContainer.style.display = 'block';
                        resultsContainer.innerHTML = '<div class="loading-message">Buscando planes...</div>';

                        // Construir URL con parámetro de búsqueda
                        let url = '<%= request.getContextPath() %>/LoadPlanes';
                        if (busqueda && busqueda.trim().length > 0) {
                            url += '?busqueda=' + encodeURIComponent(busqueda.trim());
                        }

                        fetch(url)
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Error al buscar planes: ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                if (data.success) {
                                    planesData = data.planes;
                                    mostrarResultadosPlanes(data.planes);
                                } else {
                                    throw new Error(data.error || 'Error desconocido al buscar planes');
                                }
                            })
                            .catch(error => {
                                console.error('Error buscando planes:', error);
                                resultsContainer.innerHTML = '<div class="no-results-message">Error al buscar planes: ' + error.message + '</div>';
                            });
                    }

                    /**
                     * Muestra los resultados de la búsqueda de planes
                     */
                    function mostrarResultadosPlanes(planes) {
                        const resultsContainer = document.getElementById('planSearchResults');
                        selectedPlanIndex = -1;

                        if (planes.length === 0) {
                            resultsContainer.innerHTML = '<div class="no-results-message">No se encontraron planes</div>';
                            return;
                        }

                        // Ordenar planes por código (ID) de menor a mayor
                        planes.sort((a, b) => {
                            const codigoA = parseInt(a.codigo) || 0;
                            const codigoB = parseInt(b.codigo) || 0;
                            return codigoA - codigoB;
                        });

                        let html = '';
                        planes.forEach((plan, index) => {
                            html += '<div class="plan-search-item" data-index="' + index + '" onclick="seleccionarPlan(' + index + ')">' +
                                '<div class="plan-codigo">' + plan.codigo + '</div>' +
                                '<div class="plan-descripcion">' + plan.descripcion + '</div>' +
                                '</div>';
                        });

                        resultsContainer.innerHTML = html;
                    }

                    /**
                     * Selecciona un plan de la lista
                     */
                    function seleccionarPlan(index) {
                        if (index >= 0 && index < planesData.length) {
                            const plan = planesData[index];

                            // Establecer valores en los campos
                            document.getElementById('tipoPlanSearch').value = plan.descripcion;
                            document.getElementById('tipoPlan').value = plan.codigo;

                            // Ocultar resultados
                            document.getElementById('planSearchResults').style.display = 'none';

                            console.log('Plan seleccionado:', plan);
                        }
                    }

                    /**
                     * Muestra la lista de planes cuando se hace foco en el input
                     */
                    function mostrarListaPlanes() {
                        const searchInput = document.getElementById('tipoPlanSearch');
                        const busqueda = searchInput.value;

                        // Si no hay búsqueda, cargar todos los planes
                        if (!busqueda || busqueda.trim().length === 0) {
                            realizarBusquedaPlanes('');
                        } else {
                            // Si ya hay una búsqueda, mostrar los resultados existentes
                            const resultsContainer = document.getElementById('planSearchResults');
                            if (resultsContainer.innerHTML.trim() !== '') {
                                resultsContainer.style.display = 'block';
                            }
                        }
                    }

                    // Agregar event listeners para navegación con teclado y clic fuera
                    document.addEventListener('DOMContentLoaded', function () {
                        // Cargar tipos de servicio al inicializar la página
                        loadTiposServicio().catch(error => {
                            console.error('Error al cargar tipos de servicio iniciales:', error);
                        });

                        // Actualizar el estado del botón "Agregar Detalle" al cargar la página
                        updateAddDetailButtonState();

                        const searchInput = document.getElementById('tipoPlanSearch');
                        const resultsContainer = document.getElementById('planSearchResults');

                        // Navegación con teclado
                        searchInput.addEventListener('keydown', function (e) {
                            const items = resultsContainer.querySelectorAll('.plan-search-item');

                            if (e.key === 'ArrowDown') {
                                e.preventDefault();
                                selectedPlanIndex = Math.min(selectedPlanIndex + 1, items.length - 1);
                                actualizarSeleccionVisual(items);
                            } else if (e.key === 'ArrowUp') {
                                e.preventDefault();
                                selectedPlanIndex = Math.max(selectedPlanIndex - 1, -1);
                                actualizarSeleccionVisual(items);
                            } else if (e.key === 'Enter') {
                                e.preventDefault();
                                if (selectedPlanIndex >= 0) {
                                    seleccionarPlan(selectedPlanIndex);
                                }
                            } else if (e.key === 'Escape') {
                                resultsContainer.style.display = 'none';
                                selectedPlanIndex = -1;
                            }
                        });

                        // Ocultar resultados al hacer clic fuera
                        document.addEventListener('click', function (e) {
                            if (!searchInput.contains(e.target) && !resultsContainer.contains(e.target)) {
                                resultsContainer.style.display = 'none';
                            }
                        });
                    });

                    /**
                     * Actualiza la selección visual en la lista de planes
                     */
                    function actualizarSeleccionVisual(items) {
                        items.forEach((item, index) => {
                            if (index === selectedPlanIndex) {
                                item.classList.add('selected');
                            } else {
                                item.classList.remove('selected');
                            }
                        });
                    }

                    function loadLocalidades() {
                        const departamento = document.getElementById('departamento').value;
                        const localidadSelect = document.getElementById('localidad');

                        // Clear current options
                        localidadSelect.innerHTML = '<option value="">Selección Localidad</option>';

                        if (departamento === '') {
                            localidadSelect.disabled = false;
                            return;
                        }

                        // Mostrar loading en el select
                        localidadSelect.innerHTML = '<option value="">Cargando localidades...</option>';
                        localidadSelect.disabled = true;

                        // Realizar llamada AJAX para cargar localidades del departamento seleccionado
                        fetch('<%= request.getContextPath() %>/LoadLocalidades?departamento=' + encodeURIComponent(departamento))
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Error al cargar localidades: ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                if (data.success) {
                                    // Limpiar el select
                                    localidadSelect.innerHTML = '<option value="">Selección Localidad</option>';

                                    // Ordenar localidades por código (ID) de menor a mayor
                                    data.localidades.sort((a, b) => {
                                        const codigoA = parseInt(a.locacodi) || 0;
                                        const codigoB = parseInt(b.locacodi) || 0;
                                        return codigoA - codigoB;
                                    });

                                    // Agregar las localidades con formato "ID - Descripción"
                                    data.localidades.forEach(localidad => {
                                        const option = document.createElement('option');
                                        option.value = localidad.locacodi;
                                        option.textContent = localidad.locacodi + ' - ' + localidad.locanomb;
                                        // Agregar información adicional como data attributes si es necesario
                                        option.setAttribute('data-departamento', localidad.locadepa);
                                        localidadSelect.appendChild(option);
                                    });

                                    localidadSelect.disabled = false;
                                    console.log('Localidades cargadas exitosamente para departamento ' + departamento + ':', data.localidades.length);
                                } else {
                                    throw new Error(data.error || 'Error desconocido al cargar localidades');
                                }
                            })
                            .catch(error => {
                                console.error('Error cargando localidades:', error);
                                localidadSelect.innerHTML = '<option value="">Error al cargar localidades</option>';
                                localidadSelect.disabled = false;

                                // Mostrar mensaje de error al usuario
                                alert('Error al cargar localidades: ' + error.message);
                            });
                    }

                    let detailRowCounter = 0;
                    let tiposServicioData = [];

                    /**
                     * Carga los tipos de servicio desde la base de datos
                     */
                    function loadTiposServicio() {
                        return fetch('<%= request.getContextPath() %>/LoadTiposServicio')
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Error al cargar tipos de servicio: ' + response.statusText);
                                }
                                return response.json();
                            })
                            .then(data => {
                                if (data.success) {
                                    tiposServicioData = data.tiposServicio;
                                    console.log('Tipos de servicio cargados:', tiposServicioData.length);
                                    return data.tiposServicio;
                                } else {
                                    throw new Error(data.error || 'Error desconocido al cargar tipos de servicio');
                                }
                            })
                            .catch(error => {
                                console.error('Error cargando tipos de servicio:', error);
                                throw error;
                            });
                    }

                    /**
                     * Genera las opciones HTML para el select de tipo producto
                     */
                    function generarOpcionesTipoProducto() {
                        let opciones = '<option value="">Seleccione</option>';

                        // Ordenar tipos de servicio por código (ID) de menor a mayor
                        const tiposOrdenados = [...tiposServicioData].sort((a, b) => {
                            const codigoA = parseInt(a.codigo) || 0;
                            const codigoB = parseInt(b.codigo) || 0;
                            return codigoA - codigoB;
                        });

                        tiposOrdenados.forEach(tipo => {
                            opciones += '<option value="' + tipo.codigo + '">' + tipo.codigo + ' - ' + tipo.descripcion + '</option>';
                        });
                        return opciones;
                    }

                    /**
                     * Actualiza el estado del botón "Agregar Detalle" según la cantidad de filas existentes
                     */
                    function updateAddDetailButtonState() {
                        const tbody = document.getElementById('promotionDetailsBody');
                        const existingRows = tbody.querySelectorAll('tr');
                        const addButton = document.querySelector('button[onclick="addPromotionDetail()"]');

                        if (addButton) {
                            if (existingRows.length > 0) {
                                addButton.disabled = true;
                                addButton.innerHTML = '<i class="fas fa-check"></i> Detalle Agregado';
                                addButton.title = 'Solo se permite un detalle por promoción';
                            } else {
                                addButton.disabled = false;
                                addButton.innerHTML = '<i class="fas fa-plus"></i> Agregar Detalle';
                                addButton.title = 'Agregar detalle de promoción';
                            }
                        }
                    }

                    function addPromotionDetail() {
                        // Verificar si ya existe un detalle
                        const tbody = document.getElementById('promotionDetailsBody');
                        const existingRows = tbody.querySelectorAll('tr');

                        if (existingRows.length > 0) {
                            alert('Solo se permite agregar un detalle de promoción. Si necesita modificar el detalle existente, puede editarlo o eliminarlo.');
                            return;
                        }

                        detailRowCounter++;

                        const row = document.createElement('tr');
                        row.id = 'detail-row-' + detailRowCounter;

                        // Crear la fila con el select de tipo producto inicialmente vacío
                        row.innerHTML = '<td>' +
                            '<input type="date" class="details-input" name="fechaInicio_' + detailRowCounter + '">' +
                            '</td>' +
                            '<td>' +
                            '<input type="date" class="details-input" name="fechaFinalizacion_' + detailRowCounter + '">' +
                            '</td>' +
                            '<td>' +
                            '<input type="number" class="details-input" name="tiempoAplicacion_' + detailRowCounter + '" placeholder="Meses" min="1">' +
                            '</td>' +
                            '<td>' +
                            '<input type="number" class="details-input" name="porcentajeDesc_' + detailRowCounter + '" placeholder="%" min="0" max="100" step="0.01">' +
                            '</td>' +
                            '<td>' +
                            '<input type="number" class="details-input" name="valorDesc_' + detailRowCounter + '" placeholder="Valor" min="0" step="0.01">' +
                            '</td>' +
                            '<td>' +
                            '<select class="details-select" name="tipoProducto_' + detailRowCounter + '">' +
                            '<option value="">Cargando tipos de producto...</option>' +
                            '</select>' +
                            '</td>' +
                            '<td class="text-center">' +
                            '<input type="checkbox" class="details-checkbox" name="retencion_' + detailRowCounter + '">' +
                            '</td>' +
                            '<td class="text-center">' +
                            '<input type="checkbox" class="details-checkbox" name="activo_' + detailRowCounter + '" checked>' +
                            '</td>' +
                            '<td>' +
                            '<input type="number" class="details-input" name="index_' + detailRowCounter + '" placeholder="Index" min="1">' +
                            '</td>' +
                            '<td>' +
                            '<input type="number" class="details-input" name="confIndex_' + detailRowCounter + '" placeholder="Conf" min="1">' +
                            '</td>' +
                            '<td>' +
                            '<div class="action-buttons">' +
                            '<button type="button" class="btn-action btn-primary" onclick="saveDetailRow(' + detailRowCounter + ')" title="Guardar Detalle">' +
                            '<i class="fas fa-save"></i>' +
                            '</button>' +
                            '<button type="button" class="btn-action btn-edit" onclick="editDetailRow(' + detailRowCounter + ')" title="Editar">' +
                            '<i class="fas fa-edit"></i>' +
                            '</button>' +
                            '<button type="button" class="btn-action btn-delete" onclick="deleteDetailRow(' + detailRowCounter + ')" title="Eliminar">' +
                            '<i class="fas fa-trash"></i>' +
                            '</button>' +
                            '</div>' +
                            '</td>';

                        tbody.appendChild(row);

                        // Cargar tipos de servicio y llenar el select
                        const currentRowCounter = detailRowCounter; // Capturar el valor actual
                        const tipoProductoSelect = row.querySelector('select[name="tipoProducto_' + currentRowCounter + '"]');

                        // Si ya tenemos los datos cargados, usarlos directamente
                        if (tiposServicioData.length > 0) {
                            tipoProductoSelect.innerHTML = generarOpcionesTipoProducto();
                        } else {
                            // Cargar los datos por primera vez
                            loadTiposServicio()
                                .then(() => {
                                    tipoProductoSelect.innerHTML = generarOpcionesTipoProducto();
                                })
                                .catch(error => {
                                    tipoProductoSelect.innerHTML = '<option value="">Error al cargar tipos de producto</option>';
                                    console.error('Error al cargar tipos de servicio para la fila:', error);
                                });
                        }

                        // Actualizar el estado del botón "Agregar Detalle"
                        updateAddDetailButtonState();
                    }

                    function editDetailRow(rowId) {
                        const row = document.getElementById('detail-row-' + rowId);
                        const inputs = row.querySelectorAll('input, select');

                        inputs.forEach(input => {
                            if (input.type === 'checkbox') {
                                input.disabled = !input.disabled;
                            } else {
                                input.readOnly = !input.readOnly;
                            }
                        });

                        const editBtn = row.querySelector('.btn-edit');
                        if (inputs[0].readOnly) {
                            editBtn.innerHTML = '<i class="fas fa-edit"></i>';
                            editBtn.title = 'Editar';
                        } else {
                            editBtn.innerHTML = '<i class="fas fa-save"></i>';
                            editBtn.title = 'Guardar';
                        }
                    }

                    function deleteDetailRow(rowId) {
                        if (confirm('¿Está seguro que desea eliminar este detalle de promoción?')) {
                            const row = document.getElementById('detail-row-' + rowId);
                            row.remove();

                            // Actualizar el estado del botón "Agregar Detalle"
                            updateAddDetailButtonState();
                        }
                    }

                    /**
                     * Guarda un detalle específico de promoción
                     */
                    function saveDetailRow(rowId) {
                        const row = document.getElementById('detail-row-' + rowId);
                        if (!row) {
                            showErrorModal('No se pudo encontrar la fila del detalle.');
                            return;
                        }

                        // Capturar los valores de la fila
                        const fechaInicio = row.querySelector('input[name="fechaInicio_' + rowId + '"]').value;
                        const fechaFinalizacion = row.querySelector('input[name="fechaFinalizacion_' + rowId + '"]').value;
                        const tiempoAplicacion = row.querySelector('input[name="tiempoAplicacion_' + rowId + '"]').value;
                        const porcentajeDesc = row.querySelector('input[name="porcentajeDesc_' + rowId + '"]').value;
                        const valorDesc = row.querySelector('input[name="valorDesc_' + rowId + '"]').value;
                        const tipoProducto = row.querySelector('select[name="tipoProducto_' + rowId + '"]').value;
                        const retencion = row.querySelector('input[name="retencion_' + rowId + '"]').checked;
                        const activo = row.querySelector('input[name="activo_' + rowId + '"]').checked;
                        const indexValue = row.querySelector('input[name="index_' + rowId + '"]').value;
                        const confIndex = row.querySelector('input[name="confIndex_' + rowId + '"]').value;

                        // Obtener información de la promoción principal
                        const codigoExterno = document.getElementById('codigoExterno').value;

                        // Debug: mostrar valores capturados
                        console.log('=== DATOS CAPTURADOS DEL DETALLE ===');
                        console.log('fechaInicio:', fechaInicio);
                        console.log('fechaFinalizacion:', fechaFinalizacion);
                        console.log('tiempoAplicacion:', tiempoAplicacion);
                        console.log('porcentajeDesc:', porcentajeDesc);
                        console.log('valorDesc:', valorDesc);
                        console.log('tipoProducto:', tipoProducto);
                        console.log('retencion:', retencion);
                        console.log('activo:', activo);
                        console.log('indexValue:', indexValue);
                        console.log('confIndex:', confIndex);
                        console.log('codigoExterno:', codigoExterno);

                        // Validaciones básicas
                        if (!fechaInicio) {
                            showErrorModal('La fecha de inicio es obligatoria.');
                            return;
                        }

                        if (!fechaFinalizacion) {
                            showErrorModal('La fecha de finalización es obligatoria.');
                            return;
                        }

                        if (!tiempoAplicacion) {
                            showErrorModal('El tiempo de aplicación es obligatorio.');
                            return;
                        }

                        if (!codigoExterno) {
                            showErrorModal('Debe crear primero la promoción principal antes de agregar detalles.');
                            return;
                        }

                        // Obtener el botón de guardar para mostrar estado de carga
                        const saveButton = row.querySelector('.btn-primary');
                        const originalText = saveButton.innerHTML;
                        saveButton.innerHTML = '<div class="spinner"></div>';
                        saveButton.disabled = true;

                        // Preparar datos para enviar
                        const formData = new URLSearchParams();
                        formData.append('cocotico', '1'); // Por ahora usar un valor fijo, debería venir del ID de la promoción
                        formData.append('cococlco', codigoExterno);
                        formData.append('cocofein', fechaInicio);
                        formData.append('cocfefi', fechaFinalizacion);
                        formData.append('cocotiap', tiempoAplicacion);
                        formData.append('porcentaje', porcentajeDesc || '');
                        formData.append('valor', valorDesc || '');
                        formData.append('activo', activo ? 'true' : 'false');
                        formData.append('indexado', indexValue || '');
                        formData.append('planes', tipoProducto || ''); // Mapear tipo producto a planes
                        formData.append('velocidades', ''); // Por ahora vacío, no tenemos este campo en la UI

                        // Debug: mostrar lo que se está enviando
                        console.log('=== DATOS ENVIADOS AL SERVIDOR ===');
                        for (let [key, value] of formData.entries()) {
                            console.log(`${key}: '${value}'`);
                        }

                        // Llamar al controlador para guardar el detalle
                        fetch('<%= request.getContextPath() %>/GuardarDetallePromocion', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: formData
                        })
                            .then(response => response.json())
                            .then(data => {
                                // Restaurar botón
                                saveButton.innerHTML = originalText;
                                saveButton.disabled = false;

                                if (data.success) {
                                    console.log('Detalle de promoción guardado exitosamente:', data.message);
                                    showSuccessModal('¡Detalle de promoción guardado exitosamente!');

                                    // Deshabilitar edición de la fila guardada
                                    const inputs = row.querySelectorAll('input, select');
                                    inputs.forEach(input => {
                                        input.readOnly = true;
                                        if (input.type === 'checkbox') {
                                            input.disabled = true;
                                        }
                                    });

                                    // Cambiar el botón de guardar por uno de "Guardado"
                                    saveButton.innerHTML = '<i class="fas fa-check"></i>';
                                    saveButton.title = 'Detalle guardado';
                                    saveButton.disabled = true;
                                    saveButton.style.background = '#10b981'; // Color verde

                                } else {
                                    showErrorModal('Error al guardar el detalle: ' + (data.error || 'Error desconocido'));
                                    console.error('Error:', data.error);
                                }
                            })
                            .catch(error => {
                                // Restaurar botón
                                saveButton.innerHTML = originalText;
                                saveButton.disabled = false;

                                console.error('Error al comunicarse con el servidor:', error);
                                showErrorModal('Error al comunicarse con el servidor. Por favor, intente nuevamente.');
                            });
                    }

                    let isSubmitting = false; // Flag para prevenir múltiples submits

                    function submitPromotionForm(event) {
                        event.preventDefault();
                        event.stopPropagation(); // Evitar propagación del evento

                        // Protección contra múltiples submits
                        if (isSubmitting) {
                            console.log('⚠️ Ya se está procesando un submit, ignorando...');
                            return false;
                        }

                        isSubmitting = true;

                        // Debug inicial
                        console.log('=== SUBMIT PROMOTION FORM ===');
                        console.log('Event:', event);
                        console.log('Form element:', event.target);

                        // Múltiples estrategias para encontrar los elementos
                        const form = event.target;

                        // Estrategia 1: getElementById
                        let descripcionInput = document.getElementById('descripcionPromocion');
                        let codigoExternoInput = document.getElementById('codigoExterno');

                        // Estrategia 2: buscar en el formulario específico
                        if (!descripcionInput) {
                            descripcionInput = form.querySelector('#descripcionPromocion') || form.querySelector('[name="descripcionPromocion"]');
                        }
                        if (!codigoExternoInput) {
                            codigoExternoInput = form.querySelector('#codigoExterno') || form.querySelector('[name="codigoExterno"]');
                        }

                        // Estrategia 3: buscar en toda la página por nombre
                        if (!descripcionInput) {
                            descripcionInput = document.querySelector('input[name="descripcionPromocion"]');
                        }
                        if (!codigoExternoInput) {
                            codigoExternoInput = document.querySelector('input[name="codigoExterno"]');
                        }

                        const departamentoInput = document.getElementById('departamento');
                        const localidadInput = document.getElementById('localidad');
                        const tipoPlanInput = document.getElementById('tipoPlan');
                        const periodicidadInput = document.getElementById('periodicidad');
                        const categoriaInput = document.getElementById('mercado');
                        const subcategoriaInput = document.getElementById('subcategoria');

                        // Debug elementos encontrados
                        console.log('=== ELEMENTOS ENCONTRADOS ===');
                        console.log('descripcionInput element:', descripcionInput);
                        console.log('descripcionInput exists:', !!descripcionInput);
                        console.log('codigoExternoInput element:', codigoExternoInput);
                        console.log('codigoExternoInput exists:', !!codigoExternoInput);

                        // Capturar valores de forma más robusta
                        let descripcion = '';
                        let codigoExterno = '';

                        if (descripcionInput) {
                            descripcion = descripcionInput.value ? descripcionInput.value.trim() : '';
                            console.log('Descripción raw value:', descripcionInput.value);
                        }

                        if (codigoExternoInput) {
                            codigoExterno = codigoExternoInput.value ? codigoExternoInput.value.trim() : '';
                            console.log('Código externo raw value:', codigoExternoInput.value);
                        }

                        const departamento = departamentoInput ? departamentoInput.value : '';
                        const localidad = localidadInput ? localidadInput.value : '';
                        const tipoPlan = tipoPlanInput ? tipoPlanInput.value : '';
                        const periodicidadFull = periodicidadInput ? periodicidadInput.value : '';
                        const categoria = categoriaInput ? categoriaInput.value : '';
                        const subcategoria = subcategoriaInput ? subcategoriaInput.value : '';

                        // Debug para verificar los valores
                        console.log('=== VALORES CAPTURADOS ===');
                        console.log('- descripcion:', "'" + descripcion + "'");
                        console.log('- descripcion length:', descripcion.length);
                        console.log('- codigoExterno:', "'" + codigoExterno + "'");
                        console.log('- departamento:', "'" + departamento + "'");
                        console.log('- periodicidad:', "'" + periodicidadFull + "'");

                        executeFormSubmission(descripcion, codigoExterno, departamento, localidad, tipoPlan, periodicidadFull, categoria, subcategoria, descripcionInput, codigoExternoInput, departamentoInput, periodicidadInput, event);
                    }

                    function executeFormSubmission(descripcion, codigoExterno, departamento, localidad, tipoPlan, periodicidadFull, categoria, subcategoria, descripcionInput, codigoExternoInput, departamentoInput, periodicidadInput, event) {

                        // Debug adicional para la validación
                        console.log('=== DEBUGGING VALIDACIÓN ===');
                        console.log('descripcion param:', descripcion);
                        console.log('descripcion type:', typeof descripcion);
                        console.log('descripcion === "":', descripcion === '');
                        console.log('descripcion.length:', descripcion.length);
                        console.log('descripcion charCodes:', [...descripcion].map(c => c.charCodeAt(0)));

                        // Validaciones
                        if (descripcion === '') {
                            console.log('❌ Error: La descripción es obligatoria');
                            showErrorModal('Por favor, ingrese la descripción de la promoción.');
                            if (descripcionInput) descripcionInput.focus();
                            isSubmitting = false; // Reset flag
                            return false;
                        } else {
                            console.log('✅ Descripción válida:', descripcion);
                        }

                        if (codigoExterno === '') {
                            showErrorModal('Por favor, ingrese el código externo de la promoción.');
                            if (codigoExternoInput) codigoExternoInput.focus();
                            isSubmitting = false; // Reset flag
                            return false;
                        }

                        if (departamento === '') {
                            showErrorModal('Por favor, seleccione un departamento.');
                            if (departamentoInput) departamentoInput.focus();
                            isSubmitting = false; // Reset flag
                            return false;
                        }

                        if (periodicidadFull === '') {
                            showErrorModal('Por favor, seleccione la periodicidad.');
                            if (periodicidadInput) periodicidadInput.focus();
                            isSubmitting = false; // Reset flag
                            return false;
                        }

                        // Convertir periodicidad a formato requerido por el procedimiento
                        let periodicidad = '';
                        if (periodicidadFull === 'MENSUAL') {
                            periodicidad = 'M';
                        } else if (periodicidadFull === 'DIARIA') {
                            periodicidad = 'D';
                        }

                        // Show loading state on save button
                        const saveBtn = event.target.querySelector('button[type="submit"]');
                        const originalText = saveBtn.innerHTML;
                        saveBtn.innerHTML = '<div class="spinner"></div> Guardando...';
                        saveBtn.disabled = true;

                        // Preparar datos para enviar usando URLSearchParams
                        const formData = new URLSearchParams();
                        formData.append('descripcion', descripcion);
                        formData.append('codigoExterno', codigoExterno);
                        formData.append('departamento', departamento);
                        formData.append('localidad', localidad);
                        formData.append('tipoplan', tipoPlan);
                        formData.append('periodicidad', periodicidad);
                        formData.append('categoria', categoria);
                        formData.append('subcategoria', subcategoria);

                        // Debug: mostrar lo que se está enviando
                        console.log('=== DATOS ENVIADOS AL SERVIDOR ===');
                        for (let [key, value] of formData.entries()) {
                            console.log(`${key}: '${value}'`);
                        }

                        // Llamar al controlador para guardar la promoción
                        fetch('<%= request.getContextPath() %>/GuardarPromocion', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: formData
                        })
                            .then(response => response.json())
                            .then(data => {
                                // Reset button
                                saveBtn.innerHTML = originalText;
                                saveBtn.disabled = false;
                                isSubmitting = false; // Reset flag

                                if (data.success) {
                                    console.log('Promoción guardada exitosamente:', data.message);

                                    // Mostrar modal de éxito simple
                                    showSuccessModal('¡Promoción creada exitosamente!');
                                } else {
                                    showErrorModal('Error al crear la promoción: ' + (data.error || 'Error desconocido'));
                                    console.error('Error:', data.error);
                                }
                            })
                            .catch(error => {
                                // Reset button
                                saveBtn.innerHTML = originalText;
                                saveBtn.disabled = false;
                                isSubmitting = false; // Reset flag

                                console.error('Error al comunicarse con el servidor:', error);
                                showErrorModal('Error al comunicarse con el servidor. Por favor, intente nuevamente.');
                            });

                        return false;
                    }



                    // Reports Functions
                    let currentPage = 1;
                    let totalPages = 1;
                    let reportsData = [];

                    function submitReportsForm(event) {
                        event.preventDefault();

                        const usuario = document.getElementById('usuarioReporte').value.trim();
                        const nombreUsuario = document.getElementById('nombreUsuarioReporte').value.trim();
                        const nombrePromocion = document.getElementById('nombrePromocionReporte').value.trim();
                        const vigenciaInicio = document.getElementById('vigenciaInicioReporte').value;
                        const vigenciaFin = document.getElementById('vigenciaFinReporte').value;

                        // Show loading state
                        showReportsLoading(true);

                        // Simulate API call for reports - Replace with actual service call
                        setTimeout(() => {
                            // Mock data
                            const mockReportsData = [
                                {
                                    codigo: 'PROMO001',
                                    nombre: 'Descuento Navidad 2025',
                                    departamento: 'META',
                                    localidad: 'Villavicencio',
                                    mercado: 'RESIDENCIAL',
                                    estrato: '3',
                                    tipoPlan: 'INTERNET'
                                },
                                {
                                    codigo: 'PROMO002',
                                    nombre: 'Upgrade Gratis Año Nuevo',
                                    departamento: 'CUNDINAMARCA',
                                    localidad: 'Bogotá',
                                    mercado: 'COMERCIAL',
                                    estrato: '4',
                                    tipoPlan: 'COMBO'
                                },
                                {
                                    codigo: 'PROMO003',
                                    nombre: 'HBO Max 6 Meses',
                                    departamento: 'ANTIOQUIA',
                                    localidad: 'Medellín',
                                    mercado: 'RESIDENCIAL',
                                    estrato: '5',
                                    tipoPlan: 'TV'
                                },
                                {
                                    codigo: 'PROMO004',
                                    nombre: 'Promoción Estudiantes',
                                    departamento: 'VALLE',
                                    localidad: 'Cali',
                                    mercado: 'RESIDENCIAL',
                                    estrato: '2',
                                    tipoPlan: 'INTERNET'
                                },
                                {
                                    codigo: 'PROMO005',
                                    nombre: 'Descuento Empresarial',
                                    departamento: 'ATLANTICO',
                                    localidad: 'Barranquilla',
                                    mercado: 'EMPRESARIAL',
                                    estrato: '6',
                                    tipoPlan: 'COMBO'
                                }
                            ];

                            reportsData = mockReportsData;
                            displayReportsResults(reportsData);
                            showReportsLoading(false);

                            console.log('Consulta realizada exitosamente. Se encontraron ' + reportsData.length + ' registros.');
                        }, 2000);

                        return false;
                    }

                    function showReportsLoading(show) {
                        const tableBody = document.getElementById('reportsTableBody');
                        const recordsInfo = document.getElementById('recordsInfo');

                        if (show) {
                            tableBody.innerHTML = '<tr>' +
                                '<td colspan="7" class="no-data">' +
                                '<div class="loading-message">' +
                                '<div class="spinner"></div>' +
                                'Generando reporte...' +
                                '</div>' +
                                '</td>' +
                                '</tr>';
                            recordsInfo.textContent = 'Consultando...';
                        }
                    }

                    function displayReportsResults(data) {
                        const tableBody = document.getElementById('reportsTableBody');
                        const recordsInfo = document.getElementById('recordsInfo');

                        if (data.length === 0) {
                            tableBody.innerHTML = '<tr>' +
                                '<td colspan="7" class="no-data">' +
                                '<div class="no-data-message">' +
                                '<i class="fas fa-exclamation-triangle"></i>' +
                                '<p>No se encontraron resultados para los criterios especificados</p>' +
                                '</div>' +
                                '</td>' +
                                '</tr>';
                            recordsInfo.textContent = '0 de 0';
                            return;
                        }

                        // Calculate pagination
                        const itemsPerPage = 10;
                        totalPages = Math.ceil(data.length / itemsPerPage);
                        const startIndex = (currentPage - 1) * itemsPerPage;
                        const endIndex = Math.min(startIndex + itemsPerPage, data.length);
                        const currentData = data.slice(startIndex, endIndex);

                        // Update records info
                        recordsInfo.textContent = startIndex + 1 + ' - ' + endIndex + ' de ' + data.length;

                        // Generate table rows
                        tableBody.innerHTML = currentData.map(item =>
                            '<tr>' +
                            '<td><strong>' + item.codigo + '</strong></td>' +
                            '<td>' + item.nombre + '</td>' +
                            '<td>' + item.departamento + '</td>' +
                            '<td>' + item.localidad + '</td>' +
                            '<td>' + item.mercado + '</td>' +
                            '<td class="text-center">' + item.estrato + '</td>' +
                            '<td>' + item.tipoPlan + '</td>' +
                            '</tr>'
                        ).join('');

                        // Update pagination controls
                        updatePaginationControls();
                    }

                    function updatePaginationControls() {
                        const currentPageSpan = document.querySelector('.current-page');
                        currentPageSpan.textContent = currentPage;

                        // Enable/disable pagination buttons
                        const paginationBtns = document.querySelectorAll('.pagination-btn');
                        paginationBtns[0].disabled = currentPage === 1; // First
                        paginationBtns[1].disabled = currentPage === 1; // Previous
                        paginationBtns[2].disabled = currentPage === totalPages; // Next
                        paginationBtns[3].disabled = currentPage === totalPages; // Last
                    }

                    function firstPage() {
                        currentPage = 1;
                        displayReportsResults(reportsData);
                    }

                    function previousPage() {
                        if (currentPage > 1) {
                            currentPage--;
                            displayReportsResults(reportsData);
                        }
                    }

                    function nextPage() {
                        if (currentPage < totalPages) {
                            currentPage++;
                            displayReportsResults(reportsData);
                        }
                    }

                    function lastPage() {
                        currentPage = totalPages;
                        displayReportsResults(reportsData);
                    }

                    function clearReportsForm() {
                        if (confirm('¿Está seguro que desea limpiar el formulario?')) {
                            document.querySelector('.reports-form').reset();

                            // Reset table
                            const tableBody = document.getElementById('reportsTableBody');
                            tableBody.innerHTML = '<tr>' +
                                '<td colspan="7" class="no-data">' +
                                '<div class="no-data-message">' +
                                '<i class="fas fa-search"></i>' +
                                '<p>Realice una consulta para ver los resultados</p>' +
                                '</div>' +
                                '</td>' +
                                '</tr>';

                            document.getElementById('recordsInfo').textContent = '0 de 0';
                            reportsData = [];
                            currentPage = 1;
                            totalPages = 1;

                            console.log('Formulario limpiado correctamente');
                        }
                    }







                    // Promociones Activas Functions
                    function filtrarPromocionesActivas() {
                        const numeroServicio = document.getElementById('numeroServicioAsignado').value.trim();

                        // Construir URL con parámetros (permite filtro vacío para mostrar todos)
                        const params = new URLSearchParams();
                        if (numeroServicio !== '') {
                            params.set('placa', numeroServicio);
                        }
                        params.set('page', '1'); // Reset to first page on new search
                        params.set('pageSize', '10'); // Default page size

                        // Redirect to backend controller
                        window.location.href = '<%= request.getContextPath() %>/LoadPromocionesActivas?' + params.toString();
                    }

                    // Funciones de paginación para promociones activas
                    function goToPageActivas(page) {
                        const numeroServicio = document.getElementById('numeroServicioAsignado').value.trim();

                        const params = new URLSearchParams();
                        if (numeroServicio !== '') {
                            params.set('placa', numeroServicio);
                        }
                        params.set('page', page);
                        params.set('pageSize', document.getElementById('pageSizeSelectActivas')?.value || '10');

                        window.location.href = '<%= request.getContextPath() %>/LoadPromocionesActivas?' + params.toString();
                    }

                    function changePageSizeActivas(size) {
                        const numeroServicio = document.getElementById('numeroServicioAsignado').value.trim();

                        const params = new URLSearchParams();
                        if (numeroServicio !== '') {
                            params.set('placa', numeroServicio);
                        }
                        params.set('pageSize', size);
                        params.set('page', '1'); // Reset to first page

                        window.location.href = '<%= request.getContextPath() %>/LoadPromocionesActivas?' + params.toString();
                    }



                    function showAssignedPromotionsLoading(show) {
                        const displayArea = document.getElementById('promocionesAsignadasArea');

                        if (show) {
                            displayArea.innerHTML = '<div class="loading-assigned">' +
                                '<div class="spinner"></div>' +
                                '<p>Consultando promociones asignadas...</p>' +
                                '</div>';
                        }
                    }

                    function displayAssignedPromotions(serviceInfo, promotions) {
                        const displayArea = document.getElementById('promocionesAsignadasArea');

                        if (promotions.length === 0) {
                            displayArea.innerHTML = '<div class="service-info-assigned">' +
                                '<h4><i class="fas fa-info-circle"></i> Información del Servicio</h4>' +
                                '<div class="service-info-grid">' +
                                '<div class="service-info-item">' +
                                '<span class="service-info-label">Número:</span>' +
                                '<span class="service-info-value">' + serviceInfo.numeroServicio + '</span>' +
                                '</div>' +
                                '<div class="service-info-item">' +
                                '<span class="service-info-label">Cliente:</span>' +
                                '<span class="service-info-value">' + serviceInfo.cliente + '</span>' +
                                '</div>' +
                                '<div class="service-info-item">' +
                                '<span class="service-info-label">Tipo:</span>' +
                                '<span class="service-info-value">' + serviceInfo.tipoCliente + '</span>' +
                                '</div>' +
                                '<div class="service-info-item">' +
                                '<span class="service-info-label">Plan:</span>' +
                                '<span class="service-info-value">' + serviceInfo.planActual + '</span>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<div class="no-promotions-assigned">' +
                                '<i class="fas fa-info-circle"></i>' +
                                '<p>No hay promociones asignadas para este servicio</p>' +
                                '</div>';
                            return;
                        }

                        // Generate service info header
                        var serviceInfoHtml = '<div class="service-info-assigned">' +
                            '<h4><i class="fas fa-info-circle"></i> Información del Servicio</h4>' +
                            '<div class="service-info-grid">' +
                            '<div class="service-info-item">' +
                            '<span class="service-info-label">Número:</span>' +
                            '<span class="service-info-value">' + serviceInfo.numeroServicio + '</span>' +
                            '</div>' +
                            '<div class="service-info-item">' +
                            '<span class="service-info-label">Cliente:</span>' +
                            '<span class="service-info-value">' + serviceInfo.cliente + '</span>' +
                            '</div>' +
                            '<div class="service-info-item">' +
                            '<span class="service-info-label">Dirección:</span>' +
                            '<span class="service-info-value">' + serviceInfo.direccion + '</span>' +
                            '</div>' +
                            '<div class="service-info-item">' +
                            '<span class="service-info-label">Tipo:</span>' +
                            '<span class="service-info-value">' + serviceInfo.tipoCliente + '</span>' +
                            '</div>' +
                            '<div class="service-info-item">' +
                            '<span class="service-info-label">Plan:</span>' +
                            '<span class="service-info-value">' + serviceInfo.planActual + '</span>' +
                            '</div>' +
                            '</div>' +
                            '</div>';

                        // Generate promotions list
                        var promotionsHtml = '';
                        for (var i = 0; i < promotions.length; i++) {
                            var promo = promotions[i];
                            var statusClass = getPromotionStatusClass(promo.estado);
                            var statusText = getPromotionStatusText(promo.estado);

                            promotionsHtml += '<div class="assigned-promotion-item">' +
                                '<div class="assigned-promotion-header">' +
                                '<div class="assigned-promotion-title">' +
                                '<i class="fas fa-tag"></i>' +
                                promo.nombre +
                                '</div>' +
                                '<div class="assigned-promotion-status">' +
                                '<span class="status-badge-small ' + statusClass + '">' + statusText + '</span>' +
                                '</div>' +
                                '</div>' +
                                '<div class="assigned-promotion-details">' +
                                '<div class="assigned-detail-item">' +
                                '<span class="assigned-detail-label">Código:</span>' +
                                '<span class="assigned-detail-value">' + promo.codigo + '</span>' +
                                '</div>' +
                                '<div class="assigned-detail-item">' +
                                '<span class="assigned-detail-label">Descripción:</span>' +
                                '<span class="assigned-detail-value">' + promo.descripcion + '</span>' +
                                '</div>' +
                                '<div class="assigned-detail-item">' +
                                '<span class="assigned-detail-label">Valor Descuento:</span>' +
                                '<span class="assigned-detail-value highlight">$' + promo.valor.toLocaleString() + '</span>' +
                                '</div>' +
                                '<div class="assigned-detail-item">' +
                                '<span class="assigned-detail-label">Tipo:</span>' +
                                '<span class="assigned-detail-value">' + promo.tipoDescuento +
                                (promo.porcentaje > 0 ? ' (' + promo.porcentaje + '%)' : '') + '</span>' +
                                '</div>' +
                                '<div class="assigned-detail-item">' +
                                '<span class="assigned-detail-label">Fecha Asignación:</span>' +
                                '<span class="assigned-detail-value">' + formatDate(promo.fechaAsignacion) + '</span>' +
                                '</div>' +
                                '<div class="assigned-detail-item">' +
                                '<span class="assigned-detail-label">Vigencia:</span>' +
                                '<span class="assigned-detail-value">' + formatDate(promo.fechaInicio) + ' - ' + formatDate(promo.fechaFin) + '</span>' +
                                '</div>' +
                                '<div class="assigned-detail-item">' +
                                '<span class="assigned-detail-label">Categoría:</span>' +
                                '<span class="assigned-detail-value">' + promo.categoria + '</span>' +
                                '</div>' +
                                '</div>' +
                                '</div>';
                        }

                        displayArea.innerHTML = serviceInfoHtml + promotionsHtml;
                    }

                    function getPromotionStatusClass(estado) {
                        switch (estado) {
                            case 'VIGENTE':
                                return 'status-vigente';
                            case 'VENCIDA':
                                return 'status-vencida';
                            case 'PROXIMA':
                                return 'status-proxima';
                            default:
                                return 'status-vencida';
                        }
                    }

                    function getPromotionStatusText(estado) {
                        switch (estado) {
                            case 'VIGENTE':
                                return 'Vigente';
                            case 'VENCIDA':
                                return 'Vencida';
                            case 'PROXIMA':
                                return 'Próxima';
                            default:
                                return 'Inactiva';
                        }
                    }

                    function formatDate(dateString) {
                        const date = new Date(dateString + 'T00:00:00');
                        return date.toLocaleDateString('es-ES', {
                            day: '2-digit',
                            month: '2-digit',
                            year: 'numeric'
                        });
                    }

                    // Funciones para el modal de detalle de producto
                    let originalServicios = [];
                    let serviciosCargados = false;



                    function cerrarDetalleProducto() {
                        document.getElementById('productDetailModal').style.display = 'none';
                        document.body.style.overflow = 'auto'; // Restaurar scroll del body

                        // Limpiar variables globales
                        currentProductCode = null;
                        currentProductName = null;
                        originalServicios = [];
                        serviciosCargados = false;
                        conceptosCargadosNuevos = [];
                        serviciosCargadosNuevos = [];

                        // Resetear estado de botones
                        const conceptosBtn = document.querySelector('[onclick="mostrarConceptos()"]');
                        const serviciosBtn = document.querySelector('[onclick="mostrarServicios()"]');

                        if (conceptosBtn && serviciosBtn) {
                            conceptosBtn.classList.remove('btn-primary');
                            conceptosBtn.classList.add('btn-secondary');
                            serviciosBtn.classList.remove('btn-primary');
                            serviciosBtn.classList.add('btn-secondary');
                        }

                        // Resetear área de resultados
                        resetAssociationResults();
                    }

                    function resetAssociationResults() {
                        const resultsArea = document.getElementById('associationResults');
                        resultsArea.innerHTML = '<div class="no-association">' +
                            '<i class="fas fa-info-circle"></i>' +
                            '<p>Seleccione "Conceptos" o "Servicios" para gestionar las asociaciones del producto actual</p>' +
                            '</div>';
                    }

                    function precargarDatosProducto() {
                        const resultsArea = document.getElementById('associationResults');

                        // Mostrar loading inicial
                        resultsArea.innerHTML = '<div class="loading-message">' +
                            '<div class="spinner"></div>' +
                            '<p>Cargando información del producto...</p>' +
                            '</div>';

                        // Activar automáticamente el botón de conceptos
                        const conceptosBtn = document.querySelector('[onclick="mostrarConceptos()"]');
                        if (conceptosBtn) {
                            conceptosBtn.classList.add('btn-primary');
                            conceptosBtn.classList.remove('btn-secondary');
                        }

                        // Cargar conceptos automáticamente
                        mostrarConceptos();
                    }

                    function actualizarEstadoBotones(tipoActivo) {
                        // Obtener ambos botones
                        const conceptosBtn = document.querySelector('[onclick="mostrarConceptos()"]');
                        const serviciosBtn = document.querySelector('[onclick="mostrarServicios()"]');

                        if (conceptosBtn && serviciosBtn) {
                            if (tipoActivo === 'conceptos') {
                                // Activar conceptos
                                conceptosBtn.classList.remove('btn-secondary');
                                conceptosBtn.classList.add('btn-primary');

                                // Desactivar servicios
                                serviciosBtn.classList.remove('btn-primary');
                                serviciosBtn.classList.add('btn-secondary');
                            } else if (tipoActivo === 'servicios') {
                                // Activar servicios
                                serviciosBtn.classList.remove('btn-secondary');
                                serviciosBtn.classList.add('btn-primary');

                                // Desactivar conceptos
                                conceptosBtn.classList.remove('btn-primary');
                                conceptosBtn.classList.add('btn-secondary');
                            }
                        }
                    }

                    function mostrarConceptos() {
                        // Actualizar estado de botones
                        actualizarEstadoBotones('conceptos');

                        // Si ya están cargados los conceptos, mostrar la vista drag & drop directamente
                        if (conceptosCargadosNuevos.length > 0) {
                            mostrarConceptosEnModal(conceptosCargadosNuevos);
                            return;
                        }

                        // Si no hay datos cargados, recargar
                        if (currentProductCode) {
                            cargarConceptosAsociados(currentProductCode);
                        } else {
                            const resultsArea = document.getElementById('associationResults');
                            resultsArea.innerHTML = '<div class="no-association">' +
                                '<i class="fas fa-exclamation-triangle"></i>' +
                                '<p>No hay producto seleccionado</p>' +
                                '</div>';
                        }
                    }

                    function mostrarServicios() {
                        // Actualizar estado de botones
                        actualizarEstadoBotones('servicios');

                        // Si ya están cargados los servicios, mostrar la vista drag & drop directamente
                        if (serviciosCargadosNuevos.length > 0) {
                            mostrarServiciosEnModal(serviciosCargadosNuevos);
                            return;
                        }

                        // Si no hay datos cargados, recargar
                        if (currentProductCode) {
                            cargarServiciosAsociados(currentProductCode);
                        } else {
                            const resultsArea = document.getElementById('associationResults');
                            resultsArea.innerHTML = '<div class="no-association">' +
                                '<i class="fas fa-exclamation-triangle"></i>' +
                                '<p>No hay producto seleccionado</p>' +
                                '</div>';
                        }
                    }





                    function asociarConcepto(conceptoId, conceptoNombre) {
                        mostrarConfirmacion(
                            'Asociar Concepto',
                            '¿Está seguro que desea asociar el concepto "' + conceptoNombre + '" al producto "' + currentProductName + '"?',
                            function () {
                                // Aquí harías la llamada al backend para asociar
                                console.log('Asociando concepto', conceptoId, 'al producto', currentProductCode);

                                console.log('Concepto "' + conceptoNombre + '" asociado exitosamente');

                                // Recargar conceptos para mostrar el cambio
                                setTimeout(() => {
                                    mostrarConceptos();
                                }, 1000);
                            },
                            false // No es una acción peligrosa
                        );
                    }

                    function asociarServicio(servicioId, servicioNombre) {
                        mostrarConfirmacion(
                            'Asociar Servicio',
                            '¿Está seguro que desea asociar el servicio "' + servicioNombre + '" al producto "' + currentProductName + '"?',
                            function () {
                                // Aquí harías la llamada al backend para asociar
                                console.log('Asociando servicio', servicioId, 'al producto', currentProductCode);

                                console.log('Servicio "' + servicioNombre + '" asociado exitosamente');

                                // Recargar servicios para mostrar el cambio
                                setTimeout(() => {
                                    mostrarServicios();
                                }, 1000);
                            },
                            false // No es una acción peligrosa
                        );
                    }

                    function asociarTodosConceptos() {
                        mostrarConfirmacion(
                            'Asociar Todos los Conceptos',
                            '¿Está seguro que desea asociar TODOS los conceptos al producto "' + currentProductName + '"? Esta acción aplicará todos los conceptos disponibles.',
                            function () {
                                // Aquí harías la llamada al backend para asociar todos
                                console.log('Asociando todos los conceptos al producto', currentProductCode);

                                console.log('Todos los conceptos han sido asociados exitosamente');

                                // Recargar conceptos para mostrar el cambio
                                setTimeout(() => {
                                    mostrarConceptos();
                                }, 1000);
                            },
                            true // Marcar como acción peligrosa para usar el botón rojo
                        );
                    }

                    function asociarTodosServicios() {
                        mostrarConfirmacion(
                            'Asociar Todos los Servicios',
                            '¿Está seguro que desea asociar TODOS los servicios al producto "' + currentProductName + '"? Esta acción aplicará todos los servicios disponibles.',
                            function () {
                                // Aquí harías la llamada al backend para asociar todos
                                console.log('Asociando todos los servicios al producto', currentProductCode);

                                console.log('Todos los servicios han sido asociados exitosamente');

                                // Recargar servicios para mostrar el cambio
                                setTimeout(() => {
                                    mostrarServicios();
                                }, 1000);
                            },
                            true // Marcar como acción peligrosa para usar el botón rojo
                        );
                    }

                    // Cerrar modal con ESC
                    document.addEventListener('keydown', function (event) {
                        if (event.key === 'Escape') {
                            cerrarDetalleProducto();
                            cerrarModalConfirmacion(); // También cerrar modal de confirmación con ESC
                        }
                    });

                    // Funciones para el modal de confirmación personalizado
                    let confirmActionCallback = null;

                    function mostrarConfirmacion(titulo, mensaje, callback, peligroso = false) {
                        // Actualizar contenido del modal
                        document.getElementById('confirmationTitle').textContent = titulo;
                        document.getElementById('confirmationMessage').textContent = mensaje;

                        // Configurar el botón de confirmar
                        const confirmBtn = document.getElementById('confirmActionBtn');
                        if (peligroso) {
                            confirmBtn.className = 'btn btn-danger';
                            confirmBtn.innerHTML = '<i class="fas fa-exclamation-triangle"></i> Confirmar';
                        } else {
                            confirmBtn.className = 'btn btn-primary';
                            confirmBtn.innerHTML = '<i class="fas fa-check"></i> Confirmar';
                        }

                        // Guardar callback para ejecutar al confirmar
                        confirmActionCallback = callback;

                        // Configurar evento del botón confirmar
                        confirmBtn.onclick = function () {
                            if (confirmActionCallback) {
                                confirmActionCallback();
                            }
                            cerrarModalConfirmacion();
                        };

                        // Mostrar modal
                        document.getElementById('confirmationModal').style.display = 'flex';
                        document.body.style.overflow = 'hidden';
                    }

                    function cerrarModalConfirmacion() {
                        document.getElementById('confirmationModal').style.display = 'none';
                        document.body.style.overflow = 'auto';
                        confirmActionCallback = null;
                    }

                    // Funciones de filtrado para conceptos y servicios
                    function filtrarConceptos() {
                        // Ya no es necesaria porque los conceptos usan el sistema drag & drop
                        // Función mantenida solo para compatibilidad
                        console.log('Búsqueda de conceptos ya no es necesaria - usar sistema drag & drop');
                    }

                    function filtrarServicios() {
                        // Ya no es necesaria porque los servicios usan el sistema drag & drop
                        // Función mantenida solo para compatibilidad
                        console.log('Búsqueda de servicios ya no es necesaria - usar sistema drag & drop');
                    }

                    function limpiarBusquedaConceptos() {
                        // Ya no es necesaria porque usa el sistema drag & drop
                        console.log('Limpiar búsqueda de conceptos ya no es necesario - usar sistema drag & drop');
                    }

                    function limpiarBusquedaServicios() {
                        // Ya no es necesaria porque los servicios usan el sistema drag & drop
                        console.log('Limpiar búsqueda de servicios ya no es necesario - usar sistema drag & drop');
                    }

                    // Funciones para el modal de crear producto
                    function abrirModalCrearProducto() {
                        document.getElementById('createProductModal').style.display = 'flex';
                        document.body.style.overflow = 'hidden';

                        // Limpiar formulario
                        const input = document.getElementById('newProductName');
                        input.value = '';

                        // Resetear validación
                        const validationDiv = document.getElementById('descripcionValidation');
                        const messageSpan = document.getElementById('validationMessage');
                        const counterSpan = document.getElementById('characterCounter');
                        const saveBtn = document.getElementById('saveProductBtn');

                        validationDiv.style.display = 'none';
                        input.style.borderColor = '';
                        counterSpan.textContent = '0/30';
                        counterSpan.style.color = '#6b7280';

                        // Deshabilitar botón inicialmente
                        if (saveBtn) {
                            saveBtn.disabled = true;
                            saveBtn.style.opacity = '0.5';
                            saveBtn.style.cursor = 'not-allowed';
                        }

                        // Enfocar input
                        setTimeout(() => {
                            input.focus();
                        }, 100);
                    }

                    function cerrarModalCrearProducto() {
                        document.getElementById('createProductModal').style.display = 'none';
                        document.body.style.overflow = 'auto';
                    }



                    function crearNuevoProducto() {
                        console.log('=== FUNCIÓN CREARNEUVOPRODUCTO INICIADA ===');

                        // Obtener el valor del input
                        const input = document.getElementById('newProductName');
                        if (!input) {
                            console.error('ERROR: Input newProductName no encontrado');
                            alert('Error: No se encontró el campo de texto');
                            return;
                        }

                        const descripcion = input.value.trim();
                        console.log('Descripción obtenida:', descripcion);

                        // Validación básica
                        if (!descripcion) {
                            alert('Por favor ingrese una descripción');
                            return;
                        }

                        if (descripcion.length > 30) {
                            alert('Descripción muy larga (máximo 30 caracteres)');
                            return;
                        }

                        // Deshabilitar botón
                        const btn = document.getElementById('saveProductBtn');
                        const originalText = btn.innerHTML;
                        btn.disabled = true;
                        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Creando...';

                        console.log('Enviando petición al servidor...');

                        // Preparar datos
                        const formData = new URLSearchParams();
                        formData.append('descripcion', descripcion);

                        // Enviar al servidor
                        fetch('<%= request.getContextPath() %>/CreateProduct', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
                            },
                            body: formData
                        })
                            .then(response => {
                                console.log('Respuesta del servidor:', response.status);
                                return response.text();
                            })
                            .then(responseText => {
                                console.log('Texto de respuesta:', responseText);

                                try {
                                    const data = JSON.parse(responseText);
                                    console.log('JSON parseado:', data);

                                    if (data.success) {
                                        console.log(data.message || '¡Producto creado exitosamente!');
                                        input.value = '';
                                        document.getElementById('createProductModal').style.display = 'none';
                                        document.body.style.overflow = 'auto';
                                        // Recargar inmediatamente
                                        setTimeout(() => location.reload(), 1000);
                                    } else {
                                        alert(data.message || 'Error desconocido al crear producto');
                                    }
                                } catch (e) {
                                    console.error('Error parseando JSON:', e);
                                    console.error('Respuesta que causó el error:', responseText);
                                    alert('Error al procesar respuesta del servidor: ' + responseText.substring(0, 100));
                                }
                            })
                            .catch(error => {
                                console.error('Error en fetch:', error);
                                alert('Error de conectividad: ' + error.message);
                            })
                            .finally(() => {
                                // Restaurar botón
                                btn.disabled = false;
                                btn.innerHTML = originalText;
                            });
                    }

                    // Variables para el modal de detalle
                    let currentProductCode = null;
                    let currentProductName = null;
                    let conceptosCargadosNuevos = [];
                    let serviciosCargadosNuevos = [];

                    // Función para ver detalle del producto (usar modal existente)
                    function verDetalleProducto(codProducto) {
                        console.log('Ver detalle producto:', codProducto);

                        // Buscar el nombre del producto en la tabla actual de manera más segura
                        let productName = 'Producto ' + codProducto;
                        try {
                            const buttons = document.querySelectorAll('button.btn-details');
                            for (let button of buttons) {
                                if (button.onclick && button.onclick.toString().includes(codProducto)) {
                                    const row = button.closest('tr');
                                    if (row && row.children.length > 1) {
                                        productName = row.children[1].textContent.trim();
                                        break;
                                    }
                                }
                            }
                        } catch (e) {
                            console.log('No se pudo obtener el nombre del producto, usando valor por defecto');
                        }

                        currentProductCode = codProducto;
                        currentProductName = productName;

                        // Actualizar información del producto en el modal
                        document.getElementById('productNameModal').textContent = productName;
                        document.getElementById('productCodeModal').textContent = 'Código: ' + codProducto;

                        // Actualizar información extra
                        const today = new Date();
                        const formattedDate = today.toLocaleDateString('es-ES');
                        document.getElementById('productDateCreated').textContent = 'Último acceso: ' + formattedDate;

                        // Mostrar modal existente
                        document.getElementById('productDetailModal').style.display = 'flex';
                        document.body.style.overflow = 'hidden';

                        // Cargar conceptos asociados automáticamente al abrir el modal
                        cargarConceptosAsociados(codProducto);
                    }

                    // Nueva función para cargar conceptos asociados
                    function cargarConceptosAsociados(codProducto) {
                        const resultsArea = document.getElementById('associationResults');

                        // Mostrar loading
                        resultsArea.innerHTML = '<div class="loading-message">' +
                            '<div class="spinner"></div>' +
                            '<p>Cargando conceptos asociados...</p>' +
                            '</div>';

                        fetch('<%= request.getContextPath() %>/ProductDetail?codProducto=' + codProducto, {
                            method: 'GET'
                        })
                            .then(response => response.text())
                            .then(responseText => {
                                console.log('Respuesta del detalle:', responseText);

                                try {
                                    const data = JSON.parse(responseText);
                                    console.log('Datos parseados:', data);

                                    if (data.success) {
                                        mostrarConceptosEnModal(data.conceptos);
                                    } else {
                                        resultsArea.innerHTML = '<div class="no-association">' +
                                            '<i class="fas fa-exclamation-triangle"></i>' +
                                            '<p>Error: ' + (data.message || 'No se pudieron cargar los conceptos') + '</p>' +
                                            '</div>';
                                    }
                                } catch (e) {
                                    console.error('Error parseando respuesta:', e);
                                    resultsArea.innerHTML = '<div class="no-association">' +
                                        '<i class="fas fa-exclamation-triangle"></i>' +
                                        '<p>Error al procesar respuesta del servidor</p>' +
                                        '</div>';
                                }
                            })
                            .catch(error => {
                                console.error('Error al cargar detalle:', error);
                                resultsArea.innerHTML = '<div class="no-association">' +
                                    '<i class="fas fa-exclamation-triangle"></i>' +
                                    '<p>Error de conectividad al cargar detalles</p>' +
                                    '</div>';
                            });
                    }

                    // Función para mostrar conceptos en el modal existente
                    function mostrarConceptosEnModal(conceptos) {
                        const resultsArea = document.getElementById('associationResults');

                        if (conceptos.length === 0) {
                            resultsArea.innerHTML = '<div class="no-association">' +
                                '<i class="fas fa-exclamation-triangle"></i>' +
                                '<p>No se encontraron conceptos disponibles</p>' +
                                '</div>';
                            return;
                        }

                        // Los conceptos ya vienen separados desde el backend
                        const asociados = conceptos.filter(c => c.asociado);
                        const disponibles = conceptos.filter(c => !c.asociado);

                        console.log('Conceptos asociados:', asociados);
                        console.log('Conceptos disponibles:', disponibles);

                        let html = '<div class="dual-column-container">';

                        // Columna izquierda: Conceptos Asociados
                        html += '<div class="column-left">';
                        html += '<div class="column-header associated-header">';
                        html += '<h4 style="color: white;"><i class="fas fa-check-circle"></i> Conceptos Asociados (' + asociados.length + ')</h4>';
                        html += '</div>';
                        html += '<div class="concepts-list associated-list" id="associatedList" ondrop="dropConcept(event, \'associated\')" ondragover="allowDrop(event)">';

                        if (asociados.length > 0) {
                            asociados.forEach(concepto => {
                                html += '<div class="concept-item associated-item" draggable="true" ondragstart="dragConcept(event)" data-concept-id="' + concepto.codConcepto + '" data-concept-name="' + concepto.concepto + '">' +
                                    '<div class="concept-content">' +
                                    '<div class="concept-title">' + concepto.concepto + '</div>' +
                                    '<div class="concept-code">Código: ' + concepto.codConcepto + '</div>' +
                                    '</div>' +
                                    '<div class="concept-actions">' +
                                    '<button type="button" class="move-btn" onclick="moveToAvailable(\'' + concepto.codConcepto + '\', \'' + concepto.concepto + '\')" title="Mover a disponibles">' +
                                    '<i class="fas fa-arrow-right"></i>' +
                                    '</button>' +
                                    '</div>' +
                                    '</div>';
                            });
                        } else {
                            html += '<div class="empty-state">No hay conceptos asociados</div>';
                        }
                        html += '</div>';
                        html += '</div>';

                        // Columna del centro con controles
                        html += '<div class="column-center">';
                        html += '<div class="transfer-controls">';
                        html += '<button type="button" class="transfer-btn" onclick="associateAllConcepts()" title="Asociar todos">';
                        html += '<i class="fas fa-angle-double-right"></i>';
                        html += '</button>';
                        html += '<button type="button" class="transfer-btn" onclick="dissociateAllConcepts()" title="Quitar todos">';
                        html += '<i class="fas fa-angle-double-left"></i>';
                        html += '</button>';
                        html += '</div>';
                        html += '</div>';

                        // Columna derecha: Conceptos Disponibles
                        html += '<div class="column-right">';
                        html += '<div class="column-header available-header">';
                        html += '<h4 style="color: white;"><i class="fas fa-plus-circle"></i> Conceptos Disponibles (' + disponibles.length + ')</h4>';
                        html += '</div>';
                        html += '<div class="concepts-list available-list" id="availableList" ondrop="dropConcept(event, \'available\')" ondragover="allowDrop(event)">';

                        if (disponibles.length > 0) {
                            disponibles.forEach(concepto => {
                                html += '<div class="concept-item available-item" draggable="true" ondragstart="dragConcept(event)" data-concept-id="' + concepto.codConcepto + '" data-concept-name="' + concepto.concepto + '">' +
                                    '<div class="concept-content">' +
                                    '<div class="concept-title">' + concepto.concepto + '</div>' +
                                    '<div class="concept-code">Código: ' + concepto.codConcepto + '</div>' +
                                    '</div>' +
                                    '<div class="concept-actions">' +
                                    '<button type="button" class="move-btn" onclick="moveToAssociated(\'' + concepto.codConcepto + '\', \'' + concepto.concepto + '\')" title="Asociar concepto">' +
                                    '<i class="fas fa-arrow-left"></i>' +
                                    '</button>' +
                                    '</div>' +
                                    '</div>';
                            });
                        } else {
                            html += '<div class="empty-state">Todos los conceptos están asociados</div>';
                        }
                        html += '</div>';
                        html += '</div>';

                        html += '</div>';

                        // Estilos CSS mejorados
                        html += '<style>' +
                            '.dual-column-container { display: flex; gap: 1.5rem; min-height: 400px; max-height: 500px; }' +
                            '.column-left, .column-right { flex: 1; display: flex; flex-direction: column; background: white; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1); overflow: hidden; }' +
                            '.column-center { width: 80px; display: flex; align-items: center; justify-content: center; }' +
                            '.column-header { padding: 1.25rem; text-align: center; color: white; font-weight: bold; }' +
                            '.associated-header { background: linear-gradient(135deg, #22c55e, #16a34a); }' +
                            '.available-header { background: linear-gradient(135deg, #6366f1, #4f46e5); }' +
                            '.column-header h4 { margin: 0; font-size: 1rem; font-weight: 700; text-shadow: 0 1px 2px rgba(0,0,0,0.1); }' +
                            '.concepts-list { flex: 1; padding: 1.25rem; overflow-y: auto; min-height: 300px; border: 2px dashed transparent; transition: all 0.3s ease; }' +
                            '.associated-list { background: linear-gradient(to bottom, #f0fdf4, #dcfce7); }' +
                            '.available-list { background: linear-gradient(to bottom, #eef2ff, #e0e7ff); }' +
                            '.concept-item { background: white; border: 1px solid #e5e7eb; border-radius: 8px; padding: 0.75rem 1rem; margin-bottom: 0.75rem; display: flex; justify-content: space-between; align-items: center; cursor: grab; transition: all 0.3s ease; box-shadow: 0 1px 3px rgba(0,0,0,0.1); min-height: 60px; }' +
                            '.concept-item:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }' +
                            '.concept-item.dragging { opacity: 0.7; transform: rotate(2deg); }' +
                            '.associated-item { border-left: 5px solid #22c55e; }' +
                            '.available-item { border-left: 5px solid #6366f1; }' +
                            '.concept-content { flex: 1; }' +
                            '.concept-title { font-weight: 700; margin-bottom: 0.35rem; color: #1f2937; font-size: 0.9rem; line-height: 1.2; }' +
                            '.concept-code { font-size: 0.75rem; color: #6b7280; background: #f3f4f6; padding: 0.2rem 0.4rem; border-radius: 4px; display: inline-block; }' +
                            '.concept-actions { margin-left: 1rem; }' +
                            '.move-btn { background: linear-gradient(135deg, #f59e0b, #d97706); color: white; border: none; border-radius: 6px; padding: 0.4rem 0.6rem; cursor: pointer; transition: all 0.2s ease; font-weight: 600; min-width: 36px; height: 32px; display: flex; align-items: center; justify-content: center; }' +
                            '.move-btn:hover { background: linear-gradient(135deg, #d97706, #b45309); transform: scale(1.05); }' +
                            '.transfer-controls { display: flex; flex-direction: column; gap: 1rem; }' +
                            '.transfer-btn { background: linear-gradient(135deg, #8b5cf6, #7c3aed); color: white; border: none; border-radius: 12px; width: 50px; height: 50px; cursor: pointer; transition: all 0.2s ease; font-size: 1.2rem; }' +
                            '.transfer-btn:hover { background: linear-gradient(135deg, #7c3aed, #6d28d9); transform: scale(1.1); }' +
                            '.empty-state { text-align: center; color: #9ca3af; font-style: italic; padding: 3rem 1rem; font-size: 1rem; }' +
                            '.concepts-list.drag-over { border-color: #f59e0b; background: rgba(251, 191, 36, 0.1); }' +
                            '.modal-wide { max-width: 95vw; width: 1300px; }' +
                            '</style>';

                        resultsArea.innerHTML = html;

                        // Guardar los conceptos para el botón "Conceptos"
                        conceptosCargadosNuevos = conceptos;
                    }

                    // ==================== FUNCIONES DE DRAG & DROP ====================

                    let draggedElement = null;

                    function dragConcept(event) {
                        // Buscar el elemento concept-item más cercano
                        draggedElement = event.target.closest('.concept-item');
                        if (!draggedElement) return;

                        event.dataTransfer.effectAllowed = 'move';
                        event.dataTransfer.setData('text/plain', draggedElement.getAttribute('data-concept-id'));

                        // Añadir clase visual de arrastre
                        draggedElement.classList.add('dragging');

                        console.log('Iniciando drag de:', draggedElement.getAttribute('data-concept-name'));
                    }

                    function allowDrop(event) {
                        event.preventDefault();
                        event.dataTransfer.dropEffect = 'move';

                        // Añadir efecto visual a la zona de drop
                        const dropZone = event.target.closest('.concepts-list');
                        if (dropZone) {
                            dropZone.classList.add('drag-over');
                        }
                    }

                    function dropConcept(event, targetType) {
                        event.preventDefault();

                        // Quitar efecto visual
                        const dropZone = event.target.closest('.concepts-list');
                        if (dropZone) {
                            dropZone.classList.remove('drag-over');
                        }

                        if (draggedElement) {
                            const conceptId = draggedElement.getAttribute('data-concept-id');
                            const conceptName = draggedElement.getAttribute('data-concept-name');

                            console.log('Drop en:', targetType, 'concepto:', conceptName);

                            // Verificar si realmente necesitamos mover (no está ya en la lista correcta)
                            const isInAssociated = draggedElement.classList.contains('associated-item');
                            const shouldBeAssociated = (targetType === 'associated');

                            if (isInAssociated !== shouldBeAssociated) {
                                // Solo mover si realmente necesita cambiar de lista
                                console.log('Moviendo de', isInAssociated ? 'asociados' : 'disponibles', 'a', targetType);

                                // Quitar clase de arrastre
                                draggedElement.classList.remove('dragging');

                                // Mover directamente sin pasar por las funciones intermedias
                                moveConceptDirectly(draggedElement, targetType);
                            } else {
                                console.log('El elemento ya está en la lista correcta');
                                draggedElement.classList.remove('dragging');
                            }

                            draggedElement = null;
                        }
                    }

                    function moveConceptDirectly(element, targetType) {
                        const conceptId = element.getAttribute('data-concept-id');
                        const conceptName = element.getAttribute('data-concept-name');

                        console.log('Moviendo directamente:', conceptName, 'hacia:', targetType);

                        // Remover del lugar actual
                        element.remove();

                        // Crear nuevo elemento en el destino
                        let newHtml = '';
                        if (targetType === 'associated') {
                            newHtml = '<div class="concept-item associated-item" draggable="true" ondragstart="dragConcept(event)" data-concept-id="' + conceptId + '" data-concept-name="' + conceptName + '">' +
                                '<div class="concept-content">' +
                                '<div class="concept-title">' + conceptName + '</div>' +
                                '<div class="concept-code">Código: ' + conceptId + '</div>' +
                                '</div>' +
                                '<div class="concept-actions">' +
                                '<button type="button" class="move-btn" onclick="moveToAvailable(\'' + conceptId + '\', \'' + conceptName + '\')" title="Mover a disponibles">' +
                                '<i class="fas fa-arrow-right"></i>' +
                                '</button>' +
                                '</div>' +
                                '</div>';

                            const associatedList = document.getElementById('associatedList');
                            // Quitar mensaje de vacío si existe
                            const emptyState = associatedList.querySelector('.empty-state');
                            if (emptyState) emptyState.remove();
                            associatedList.insertAdjacentHTML('beforeend', newHtml);

                            console.log('✓ ' + conceptName + ' asociado');

                        } else {
                            newHtml = '<div class="concept-item available-item" draggable="true" ondragstart="dragConcept(event)" data-concept-id="' + conceptId + '" data-concept-name="' + conceptName + '">' +
                                '<div class="concept-content">' +
                                '<div class="concept-title">' + conceptName + '</div>' +
                                '<div class="concept-code">Código: ' + conceptId + '</div>' +
                                '</div>' +
                                '<div class="concept-actions">' +
                                '<button type="button" class="move-btn" onclick="moveToAssociated(\'' + conceptId + '\', \'' + conceptName + '\')" title="Asociar concepto">' +
                                '<i class="fas fa-arrow-left"></i>' +
                                '</button>' +
                                '</div>' +
                                '</div>';

                            const availableList = document.getElementById('availableList');
                            // Quitar mensaje de vacío si existe
                            const emptyState = availableList.querySelector('.empty-state');
                            if (emptyState) emptyState.remove();
                            availableList.insertAdjacentHTML('beforeend', newHtml);

                            console.log('◯ ' + conceptName + ' quitado de asociaciones');
                        }

                        // Verificar estados vacíos y actualizar contadores
                        checkEmptyStates();
                        updateConceptCounters();
                    }

                    // Agregar evento para quitar la clase cuando termine el drag
                    document.addEventListener('dragend', function (event) {
                        if (event.target.closest('.concept-item')) {
                            event.target.closest('.concept-item').classList.remove('dragging');
                        }
                        // Quitar todos los drag-over
                        document.querySelectorAll('.drag-over').forEach(el => {
                            el.classList.remove('drag-over');
                        });
                    });

                    function moveToAssociated(conceptId, conceptName) {
                        console.log('Botón clicked - Moviendo concepto a asociados:', conceptId, conceptName);

                        const conceptElement = document.querySelector('[data-concept-id="' + conceptId + '"]');
                        if (conceptElement) {
                            moveConceptDirectly(conceptElement, 'associated');
                        } else {
                            console.error('No se encontró el elemento con ID:', conceptId);
                            console.error('Error: No se pudo encontrar el concepto');
                        }
                    }

                    function moveToAvailable(conceptId, conceptName) {
                        console.log('Botón clicked - Moviendo concepto a disponibles:', conceptId, conceptName);

                        const conceptElement = document.querySelector('[data-concept-id="' + conceptId + '"]');
                        if (conceptElement) {
                            moveConceptDirectly(conceptElement, 'available');
                        } else {
                            console.error('No se encontró el elemento con ID:', conceptId);
                            console.error('Error: No se pudo encontrar el concepto');
                        }
                    }

                    function moveConceptVisually(conceptId, targetList) {
                        console.log('Ejecutando moveConceptVisually para:', conceptId, 'hacia:', targetList);

                        const conceptElement = document.querySelector('[data-concept-id="' + conceptId + '"]');
                        if (!conceptElement) {
                            console.error('No se encontró el elemento con ID:', conceptId);
                            return;
                        }

                        const conceptName = conceptElement.getAttribute('data-concept-name');
                        console.log('Moviendo elemento:', conceptName);

                        // Remover del lugar actual
                        conceptElement.remove();

                        // Crear nuevo elemento en el destino
                        let newHtml = '';
                        if (targetList === 'associated') {
                            newHtml = '<div class="concept-item associated-item" draggable="true" ondragstart="dragConcept(event)" data-concept-id="' + conceptId + '" data-concept-name="' + conceptName + '">' +
                                '<div class="concept-content">' +
                                '<div class="concept-title">' + conceptName + '</div>' +
                                '<div class="concept-code">Código: ' + conceptId + '</div>' +
                                '</div>' +
                                '<div class="concept-actions">' +
                                '<button type="button" class="move-btn" onclick="moveToAvailable(\'' + conceptId + '\', \'' + conceptName + '\')" title="Mover a disponibles">' +
                                '<i class="fas fa-arrow-right"></i>' +
                                '</button>' +
                                '</div>' +
                                '</div>';

                            const associatedList = document.getElementById('associatedList');
                            // Quitar mensaje de vacío si existe
                            const emptyState = associatedList.querySelector('.empty-state');
                            if (emptyState) emptyState.remove();
                            associatedList.insertAdjacentHTML('beforeend', newHtml);

                        } else {
                            newHtml = '<div class="concept-item available-item" draggable="true" ondragstart="dragConcept(event)" data-concept-id="' + conceptId + '" data-concept-name="' + conceptName + '">' +
                                '<div class="concept-content">' +
                                '<div class="concept-title">' + conceptName + '</div>' +
                                '<div class="concept-code">Código: ' + conceptId + '</div>' +
                                '</div>' +
                                '<div class="concept-actions">' +
                                '<button type="button" class="move-btn" onclick="moveToAssociated(\'' + conceptId + '\', \'' + conceptName + '\')" title="Asociar concepto">' +
                                '<i class="fas fa-arrow-left"></i>' +
                                '</button>' +
                                '</div>' +
                                '</div>';

                            const availableList = document.getElementById('availableList');
                            // Quitar mensaje de vacío si existe
                            const emptyState = availableList.querySelector('.empty-state');
                            if (emptyState) emptyState.remove();
                            availableList.insertAdjacentHTML('beforeend', newHtml);
                        }

                        // Verificar si alguna lista quedó vacía y agregar mensaje
                        checkEmptyStates();

                        // Actualizar contadores
                        updateConceptCounters();
                    }

                    function checkEmptyStates() {
                        const associatedList = document.getElementById('associatedList');
                        const availableList = document.getElementById('availableList');

                        // Verificar lista de asociados
                        if (associatedList && associatedList.querySelectorAll('.concept-item').length === 0) {
                            if (!associatedList.querySelector('.empty-state')) {
                                associatedList.innerHTML = '<div class="empty-state">No hay conceptos asociados</div>';
                            }
                        }

                        // Verificar lista de disponibles  
                        if (availableList && availableList.querySelectorAll('.concept-item').length === 0) {
                            if (!availableList.querySelector('.empty-state')) {
                                availableList.innerHTML = '<div class="empty-state">Todos los conceptos están asociados</div>';
                            }
                        }
                    }

                    function associateAllConcepts() {
                        const availableItems = document.querySelectorAll('.available-item');
                        availableItems.forEach(item => {
                            const conceptId = item.getAttribute('data-concept-id');
                            const conceptName = item.getAttribute('data-concept-name');
                            moveToAssociated(conceptId, conceptName);
                        });
                    }

                    function dissociateAllConcepts() {
                        const associatedItems = document.querySelectorAll('.associated-item');
                        associatedItems.forEach(item => {
                            const conceptId = item.getAttribute('data-concept-id');
                            const conceptName = item.getAttribute('data-concept-name');
                            moveToAvailable(conceptId, conceptName);
                        });
                    }

                    function updateConceptCounters() {
                        const associatedCount = document.querySelectorAll('.associated-item').length;
                        const availableCount = document.querySelectorAll('.available-item').length;

                        const associatedHeader = document.querySelector('.associated-header h4');
                        const availableHeader = document.querySelector('.available-header h4');

                        if (associatedHeader) {
                            associatedHeader.innerHTML = '<i class="fas fa-check-circle"></i> Conceptos Asociados (' + associatedCount + ')';
                            associatedHeader.style.color = 'white';
                        }

                        if (availableHeader) {
                            availableHeader.innerHTML = '<i class="fas fa-plus-circle"></i> Conceptos Disponibles (' + availableCount + ')';
                            availableHeader.style.color = 'white';
                        }

                        console.log('Contadores actualizados - Asociados:', associatedCount, 'Disponibles:', availableCount);
                    }





                    // ==================== FUNCIONES PARA SERVICIOS ====================

                    // Función para cargar servicios asociados
                    function cargarServiciosAsociados(codProducto) {
                        const resultsArea = document.getElementById('associationResults');

                        // Mostrar loading
                        resultsArea.innerHTML = '<div class="loading-message">' +
                            '<div class="spinner"></div>' +
                            '<p>Cargando servicios asociados...</p>' +
                            '</div>';

                        fetch('<%= request.getContextPath() %>/ProductServices?codProducto=' + codProducto, {
                            method: 'GET'
                        })
                            .then(response => response.text())
                            .then(responseText => {
                                console.log('Respuesta del detalle de servicios:', responseText);

                                try {
                                    const data = JSON.parse(responseText);
                                    console.log('Datos de servicios parseados:', data);

                                    if (data.success) {
                                        mostrarServiciosEnModal(data.servicios);
                                    } else {
                                        resultsArea.innerHTML = '<div class="no-association">' +
                                            '<i class="fas fa-exclamation-triangle"></i>' +
                                            '<p>Error: ' + (data.message || 'No se pudieron cargar los servicios') + '</p>' +
                                            '</div>';
                                    }
                                } catch (e) {
                                    console.error('Error parseando respuesta de servicios:', e);
                                    resultsArea.innerHTML = '<div class="no-association">' +
                                        '<i class="fas fa-exclamation-triangle"></i>' +
                                        '<p>Error al procesar respuesta del servidor</p>' +
                                        '</div>';
                                }
                            })
                            .catch(error => {
                                console.error('Error al cargar servicios:', error);
                                resultsArea.innerHTML = '<div class="no-association">' +
                                    '<i class="fas fa-exclamation-triangle"></i>' +
                                    '<p>Error de conectividad al cargar servicios</p>' +
                                    '</div>';
                            });
                    }

                    // Función para mostrar servicios en el modal con drag & drop
                    function mostrarServiciosEnModal(servicios) {
                        const resultsArea = document.getElementById('associationResults');

                        if (servicios.length === 0) {
                            resultsArea.innerHTML = '<div class="no-association">' +
                                '<i class="fas fa-exclamation-triangle"></i>' +
                                '<p>No se encontraron servicios disponibles</p>' +
                                '</div>';
                            return;
                        }

                        // Los servicios ya vienen separados desde el backend
                        const asociados = servicios.filter(s => s.asociado);
                        const disponibles = servicios.filter(s => !s.asociado);

                        console.log('Servicios asociados:', asociados);
                        console.log('Servicios disponibles:', disponibles);

                        let html = '<div class="dual-column-container">';

                        // Columna izquierda: Servicios Asociados (Verde)
                        html += '<div class="column-left">';
                        html += '<div class="column-header associated-header">';
                        html += '<h4 style="color: white;"><i class="fas fa-check-circle"></i> Servicios Asociados (' + asociados.length + ')</h4>';
                        html += '</div>';
                        html += '<div class="services-list associated-list" id="associatedServicesList" ondrop="dropService(event, \'associated\')" ondragover="allowDropService(event)">';

                        if (asociados.length > 0) {
                            asociados.forEach(servicio => {
                                html += '<div class="service-item associated-item" draggable="true" ondragstart="dragService(event)" data-service-id="' + servicio.codServicio + '" data-service-name="' + servicio.servicio + '">' +
                                    '<div class="service-content">' +
                                    '<div class="service-title">' + servicio.servicio + '</div>' +
                                    '<div class="service-code">Código: ' + servicio.codServicio + '</div>' +
                                    '</div>' +
                                    '<div class="service-actions">' +
                                    '<button type="button" class="move-btn" onclick="moveServiceToAvailable(\'' + servicio.codServicio + '\', \'' + servicio.servicio + '\')" title="Mover a disponibles">' +
                                    '<i class="fas fa-arrow-right"></i>' +
                                    '</button>' +
                                    '</div>' +
                                    '</div>';
                            });
                        } else {
                            html += '<div class="empty-state">No hay servicios asociados</div>';
                        }
                        html += '</div>';
                        html += '</div>';

                        // Columna del centro con controles
                        html += '<div class="column-center">';
                        html += '<div class="transfer-controls">';
                        html += '<button type="button" class="transfer-btn" onclick="associateAllServices()" title="Asociar todos">';
                        html += '<i class="fas fa-angle-double-right"></i>';
                        html += '</button>';
                        html += '<button type="button" class="transfer-btn" onclick="dissociateAllServices()" title="Quitar todos">';
                        html += '<i class="fas fa-angle-double-left"></i>';
                        html += '</button>';
                        html += '</div>';
                        html += '</div>';

                        // Columna derecha: Servicios Disponibles (Azul/Púrpura)
                        html += '<div class="column-right">';
                        html += '<div class="column-header available-header">';
                        html += '<h4 style="color: white;"><i class="fas fa-plus-circle"></i> Servicios Disponibles (' + disponibles.length + ')</h4>';
                        html += '</div>';
                        html += '<div class="services-list available-list" id="availableServicesList" ondrop="dropService(event, \'available\')" ondragover="allowDropService(event)">';

                        if (disponibles.length > 0) {
                            disponibles.forEach(servicio => {
                                html += '<div class="service-item available-item" draggable="true" ondragstart="dragService(event)" data-service-id="' + servicio.codServicio + '" data-service-name="' + servicio.servicio + '">' +
                                    '<div class="service-content">' +
                                    '<div class="service-title">' + servicio.servicio + '</div>' +
                                    '<div class="service-code">Código: ' + servicio.codServicio + '</div>' +
                                    '</div>' +
                                    '<div class="service-actions">' +
                                    '<button type="button" class="move-btn" onclick="moveServiceToAssociated(\'' + servicio.codServicio + '\', \'' + servicio.servicio + '\')" title="Asociar servicio">' +
                                    '<i class="fas fa-arrow-left"></i>' +
                                    '</button>' +
                                    '</div>' +
                                    '</div>';
                            });
                        } else {
                            html += '<div class="empty-state">Todos los servicios están asociados</div>';
                        }
                        html += '</div>';
                        html += '</div>';

                        html += '</div>';

                        // Estilos CSS para servicios (idénticos a conceptos)
                        html += '<style>' +
                            '.dual-column-container { display: flex; gap: 1.5rem; min-height: 400px; max-height: 500px; }' +
                            '.column-left, .column-right { flex: 1; display: flex; flex-direction: column; background: white; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1); overflow: hidden; }' +
                            '.column-center { width: 80px; display: flex; align-items: center; justify-content: center; }' +
                            '.column-header { padding: 1.25rem; text-align: center; color: white; font-weight: bold; }' +
                            '.associated-header { background: linear-gradient(135deg, #22c55e, #16a34a); }' +
                            '.available-header { background: linear-gradient(135deg, #6366f1, #4f46e5); }' +
                            '.column-header h4 { margin: 0; font-size: 1rem; font-weight: 700; text-shadow: 0 1px 2px rgba(0,0,0,0.1); }' +
                            '.services-list { flex: 1; padding: 1.25rem; overflow-y: auto; min-height: 300px; border: 2px dashed transparent; transition: all 0.3s ease; }' +
                            '.associated-list { background: linear-gradient(to bottom, #f0fdf4, #dcfce7); }' +
                            '.available-list { background: linear-gradient(to bottom, #eef2ff, #e0e7ff); }' +
                            '.service-item { background: white; border: 1px solid #e5e7eb; border-radius: 8px; padding: 0.75rem 1rem; margin-bottom: 0.75rem; display: flex; justify-content: space-between; align-items: center; cursor: grab; transition: all 0.3s ease; box-shadow: 0 1px 3px rgba(0,0,0,0.1); min-height: 60px; }' +
                            '.service-item:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }' +
                            '.service-item.dragging { opacity: 0.7; transform: rotate(2deg); }' +
                            '.associated-item { border-left: 5px solid #22c55e; }' +
                            '.available-item { border-left: 5px solid #6366f1; }' +
                            '.service-content { flex: 1; }' +
                            '.service-title { font-weight: 700; margin-bottom: 0.35rem; color: #1f2937; font-size: 0.9rem; line-height: 1.2; }' +
                            '.service-code { font-size: 0.75rem; color: #6b7280; background: #f3f4f6; padding: 0.2rem 0.4rem; border-radius: 4px; display: inline-block; }' +
                            '.service-actions { margin-left: 1rem; }' +
                            '.move-btn { background: linear-gradient(135deg, #f59e0b, #d97706); color: white; border: none; border-radius: 6px; padding: 0.4rem 0.6rem; cursor: pointer; transition: all 0.2s ease; font-weight: 600; min-width: 36px; height: 32px; display: flex; align-items: center; justify-content: center; }' +
                            '.move-btn:hover { background: linear-gradient(135deg, #d97706, #b45309); transform: scale(1.05); }' +
                            '.transfer-controls { display: flex; flex-direction: column; gap: 1rem; }' +
                            '.transfer-btn { background: linear-gradient(135deg, #8b5cf6, #7c3aed); color: white; border: none; border-radius: 12px; width: 50px; height: 50px; cursor: pointer; transition: all 0.2s ease; font-size: 1.2rem; }' +
                            '.transfer-btn:hover { background: linear-gradient(135deg, #7c3aed, #6d28d9); transform: scale(1.1); }' +
                            '.empty-state { text-align: center; color: #9ca3af; font-style: italic; padding: 3rem 1rem; font-size: 1rem; }' +
                            '.services-list.drag-over { border-color: #f59e0b; background: rgba(251, 191, 36, 0.1); }' +
                            '.modal-wide { max-width: 95vw; width: 1300px; }' +
                            '</style>';

                        resultsArea.innerHTML = html;

                        // Guardar los servicios para el botón "Servicios"
                        serviciosCargadosNuevos = servicios;
                    }

                    // ==================== FUNCIONES DE DRAG & DROP PARA SERVICIOS ====================

                    let draggedServiceElement = null;

                    function dragService(event) {
                        // Buscar el elemento service-item más cercano
                        draggedServiceElement = event.target.closest('.service-item');
                        if (!draggedServiceElement) return;

                        event.dataTransfer.effectAllowed = 'move';
                        event.dataTransfer.setData('text/plain', draggedServiceElement.getAttribute('data-service-id'));

                        // Añadir clase visual de arrastre
                        draggedServiceElement.classList.add('dragging');

                        console.log('Iniciando drag de servicio:', draggedServiceElement.getAttribute('data-service-name'));
                    }

                    function allowDropService(event) {
                        event.preventDefault();
                        event.dataTransfer.dropEffect = 'move';

                        // Añadir efecto visual a la zona de drop
                        const dropZone = event.target.closest('.services-list');
                        if (dropZone) {
                            dropZone.classList.add('drag-over');
                        }
                    }

                    function dropService(event, targetType) {
                        event.preventDefault();

                        // Quitar efecto visual
                        const dropZone = event.target.closest('.services-list');
                        if (dropZone) {
                            dropZone.classList.remove('drag-over');
                        }

                        if (draggedServiceElement) {
                            const serviceId = draggedServiceElement.getAttribute('data-service-id');
                            const serviceName = draggedServiceElement.getAttribute('data-service-name');

                            console.log('Drop servicio en:', targetType, 'servicio:', serviceName);

                            // Verificar si realmente necesitamos mover
                            const isInAssociated = draggedServiceElement.classList.contains('associated-item');
                            const shouldBeAssociated = (targetType === 'associated');

                            if (isInAssociated !== shouldBeAssociated) {
                                console.log('Moviendo servicio de', isInAssociated ? 'asociados' : 'disponibles', 'a', targetType);

                                // Quitar clase de arrastre
                                draggedServiceElement.classList.remove('dragging');

                                // Mover directamente
                                moveServiceDirectly(draggedServiceElement, targetType);
                            } else {
                                console.log('El servicio ya está en la lista correcta');
                                draggedServiceElement.classList.remove('dragging');
                            }

                            draggedServiceElement = null;
                        }
                    }

                    function moveServiceDirectly(element, targetType) {
                        const serviceId = element.getAttribute('data-service-id');
                        const serviceName = element.getAttribute('data-service-name');

                        console.log('Moviendo directamente servicio:', serviceName, 'hacia:', targetType);

                        // Remover del lugar actual
                        element.remove();

                        // Crear nuevo elemento en el destino
                        let newHtml = '';
                        if (targetType === 'associated') {
                            newHtml = '<div class="service-item associated-item" draggable="true" ondragstart="dragService(event)" data-service-id="' + serviceId + '" data-service-name="' + serviceName + '">' +
                                '<div class="service-content">' +
                                '<div class="service-title">' + serviceName + '</div>' +
                                '<div class="service-code">Código: ' + serviceId + '</div>' +
                                '</div>' +
                                '<div class="service-actions">' +
                                '<button type="button" class="move-btn" onclick="moveServiceToAvailable(\'' + serviceId + '\', \'' + serviceName + '\')" title="Mover a disponibles">' +
                                '<i class="fas fa-arrow-right"></i>' +
                                '</button>' +
                                '</div>' +
                                '</div>';

                            const associatedList = document.getElementById('associatedServicesList');
                            // Quitar mensaje de vacío si existe
                            const emptyState = associatedList.querySelector('.empty-state');
                            if (emptyState) emptyState.remove();
                            associatedList.insertAdjacentHTML('beforeend', newHtml);

                            console.log('✓ ' + serviceName + ' asociado');

                        } else {
                            newHtml = '<div class="service-item available-item" draggable="true" ondragstart="dragService(event)" data-service-id="' + serviceId + '" data-service-name="' + serviceName + '">' +
                                '<div class="service-content">' +
                                '<div class="service-title">' + serviceName + '</div>' +
                                '<div class="service-code">Código: ' + serviceId + '</div>' +
                                '</div>' +
                                '<div class="service-actions">' +
                                '<button type="button" class="move-btn" onclick="moveServiceToAssociated(\'' + serviceId + '\', \'' + serviceName + '\')" title="Asociar servicio">' +
                                '<i class="fas fa-arrow-left"></i>' +
                                '</button>' +
                                '</div>' +
                                '</div>';

                            const availableList = document.getElementById('availableServicesList');
                            // Quitar mensaje de vacío si existe
                            const emptyState = availableList.querySelector('.empty-state');
                            if (emptyState) emptyState.remove();
                            availableList.insertAdjacentHTML('beforeend', newHtml);

                            console.log('◯ ' + serviceName + ' quitado de asociaciones');
                        }

                        // Verificar estados vacíos y actualizar contadores
                        checkEmptyStatesServices();
                        updateServiceCounters();
                    }

                    // Agregar evento para quitar la clase cuando termine el drag de servicios
                    document.addEventListener('dragend', function (event) {
                        if (event.target.closest('.service-item')) {
                            event.target.closest('.service-item').classList.remove('dragging');
                        }
                    });

                    function moveServiceToAssociated(serviceId, serviceName) {
                        console.log('Botón clicked - Moviendo servicio a asociados:', serviceId, serviceName);

                        const serviceElement = document.querySelector('[data-service-id="' + serviceId + '"]');
                        if (serviceElement) {
                            moveServiceDirectly(serviceElement, 'associated');
                        } else {
                            console.error('No se encontró el elemento servicio con ID:', serviceId);
                        }
                    }

                    function moveServiceToAvailable(serviceId, serviceName) {
                        console.log('Botón clicked - Moviendo servicio a disponibles:', serviceId, serviceName);

                        const serviceElement = document.querySelector('[data-service-id="' + serviceId + '"]');
                        if (serviceElement) {
                            moveServiceDirectly(serviceElement, 'available');
                        } else {
                            console.error('No se encontró el elemento servicio con ID:', serviceId);
                        }
                    }

                    function checkEmptyStatesServices() {
                        const associatedList = document.getElementById('associatedServicesList');
                        const availableList = document.getElementById('availableServicesList');

                        // Verificar lista de asociados
                        if (associatedList && associatedList.querySelectorAll('.service-item').length === 0) {
                            if (!associatedList.querySelector('.empty-state')) {
                                associatedList.innerHTML = '<div class="empty-state">No hay servicios asociados</div>';
                            }
                        }

                        // Verificar lista de disponibles  
                        if (availableList && availableList.querySelectorAll('.service-item').length === 0) {
                            if (!availableList.querySelector('.empty-state')) {
                                availableList.innerHTML = '<div class="empty-state">Todos los servicios están asociados</div>';
                            }
                        }
                    }

                    function associateAllServices() {
                        const availableItems = document.querySelectorAll('.available-item[data-service-id]');
                        availableItems.forEach(item => {
                            const serviceId = item.getAttribute('data-service-id');
                            const serviceName = item.getAttribute('data-service-name');
                            moveServiceToAssociated(serviceId, serviceName);
                        });
                    }

                    function dissociateAllServices() {
                        const associatedItems = document.querySelectorAll('.associated-item[data-service-id]');
                        associatedItems.forEach(item => {
                            const serviceId = item.getAttribute('data-service-id');
                            const serviceName = item.getAttribute('data-service-name');
                            moveServiceToAvailable(serviceId, serviceName);
                        });
                    }

                    function updateServiceCounters() {
                        const associatedCount = document.querySelectorAll('.associated-item[data-service-id]').length;
                        const availableCount = document.querySelectorAll('.available-item[data-service-id]').length;

                        const associatedHeader = document.querySelector('.associated-header h4');
                        const availableHeader = document.querySelector('.available-header h4');

                        if (associatedHeader) {
                            associatedHeader.innerHTML = '<i class="fas fa-check-circle"></i> Servicios Asociados (' + associatedCount + ')';
                            associatedHeader.style.color = 'white';
                        }

                        if (availableHeader) {
                            availableHeader.innerHTML = '<i class="fas fa-plus-circle"></i> Servicios Disponibles (' + availableCount + ')';
                            availableHeader.style.color = 'white';
                        }

                        console.log('Contadores de servicios actualizados - Asociados:', associatedCount, 'Disponibles:', availableCount);
                    }

                    // Funciones para búsqueda y paginación de productos
                    function buscarProductos(event) {
                        event.preventDefault();

                        const searchTerm = document.getElementById('buscarProducto').value.trim();

                        // Construir URL con parámetros
                        const params = new URLSearchParams();
                        if (searchTerm !== '') {
                            params.set('buscarProducto', searchTerm);
                        }
                        params.set('page', '1'); // Reset to first page on new search
                        params.set('pageSize', document.getElementById('pageSizeSelectProducts')?.value || '10');

                        window.location.href = '<%= request.getContextPath() %>/LoadProducts?' + params.toString();
                        return false;
                    }

                    function limpiarBusquedaProductos() {
                        document.getElementById('buscarProducto').value = '';
                        window.location.href = '<%= request.getContextPath() %>/LoadProducts';
                    }

                    function goToPageProducts(page) {
                        const searchTerm = document.getElementById('buscarProducto')?.value.trim() || '';

                        const params = new URLSearchParams();
                        if (searchTerm !== '') {
                            params.set('buscarProducto', searchTerm);
                        }
                        params.set('page', page);
                        params.set('pageSize', document.getElementById('pageSizeSelectProducts')?.value || '10');

                        window.location.href = '<%= request.getContextPath() %>/LoadProducts?' + params.toString();
                    }

                    function changePageSizeProducts(size) {
                        const searchTerm = document.getElementById('buscarProducto')?.value.trim() || '';

                        const params = new URLSearchParams();
                        if (searchTerm !== '') {
                            params.set('buscarProducto', searchTerm);
                        }
                        params.set('pageSize', size);
                        params.set('page', '1'); // Reset to first page

                        window.location.href = '<%= request.getContextPath() %>/LoadProducts?' + params.toString();
                    }

                    function guardarNuevoProducto() {
                        const productName = document.getElementById('newProductName').value.trim();

                        if (!productName) {
                            alert('Por favor, ingrese el nombre del producto');
                            document.getElementById('newProductName').focus();
                            return;
                        }

                        if (conceptosSeleccionados.length === 0 && serviciosSeleccionados.length === 0) {
                            if (!confirm('No ha seleccionado ningún concepto ni servicio. ¿Desea continuar creando el producto sin asociaciones?')) {
                                return;
                            }
                        }

                        // Preparar datos para enviar al backend
                        const conceptosString = conceptosSeleccionados.map(c => c.nombre).join(';');
                        const serviciosString = serviciosSeleccionados.map(s => s.nombre).join(';');

                        // Mostrar loading en el botón
                        const saveBtn = document.getElementById('saveProductBtn');
                        const originalText = saveBtn.innerHTML;
                        saveBtn.innerHTML = '<div class="spinner"></div> Creando...';
                        saveBtn.disabled = true;

                        // Preparar datos para el POST con URLSearchParams
                        const params = new URLSearchParams();
                        params.append('descripcion', productName);
                        params.append('conceptos', conceptosString);
                        params.append('servicios', serviciosString);

                        console.log('Enviando datos:', {
                            descripcion: productName,
                            conceptos: conceptosString,
                            servicios: serviciosString
                        });

                        // Llamar al backend
                        fetch('<%= request.getContextPath() %>/CreateProduct', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: params
                        })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    console.log('Producto "' + productName + '" creado exitosamente');
                                    cerrarModalCrearProducto();

                                    // Recargar la página para mostrar el nuevo producto
                                    setTimeout(() => {
                                        window.location.reload();
                                    }, 1500);
                                } else {
                                    alert('Error al crear el producto: ' + (data.message || 'Error desconocido'));
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                alert('Error al crear el producto. Intente nuevamente.');
                            })
                            .finally(() => {
                                // Restaurar botón
                                saveBtn.innerHTML = originalText;
                                saveBtn.disabled = false;
                            });
                    }

                    // Modal functions
                    function showErrorModal(message) {
                        const modal = document.getElementById('errorModal');
                        const messageElement = document.querySelector('#errorModal .error-modal-message');
                        messageElement.textContent = message;
                        modal.classList.add('show');
                    }

                    function hideErrorModal() {
                        const modal = document.getElementById('errorModal');
                        modal.classList.remove('show');
                    }

                    function showSuccessModal(message, onConfirm, showClearOption = false) {
                        const modal = document.getElementById('successModal');
                        const messageElement = document.querySelector('#successModal .success-modal-message');
                        const actionsContainer = document.querySelector('#successModal .success-modal-actions');

                        messageElement.textContent = message;

                        if (showClearOption) {
                            actionsContainer.innerHTML = `
                                <button type="button" class="success-modal-btn success-secondary-btn" onclick="hideSuccessModal()">
                                    <i class="fas fa-times"></i>
                                    Mantener Datos
                                </button>
                                <button type="button" class="success-modal-btn success-primary-btn" onclick="confirmSuccessAction()">
                                    <i class="fas fa-trash-alt"></i>
                                    Limpiar Formulario
                                </button>
                            `;
                            window.successModalCallback = onConfirm;
                        } else {
                            actionsContainer.innerHTML = `
                                <button type="button" class="success-modal-btn success-primary-btn" onclick="hideSuccessModal()">
                                    <i class="fas fa-check"></i>
                                    Entendido
                                </button>
                            `;
                        }

                        modal.classList.add('show');
                    }

                    function hideSuccessModal() {
                        const modal = document.getElementById('successModal');
                        modal.classList.remove('show');
                    }

                    function confirmSuccessAction() {
                        hideSuccessModal();
                        if (window.successModalCallback) {
                            window.successModalCallback();
                            window.successModalCallback = null;
                        }
                    }

                    // Logout modal functions
                    function showLogoutModal() {
                        const modal = document.getElementById('logoutModal');
                        modal.classList.add('show');
                        return false; // Prevent default link behavior
                    }

                    function hideLogoutModal() {
                        const modal = document.getElementById('logoutModal');
                        modal.classList.remove('show');
                    }

                    function confirmLogout() {
                        window.location.href = '${pageContext.request.contextPath}/auth/logout';
                    }

                    // Close modal when clicking outside
                    document.addEventListener('click', function (e) {
                        const logoutModal = document.getElementById('logoutModal');
                        const errorModal = document.getElementById('errorModal');
                        const successModal = document.getElementById('successModal');

                        if (e.target === logoutModal) {
                            hideLogoutModal();
                        } else if (e.target === errorModal) {
                            hideErrorModal();
                        } else if (e.target === successModal) {
                            hideSuccessModal();
                        }
                    });

                    // Close modal with Escape key
                    document.addEventListener('keydown', function (e) {
                        if (e.key === 'Escape') {
                            const logoutModal = document.getElementById('logoutModal');
                            const errorModal = document.getElementById('errorModal');
                            const successModal = document.getElementById('successModal');

                            if (logoutModal.classList.contains('show')) {
                                hideLogoutModal();
                            } else if (errorModal.classList.contains('show')) {
                                hideErrorModal();
                            } else if (successModal.classList.contains('show')) {
                                hideSuccessModal();
                            }
                        }
                    });

                </script>

                <!-- Error Modal -->
                <div id="errorModal" class="error-modal-overlay">
                    <div class="error-modal">
                        <div class="error-modal-header">
                            <div class="error-modal-icon">
                                <i class="fas fa-exclamation-triangle"></i>
                            </div>
                            <h3 class="error-modal-title">Error</h3>
                        </div>
                        <div class="error-modal-body">
                            <p class="error-modal-message">
                                Mensaje de error aquí
                            </p>
                            <div class="error-modal-actions">
                                <button type="button" class="error-modal-btn" onclick="hideErrorModal()">
                                    <i class="fas fa-check"></i>
                                    Entendido
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Success Modal -->
                <div id="successModal" class="success-modal-overlay">
                    <div class="success-modal">
                        <div class="success-modal-header">
                            <div class="success-modal-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <h3 class="success-modal-title">¡Éxito!</h3>
                        </div>
                        <div class="success-modal-body">
                            <p class="success-modal-message">
                                Operación realizada exitosamente
                            </p>
                            <div class="success-modal-actions">
                                <button type="button" class="success-modal-btn success-primary-btn"
                                    onclick="hideSuccessModal()">
                                    <i class="fas fa-check"></i>
                                    Entendido
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Logout Confirmation Modal -->
                <div id="logoutModal" class="logout-modal-overlay">
                    <div class="logout-modal">
                        <div class="logout-modal-header">
                            <div class="logout-modal-icon">
                                <i class="fas fa-sign-out-alt"></i>
                            </div>
                            <h3 class="logout-modal-title">Cerrar Sesión</h3>
                        </div>
                        <div class="logout-modal-body">
                            <p class="logout-modal-message">
                                ¿Está seguro que desea cerrar su sesión?<br>
                                <span style="font-size: 0.9rem; opacity: 0.8;">Se perderán los datos no
                                    guardados.</span>
                            </p>
                            <div class="logout-modal-actions">
                                <button type="button" class="logout-modal-btn logout-cancel-btn"
                                    onclick="hideLogoutModal()">
                                    <i class="fas fa-times"></i>
                                    Cancelar
                                </button>
                                <button type="button" class="logout-modal-btn logout-confirm-btn"
                                    onclick="confirmLogout()">
                                    <i class="fas fa-sign-out-alt"></i>
                                    Salir
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>