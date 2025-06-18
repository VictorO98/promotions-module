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

                    .nav-menu {
                        display: flex;
                        gap: 0.5rem;
                        list-style: none;
                        flex-wrap: wrap;
                    }

                    .nav-item {
                        position: relative;
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
                                                        <th><i class="fas fa-store"></i> Mercado</th>
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
                                    <div class="form-group">
                                        <label for="tipoCliente" class="form-label">
                                            <i class="fas fa-user"></i>
                                            Tipo de Cliente
                                        </label>
                                        <select id="tipoCliente" name="tipoCliente" class="form-input">
                                            <option value="">Seleccione tipo de cliente</option>
                                            <option value="residencial">Residencial</option>
                                            <option value="comercial">Comercial</option>
                                            <option value="empresarial">Empresarial</option>
                                            <option value="corporativo">Corporativo</option>
                                        </select>
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
                                                <option value="META">META</option>
                                                <option value="CUNDINAMARCA">CUNDINAMARCA</option>
                                                <option value="ANTIOQUIA">ANTIOQUIA</option>
                                                <option value="VALLE">VALLE DEL CAUCA</option>
                                                <option value="ATLANTICO">ATLÁNTICO</option>
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
                                                <i class="fas fa-store"></i>
                                                Mercado
                                            </label>
                                            <select id="mercado" name="mercado" class="form-input">
                                                <option value="">Selección Mercado</option>
                                                <option value="RESIDENCIAL">RESIDENCIAL</option>
                                                <option value="COMERCIAL">COMERCIAL</option>
                                                <option value="EMPRESARIAL">EMPRESARIAL</option>
                                                <option value="CORPORATIVO">CORPORATIVO</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="tipoPlan" class="form-label">
                                                <i class="fas fa-layer-group"></i>
                                                Tipo Plan
                                            </label>
                                            <select id="tipoPlan" name="tipoPlan" class="form-input">
                                                <option value="">Selección Tipo Plan</option>
                                                <option value="INTERNET">INTERNET</option>
                                                <option value="TV">TELEVISIÓN</option>
                                                <option value="COMBO">COMBO</option>
                                                <option value="TELEFONIA">TELEFONÍA</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="codigoExterno" class="form-label">
                                                <i class="fas fa-barcode"></i>
                                                Código Externo
                                            </label>
                                            <input type="text" id="codigoExterno" name="codigoExterno"
                                                class="form-input" placeholder="Ej: PROMO 10 2012">
                                        </div>

                                        <div class="form-group">
                                            <label for="periodicidad" class="form-label">
                                                <i class="fas fa-calendar-alt"></i>
                                                Periodicidad
                                            </label>
                                            <select id="periodicidad" name="periodicidad" class="form-input">
                                                <option value="">Seleccione Periodicidad</option>
                                                <option value="MENSUAL">Mensual</option>
                                                <option value="BIMENSUAL">Bimensual</option>
                                                <option value="TRIMESTRAL">Trimestral</option>
                                                <option value="SEMESTRAL">Semestral</option>
                                                <option value="ANUAL">Anual</option>
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
                                    <button type="button" class="btn btn-secondary" onclick="clearPromotionForm()">
                                        <i class="fas fa-eraser"></i>
                                        Limpiar Formulario
                                    </button>
                                    <button type="button" class="btn btn-warning" onclick="loadExistingPromotion()">
                                        <i class="fas fa-search"></i>
                                        Cargar Promoción
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
                                                                    onclick="verDetalleProducto('${producto.tiposervcodi}', '${producto.paradesc}')">
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
                        <div class="modal-content">
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
                        <div class="modal-content" style="max-width: 900px; max-height: 90vh; overflow-y: auto;">
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
                                                maxlength="100">
                                        </div>

                                        <!-- Sección de Asociaciones -->
                                        <div class="association-section">
                                            <h4><i class="fas fa-link"></i> Asociar al Producto</h4>
                                            <p
                                                style="color: var(--text-secondary); font-size: 0.9rem; margin-bottom: 1rem; text-align: center;">
                                                <i class="fas fa-info-circle"></i> Seleccione los conceptos y servicios
                                                que desea asociar al nuevo producto.
                                            </p>

                                            <div class="association-buttons">
                                                <button type="button" class="btn btn-primary btn-association"
                                                    onclick="cargarConceptosParaCrear()">
                                                    <i class="fas fa-lightbulb"></i>
                                                    Seleccionar Conceptos
                                                </button>
                                                <button type="button" class="btn btn-secondary btn-association"
                                                    onclick="cargarServiciosParaCrear()">
                                                    <i class="fas fa-cogs"></i>
                                                    Seleccionar Servicios
                                                </button>
                                            </div>

                                            <!-- Área de resultados -->
                                            <div class="association-results" id="createAssociationResults">
                                                <div class="no-association">
                                                    <i class="fas fa-info-circle"></i>
                                                    <p>Haga clic en "Seleccionar Conceptos" o "Seleccionar Servicios"
                                                        para elegir las asociaciones</p>
                                                </div>
                                            </div>

                                            <!-- Resumen de selecciones -->
                                            <div id="selectionSummary" style="display: none; margin-top: 1.5rem;">
                                                <div
                                                    style="background: var(--background-color); padding: 1rem; border-radius: 8px; border: 1px solid var(--border-color);">
                                                    <h5 style="color: var(--primary-color); margin-bottom: 1rem;">
                                                        <i class="fas fa-check-circle"></i> Elementos Seleccionados
                                                    </h5>
                                                    <div id="selectedConceptos" style="margin-bottom: 0.5rem;"></div>
                                                    <div id="selectedServicios"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" onclick="cerrarModalCrearProducto()">
                                    <i class="fas fa-times"></i>
                                    Cancelar
                                </button>
                                <button type="button" class="btn btn-primary" onclick="guardarNuevoProducto()"
                                    id="saveProductBtn">
                                    <i class="fas fa-save"></i>
                                    Crear Producto
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
                            alert('No hay datos para exportar. Realice una consulta primero.');
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
                        showAlert('Generando archivo CSV...', 'info');

                        // Probar con window.location primero en lugar de window.open
                        try {
                            console.log('Intentando navegar a:', exportUrl);
                            console.log('Ejecutando window.location.href...');
                            window.location.href = exportUrl;
                            console.log('window.location.href ejecutado');
                        } catch (error) {
                            console.error('Error al exportar:', error);
                            alert('Error al exportar: ' + error.message);
                        }
                    }

                    // Funciones exportToPDF y testExport eliminadas - solo mantenemos exportToCSV

                    function showAlert(message, type) {
                        const alertDiv = document.createElement('div');
                        alertDiv.className = 'alert alert-' + type;
                        alertDiv.innerHTML = '<i class="fas fa-exclamation-triangle"></i> ' + message;

                        const form = document.querySelector('.search-form');
                        form.insertBefore(alertDiv, form.firstChild);

                        setTimeout(() => {
                            alertDiv.remove();
                        }, 5000);
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
                            showAlert('Por favor, ingrese un número de servicio para buscar.', 'warning');
                            document.getElementById('numeroServicio').focus();
                            return;
                        }

                        // Show loading state
                        showServiceLoading(true);

                        // Simulate API call - Replace with actual service call
                        setTimeout(() => {
                            const mockServiceData = {
                                cliente: 'Juan Pérez García',
                                direccion: 'Calle 123 #45-67, Bogotá',
                                estado: 'Activo',
                                plan: 'Internet 100MB + TV Digital'
                            };

                            displayServiceInfo(mockServiceData);
                            loadAvailablePromotions(numeroServicio);
                        }, 1000);
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

                        var statusClass = data.estado === 'Activo' ? 'status-active' : 'status-inactive';

                        serviceInfo.innerHTML = '<div class="info-card">' +
                            '<h4><i class="fas fa-info-circle"></i> Información del Servicio</h4>' +
                            '<div class="info-grid">' +
                            '<div class="info-item">' +
                            '<label>Cliente:</label>' +
                            '<span>' + data.cliente + '</span>' +
                            '</div>' +
                            '<div class="info-item">' +
                            '<label>Dirección:</label>' +
                            '<span>' + data.direccion + '</span>' +
                            '</div>' +
                            '<div class="info-item">' +
                            '<label>Estado:</label>' +
                            '<span class="status-badge ' + statusClass + '">' + data.estado + '</span>' +
                            '</div>' +
                            '<div class="info-item">' +
                            '<label>Plan:</label>' +
                            '<span>' + data.plan + '</span>' +
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
                        const tipoCliente = document.getElementById('tipoCliente').value;

                        if (numeroServicio === '') {
                            showAlert('Por favor, ingrese un número de servicio.', 'warning');
                            return false;
                        }

                        if (selectedPromotionId === null) {
                            showAlert('Por favor, seleccione una promoción para asociar.', 'warning');
                            return false;
                        }

                        // Show loading state on assign button
                        const assignBtn = document.getElementById('assignBtn');
                        const originalText = assignBtn.innerHTML;
                        assignBtn.innerHTML = '<div class="spinner"></div> Asignando...';
                        assignBtn.disabled = true;

                        // Simulate API call for association - Replace with actual service call
                        setTimeout(() => {
                            showAlert('Promoción asociada exitosamente al servicio ' + numeroServicio, 'success');

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
                        }, 2000);

                        return false;
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
                    function loadLocalidades() {
                        const departamento = document.getElementById('departamento').value;
                        const localidadSelect = document.getElementById('localidad');

                        // Clear current options
                        localidadSelect.innerHTML = '<option value="">Selección Localidad</option>';

                        if (departamento === '') return;

                        // Mock data - Replace with actual API call
                        const localidadesPorDepartamento = {
                            'META': ['Villavicencio', 'Acacías', 'Granada', 'San Martín'],
                            'CUNDINAMARCA': ['Bogotá', 'Soacha', 'Chía', 'Zipaquirá'],
                            'ANTIOQUIA': ['Medellín', 'Bello', 'Itagüí', 'Envigado'],
                            'VALLE': ['Cali', 'Palmira', 'Buenaventura', 'Cartago'],
                            'ATLANTICO': ['Barranquilla', 'Soledad', 'Malambo', 'Sabanalarga']
                        };

                        const localidades = localidadesPorDepartamento[departamento] || [];
                        localidades.forEach(localidad => {
                            const option = document.createElement('option');
                            option.value = localidad;
                            option.textContent = localidad;
                            localidadSelect.appendChild(option);
                        });
                    }

                    let detailRowCounter = 0;

                    function addPromotionDetail() {
                        detailRowCounter++;
                        const tbody = document.getElementById('promotionDetailsBody');

                        const row = document.createElement('tr');
                        row.id = 'detail-row-' + detailRowCounter;

                        row.innerHTML = '<td>' +
                            '<input type="date" class="details-input" name="fechaInicio_' + detailRowCounter + '">' +
                            '</td>' +
                            '<td>' +
                            '<input type="date" class="details-input" name="fechaFinalizacion_' + detailRowCounter + '">' +
                            '</td>' +
                            '<td>' +
                            '<input type="number" class="details-input" name="tiempoAplicacion_' + detailRowCounter + '" placeholder="Días" min="1">' +
                            '</td>' +
                            '<td>' +
                            '<input type="number" class="details-input" name="porcentajeDesc_' + detailRowCounter + '" placeholder="%" min="0" max="100" step="0.01">' +
                            '</td>' +
                            '<td>' +
                            '<input type="number" class="details-input" name="valorDesc_' + detailRowCounter + '" placeholder="Valor" min="0" step="0.01">' +
                            '</td>' +
                            '<td>' +
                            '<select class="details-select" name="tipoProducto_' + detailRowCounter + '">' +
                            '<option value="">Seleccione</option>' +
                            '<option value="INTERNET">Internet</option>' +
                            '<option value="TV">Televisión</option>' +
                            '<option value="TELEFONIA">Telefonía</option>' +
                            '<option value="COMBO">Combo</option>' +
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
                            '<button type="button" class="btn-action btn-edit" onclick="editDetailRow(' + detailRowCounter + ')" title="Editar">' +
                            '<i class="fas fa-edit"></i>' +
                            '</button>' +
                            '<button type="button" class="btn-action btn-delete" onclick="deleteDetailRow(' + detailRowCounter + ')" title="Eliminar">' +
                            '<i class="fas fa-trash"></i>' +
                            '</button>' +
                            '</div>' +
                            '</td>';

                        tbody.appendChild(row);
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
                        }
                    }

                    function submitPromotionForm(event) {
                        event.preventDefault();

                        const descripcion = document.getElementById('descripcionPromocion').value.trim();
                        const departamento = document.getElementById('departamento').value;

                        if (descripcion === '') {
                            showAlert('Por favor, ingrese la descripción de la promoción.', 'warning');
                            return false;
                        }

                        if (departamento === '') {
                            showAlert('Por favor, seleccione un departamento.', 'warning');
                            return false;
                        }

                        // Validate details table has at least one row
                        const detailsRows = document.querySelectorAll('#promotionDetailsBody tr');
                        if (detailsRows.length === 0) {
                            showAlert('Por favor, agregue al menos un detalle de promoción.', 'warning');
                            return false;
                        }

                        // Show loading state on save button
                        const saveBtn = event.target.querySelector('button[type="submit"]');
                        const originalText = saveBtn.innerHTML;
                        saveBtn.innerHTML = '<div class="spinner"></div> Guardando...';
                        saveBtn.disabled = true;

                        // Simulate API call for saving promotion - Replace with actual service call
                        setTimeout(() => {
                            showAlert('Promoción guardada exitosamente', 'success');

                            // Reset button
                            saveBtn.innerHTML = originalText;
                            saveBtn.disabled = false;
                        }, 2000);

                        return false;
                    }

                    function clearPromotionForm() {
                        if (confirm('¿Está seguro que desea limpiar el formulario? Se perderán todos los datos ingresados.')) {
                            document.querySelector('.promotion-management-form').reset();
                            document.getElementById('promotionDetailsBody').innerHTML = '';
                            detailRowCounter = 0;
                            showAlert('Formulario limpiado correctamente', 'info');
                        }
                    }

                    function loadExistingPromotion() {
                        const codigoPromocion = prompt('Ingrese el código de la promoción a cargar:');

                        if (!codigoPromocion || codigoPromocion.trim() === '') {
                            return;
                        }

                        // Show loading message
                        showAlert('Cargando promoción...', 'info');

                        // Simulate API call for loading promotion - Replace with actual service call
                        setTimeout(() => {
                            // Mock data
                            const mockPromotion = {
                                descripcion: 'DESCUENTO 33.02% CONCEPTO CONSUMO LOCAL',
                                departamento: 'META',
                                localidad: 'Villavicencio',
                                mercado: 'RESIDENCIAL',
                                tipoPlan: 'INTERNET',
                                codigoExterno: 'PROMO 10 2012',
                                periodicidad: 'MENSUAL',
                                estado: 'INACTIVO'
                            };

                            // Fill form with loaded data
                            document.getElementById('descripcionPromocion').value = mockPromotion.descripcion;
                            document.getElementById('departamento').value = mockPromotion.departamento;
                            loadLocalidades(); // Load localities for selected department
                            setTimeout(() => {
                                document.getElementById('localidad').value = mockPromotion.localidad;
                            }, 100);
                            document.getElementById('mercado').value = mockPromotion.mercado;
                            document.getElementById('tipoPlan').value = mockPromotion.tipoPlan;
                            document.getElementById('codigoExterno').value = mockPromotion.codigoExterno;
                            document.getElementById('periodicidad').value = mockPromotion.periodicidad;
                            document.getElementById('estadoPromocion').value = mockPromotion.estado;

                            // Clear existing details and add mock detail
                            document.getElementById('promotionDetailsBody').innerHTML = '';
                            detailRowCounter = 0;
                            addPromotionDetail();

                            // Fill the detail row with mock data
                            const detailRow = document.querySelector('#promotionDetailsBody tr:last-child');
                            detailRow.querySelector('[name^="fechaInicio"]').value = '2012-02-01';
                            detailRow.querySelector('[name^="fechaFinalizacion"]').value = '2017-12-31';
                            detailRow.querySelector('[name^="tiempoAplicacion"]').value = '15';
                            detailRow.querySelector('[name^="porcentajeDesc"]').value = '33.02';
                            detailRow.querySelector('[name^="valorDesc"]').value = '0';
                            detailRow.querySelector('[name^="tipoProducto"]').value = 'INTERNET';
                            detailRow.querySelector('[name^="retencion"]').checked = true;
                            detailRow.querySelector('[name^="activo"]').checked = true;
                            detailRow.querySelector('[name^="index"]').value = '1';
                            detailRow.querySelector('[name^="confIndex"]').value = '1';

                            showAlert('Promoción cargada exitosamente', 'success');
                        }, 1500);
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

                            showAlert('Consulta realizada exitosamente. Se encontraron ' + reportsData.length + ' registros.', 'success');
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

                            showAlert('Formulario limpiado correctamente', 'info');
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
                    let currentProductCode = null;
                    let currentProductName = null;
                    let originalConceptos = [];
                    let originalServicios = [];
                    let conceptosCargados = false;
                    let serviciosCargados = false;

                    function verDetalleProducto(codigo, nombre) {
                        currentProductCode = codigo;
                        currentProductName = nombre;

                        // Actualizar información del producto en el modal
                        document.getElementById('productNameModal').textContent = nombre;
                        document.getElementById('productCodeModal').textContent = 'Código: ' + codigo;

                        // Actualizar información extra (puedes personalizar estos datos según tu lógica)
                        const today = new Date();
                        const formattedDate = today.toLocaleDateString('es-ES');
                        document.getElementById('productDateCreated').textContent = 'Último acceso: ' + formattedDate;

                        // Mostrar modal
                        document.getElementById('productDetailModal').style.display = 'flex';
                        document.body.style.overflow = 'hidden'; // Prevenir scroll del body

                        // Precargar automáticamente los conceptos
                        precargarDatosProducto();
                    }

                    function cerrarDetalleProducto() {
                        document.getElementById('productDetailModal').style.display = 'none';
                        document.body.style.overflow = 'auto'; // Restaurar scroll del body

                        // Limpiar variables globales
                        currentProductCode = null;
                        currentProductName = null;
                        originalConceptos = [];
                        originalServicios = [];
                        conceptosCargados = false;
                        serviciosCargados = false;

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
                        const resultsArea = document.getElementById('associationResults');

                        // Actualizar estado de botones
                        actualizarEstadoBotones('conceptos');

                        // Si ya están cargados, solo mostrarlos
                        if (conceptosCargados && originalConceptos.length > 0) {
                            displayConceptos(originalConceptos);
                            return;
                        }

                        // Mostrar loading
                        resultsArea.innerHTML = '<div class="loading-message">' +
                            '<div class="spinner"></div>' +
                            '<p>Cargando conceptos...</p>' +
                            '</div>';

                        // Llamada real al backend
                        const url = '<%= request.getContextPath() %>/LoadProductAssociations?type=conceptos&productCode=' + currentProductCode;
                        console.log('Cargando conceptos desde:', url);

                        fetch(url)
                            .then(response => response.json())
                            .then(conceptos => {
                                console.log('Conceptos recibidos:', conceptos);
                                originalConceptos = conceptos; // Guardar datos originales
                                conceptosCargados = true; // Marcar como cargados
                                displayConceptos(conceptos);
                            })
                            .catch(error => {
                                console.error('Error cargando conceptos:', error);
                                resultsArea.innerHTML = '<div class="no-association">' +
                                    '<i class="fas fa-exclamation-triangle"></i>' +
                                    '<p>Error cargando conceptos. Intente nuevamente.</p>' +
                                    '</div>';
                            });
                    }

                    function mostrarServicios() {
                        const resultsArea = document.getElementById('associationResults');

                        // Actualizar estado de botones
                        actualizarEstadoBotones('servicios');

                        // Si ya están cargados, solo mostrarlos
                        if (serviciosCargados && originalServicios.length > 0) {
                            displayServicios(originalServicios);
                            return;
                        }

                        // Mostrar loading
                        resultsArea.innerHTML = '<div class="loading-message">' +
                            '<div class="spinner"></div>' +
                            '<p>Cargando servicios...</p>' +
                            '</div>';

                        // Llamada real al backend
                        const url = '<%= request.getContextPath() %>/LoadProductAssociations?type=servicios&productCode=' + currentProductCode;
                        console.log('Cargando servicios desde:', url);

                        fetch(url)
                            .then(response => response.json())
                            .then(servicios => {
                                console.log('Servicios recibidos:', servicios);
                                originalServicios = servicios; // Guardar datos originales
                                serviciosCargados = true; // Marcar como cargados
                                displayServicios(servicios);
                            })
                            .catch(error => {
                                console.error('Error cargando servicios:', error);
                                resultsArea.innerHTML = '<div class="no-association">' +
                                    '<i class="fas fa-exclamation-triangle"></i>' +
                                    '<p>Error cargando servicios. Intente nuevamente.</p>' +
                                    '</div>';
                            });
                    }

                    function displayConceptos(conceptos) {
                        const resultsArea = document.getElementById('associationResults');

                        if (conceptos.length === 0) {
                            resultsArea.innerHTML = '<div class="no-association">' +
                                '<i class="fas fa-exclamation-triangle"></i>' +
                                '<p>No se encontraron conceptos disponibles</p>' +
                                '</div>';
                            return;
                        }

                        // Campo de búsqueda
                        let conceptosHtml = '<div class="search-filter-container">' +
                            '<div class="search-filter-input">' +
                            '<i class="fas fa-search"></i>' +
                            '<input type="text" id="searchConceptos" placeholder="Buscar conceptos..." ' +
                            'oninput="filtrarConceptos()" autocomplete="off">' +
                            '<button type="button" class="clear-search-btn" onclick="limpiarBusquedaConceptos()" style="display: none;">' +
                            '<i class="fas fa-times"></i>' +
                            '</button>' +
                            '</div>' +
                            '</div>';

                        // Botón Asociar Todo
                        conceptosHtml += '<div class="associate-all-container">' +
                            '<button type="button" class="btn btn-warning btn-associate-all" onclick="asociarTodosConceptos()">' +
                            '<i class="fas fa-plus-circle"></i>' +
                            'Asociar Todos los Conceptos' +
                            '</button>' +
                            '</div>';

                        conceptosHtml += '<div class="concepts-list">';
                        for (let i = 0; i < conceptos.length; i++) {
                            const concepto = conceptos[i];
                            const buttonClass = concepto.asociado ? 'btn-associated' : 'btn-associate';
                            const buttonText = concepto.asociado ? 'Asociado' : 'Asociar';
                            const buttonIcon = concepto.asociado ? 'fas fa-check' : 'fas fa-plus';
                            const buttonAction = concepto.asociado ? '' : 'onclick="asociarConcepto(' + concepto.id + ', \'' + concepto.nombre + '\')"';

                            conceptosHtml += '<div class="concept-item">' +
                                '<div class="item-info">' +
                                '<div class="item-name">' + concepto.nombre + '</div>' +
                                '<div class="item-description">' + concepto.descripcion + '</div>' +
                                '</div>' +
                                '<div class="item-actions">' +
                                '<button type="button" class="' + buttonClass + '" ' + buttonAction + '>' +
                                '<i class="' + buttonIcon + '"></i>' +
                                buttonText +
                                '</button>' +
                                '</div>' +
                                '</div>';
                        }
                        conceptosHtml += '</div>';

                        resultsArea.innerHTML = conceptosHtml;
                    }

                    function displayServicios(servicios) {
                        const resultsArea = document.getElementById('associationResults');

                        if (servicios.length === 0) {
                            resultsArea.innerHTML = '<div class="no-association">' +
                                '<i class="fas fa-exclamation-triangle"></i>' +
                                '<p>No se encontraron servicios disponibles</p>' +
                                '</div>';
                            return;
                        }

                        // Campo de búsqueda
                        let serviciosHtml = '<div class="search-filter-container">' +
                            '<div class="search-filter-input">' +
                            '<i class="fas fa-search"></i>' +
                            '<input type="text" id="searchServicios" placeholder="Buscar servicios..." ' +
                            'oninput="filtrarServicios()" autocomplete="off">' +
                            '<button type="button" class="clear-search-btn" onclick="limpiarBusquedaServicios()" style="display: none;">' +
                            '<i class="fas fa-times"></i>' +
                            '</button>' +
                            '</div>' +
                            '</div>';

                        // Botón Asociar Todo
                        serviciosHtml += '<div class="associate-all-container">' +
                            '<button type="button" class="btn btn-warning btn-associate-all" onclick="asociarTodosServicios()">' +
                            '<i class="fas fa-plus-circle"></i>' +
                            'Asociar Todos los Servicios' +
                            '</button>' +
                            '</div>';

                        serviciosHtml += '<div class="services-list">';
                        for (let i = 0; i < servicios.length; i++) {
                            const servicio = servicios[i];
                            const buttonClass = servicio.asociado ? 'btn-associated' : 'btn-associate';
                            const buttonText = servicio.asociado ? 'Asociado' : 'Asociar';
                            const buttonIcon = servicio.asociado ? 'fas fa-check' : 'fas fa-plus';
                            const buttonAction = servicio.asociado ? '' : 'onclick="asociarServicio(' + servicio.id + ', \'' + servicio.nombre + '\')"';

                            serviciosHtml += '<div class="service-item">' +
                                '<div class="item-info">' +
                                '<div class="item-name">' + servicio.nombre + '</div>' +
                                '<div class="item-description">' + servicio.descripcion + '</div>' +
                                '</div>' +
                                '<div class="item-actions">' +
                                '<button type="button" class="' + buttonClass + '" ' + buttonAction + '>' +
                                '<i class="' + buttonIcon + '"></i>' +
                                buttonText +
                                '</button>' +
                                '</div>' +
                                '</div>';
                        }
                        serviciosHtml += '</div>';

                        resultsArea.innerHTML = serviciosHtml;
                    }

                    function asociarConcepto(conceptoId, conceptoNombre) {
                        if (confirm('¿Está seguro que desea asociar el concepto "' + conceptoNombre + '" al producto "' + currentProductName + '"?')) {
                            // Aquí harías la llamada al backend para asociar
                            console.log('Asociando concepto', conceptoId, 'al producto', currentProductCode);

                            showAlert('Concepto "' + conceptoNombre + '" asociado exitosamente', 'success');

                            // Recargar conceptos para mostrar el cambio
                            setTimeout(() => {
                                mostrarConceptos();
                            }, 1000);
                        }
                    }

                    function asociarServicio(servicioId, servicioNombre) {
                        if (confirm('¿Está seguro que desea asociar el servicio "' + servicioNombre + '" al producto "' + currentProductName + '"?')) {
                            // Aquí harías la llamada al backend para asociar
                            console.log('Asociando servicio', servicioId, 'al producto', currentProductCode);

                            showAlert('Servicio "' + servicioNombre + '" asociado exitosamente', 'success');

                            // Recargar servicios para mostrar el cambio
                            setTimeout(() => {
                                mostrarServicios();
                            }, 1000);
                        }
                    }

                    function asociarTodosConceptos() {
                        if (confirm('¿Está seguro que desea asociar TODOS los conceptos al producto "' + currentProductName + '"?')) {
                            // Aquí harías la llamada al backend para asociar todos
                            console.log('Asociando todos los conceptos al producto', currentProductCode);

                            showAlert('Todos los conceptos han sido asociados exitosamente', 'success');

                            // Recargar conceptos para mostrar el cambio
                            setTimeout(() => {
                                mostrarConceptos();
                            }, 1000);
                        }
                    }

                    function asociarTodosServicios() {
                        if (confirm('¿Está seguro que desea asociar TODOS los servicios al producto "' + currentProductName + '"?')) {
                            // Aquí harías la llamada al backend para asociar todos
                            console.log('Asociando todos los servicios al producto', currentProductCode);

                            showAlert('Todos los servicios han sido asociados exitosamente', 'success');

                            // Recargar servicios para mostrar el cambio
                            setTimeout(() => {
                                mostrarServicios();
                            }, 1000);
                        }
                    }

                    // Cerrar modal con ESC
                    document.addEventListener('keydown', function (event) {
                        if (event.key === 'Escape') {
                            cerrarDetalleProducto();
                        }
                    });

                    // Funciones de filtrado para conceptos y servicios
                    function filtrarConceptos() {
                        const searchInput = document.getElementById('searchConceptos');
                        const clearBtn = searchInput.parentElement.querySelector('.clear-search-btn');
                        const searchTerm = searchInput.value.toLowerCase().trim();

                        // Mostrar/ocultar botón de limpiar
                        if (searchTerm) {
                            clearBtn.style.display = 'flex';
                        } else {
                            clearBtn.style.display = 'none';
                        }

                        // Filtrar conceptos
                        const conceptosFiltrados = originalConceptos.filter(concepto =>
                            concepto.nombre.toLowerCase().includes(searchTerm) ||
                            concepto.descripcion.toLowerCase().includes(searchTerm)
                        );

                        // Mostrar solo la lista filtrada (mantener el buscador y botón "Asociar Todo")
                        actualizarListaConceptos(conceptosFiltrados);
                    }

                    function filtrarServicios() {
                        const searchInput = document.getElementById('searchServicios');
                        const clearBtn = searchInput.parentElement.querySelector('.clear-search-btn');
                        const searchTerm = searchInput.value.toLowerCase().trim();

                        // Mostrar/ocultar botón de limpiar
                        if (searchTerm) {
                            clearBtn.style.display = 'flex';
                        } else {
                            clearBtn.style.display = 'none';
                        }

                        // Filtrar servicios
                        const serviciosFiltrados = originalServicios.filter(servicio =>
                            servicio.nombre.toLowerCase().includes(searchTerm) ||
                            servicio.descripcion.toLowerCase().includes(searchTerm)
                        );

                        // Mostrar solo la lista filtrada (mantener el buscador y botón "Asociar Todo")
                        actualizarListaServicios(serviciosFiltrados);
                    }

                    function limpiarBusquedaConceptos() {
                        const searchInput = document.getElementById('searchConceptos');
                        const clearBtn = searchInput.parentElement.querySelector('.clear-search-btn');

                        searchInput.value = '';
                        clearBtn.style.display = 'none';

                        // Mostrar todos los conceptos
                        actualizarListaConceptos(originalConceptos);
                        searchInput.focus();
                    }

                    function limpiarBusquedaServicios() {
                        const searchInput = document.getElementById('searchServicios');
                        const clearBtn = searchInput.parentElement.querySelector('.clear-search-btn');

                        searchInput.value = '';
                        clearBtn.style.display = 'none';

                        // Mostrar todos los servicios
                        actualizarListaServicios(originalServicios);
                        searchInput.focus();
                    }

                    function actualizarListaConceptos(conceptos) {
                        const conceptsList = document.querySelector('.concepts-list');

                        if (!conceptsList) return;

                        if (conceptos.length === 0) {
                            conceptsList.innerHTML = '<div class="no-association" style="padding: 2rem;">' +
                                '<i class="fas fa-search"></i>' +
                                '<p>No se encontraron conceptos que coincidan con la búsqueda</p>' +
                                '</div>';
                            return;
                        }

                        let conceptosHtml = '';
                        for (let i = 0; i < conceptos.length; i++) {
                            const concepto = conceptos[i];
                            const buttonClass = concepto.asociado ? 'btn-associated' : 'btn-associate';
                            const buttonText = concepto.asociado ? 'Asociado' : 'Asociar';
                            const buttonIcon = concepto.asociado ? 'fas fa-check' : 'fas fa-plus';
                            const buttonAction = concepto.asociado ? '' : 'onclick="asociarConcepto(' + concepto.id + ', \'' + concepto.nombre + '\')"';

                            conceptosHtml += '<div class="concept-item">' +
                                '<div class="item-info">' +
                                '<div class="item-name">' + concepto.nombre + '</div>' +
                                '<div class="item-description">' + concepto.descripcion + '</div>' +
                                '</div>' +
                                '<div class="item-actions">' +
                                '<button type="button" class="' + buttonClass + '" ' + buttonAction + '>' +
                                '<i class="' + buttonIcon + '"></i>' +
                                buttonText +
                                '</button>' +
                                '</div>' +
                                '</div>';
                        }

                        conceptsList.innerHTML = conceptosHtml;
                    }

                    function actualizarListaServicios(servicios) {
                        const servicesList = document.querySelector('.services-list');

                        if (!servicesList) return;

                        if (servicios.length === 0) {
                            servicesList.innerHTML = '<div class="no-association" style="padding: 2rem;">' +
                                '<i class="fas fa-search"></i>' +
                                '<p>No se encontraron servicios que coincidan con la búsqueda</p>' +
                                '</div>';
                            return;
                        }

                        let serviciosHtml = '';
                        for (let i = 0; i < servicios.length; i++) {
                            const servicio = servicios[i];
                            const buttonClass = servicio.asociado ? 'btn-associated' : 'btn-associate';
                            const buttonText = servicio.asociado ? 'Asociado' : 'Asociar';
                            const buttonIcon = servicio.asociado ? 'fas fa-check' : 'fas fa-plus';
                            const buttonAction = servicio.asociado ? '' : 'onclick="asociarServicio(' + servicio.id + ', \'' + servicio.nombre + '\')"';

                            serviciosHtml += '<div class="service-item">' +
                                '<div class="item-info">' +
                                '<div class="item-name">' + servicio.nombre + '</div>' +
                                '<div class="item-description">' + servicio.descripcion + '</div>' +
                                '</div>' +
                                '<div class="item-actions">' +
                                '<button type="button" class="' + buttonClass + '" ' + buttonAction + '>' +
                                '<i class="' + buttonIcon + '"></i>' +
                                buttonText +
                                '</button>' +
                                '</div>' +
                                '</div>';
                        }

                        servicesList.innerHTML = serviciosHtml;
                    }

                    // Variables para el modal de crear producto
                    let conceptosDisponiblesCrear = [];
                    let serviciosDisponiblesCrear = [];
                    let conceptosSeleccionados = [];
                    let serviciosSeleccionados = [];

                    // Funciones para el modal de crear producto
                    function abrirModalCrearProducto() {
                        document.getElementById('createProductModal').style.display = 'flex';
                        document.body.style.overflow = 'hidden';

                        // Limpiar formulario
                        document.getElementById('newProductName').value = '';
                        conceptosSeleccionados = [];
                        serviciosSeleccionados = [];
                        actualizarResumenSelecciones();

                        // Resetear área de resultados
                        document.getElementById('createAssociationResults').innerHTML =
                            '<div class="no-association">' +
                            '<i class="fas fa-info-circle"></i>' +
                            '<p>Haga clic en "Seleccionar Conceptos" o "Seleccionar Servicios" para elegir las asociaciones</p>' +
                            '</div>';
                    }

                    function cerrarModalCrearProducto() {
                        document.getElementById('createProductModal').style.display = 'none';
                        document.body.style.overflow = 'auto';

                        // Limpiar variables
                        conceptosDisponiblesCrear = [];
                        serviciosDisponiblesCrear = [];
                        conceptosSeleccionados = [];
                        serviciosSeleccionados = [];
                    }

                    function cargarConceptosParaCrear() {
                        const resultsArea = document.getElementById('createAssociationResults');

                        // Actualizar botones
                        actualizarBotonesCrear('conceptos');

                        // Mostrar loading
                        resultsArea.innerHTML = '<div class="loading-message">' +
                            '<div class="spinner"></div>' +
                            '<p>Cargando conceptos...</p>' +
                            '</div>';

                        // Cargar conceptos desde el backend
                        const url = '<%= request.getContextPath() %>/LoadProductAssociations?type=conceptos&productCode=new';
                        fetch(url)
                            .then(response => response.json())
                            .then(conceptos => {
                                conceptosDisponiblesCrear = conceptos;
                                mostrarConceptosParaSeleccionar(conceptos);
                            })
                            .catch(error => {
                                console.error('Error cargando conceptos:', error);
                                resultsArea.innerHTML = '<div class="no-association">' +
                                    '<i class="fas fa-exclamation-triangle"></i>' +
                                    '<p>Error cargando conceptos. Intente nuevamente.</p>' +
                                    '</div>';
                            });
                    }

                    function cargarServiciosParaCrear() {
                        const resultsArea = document.getElementById('createAssociationResults');

                        // Actualizar botones
                        actualizarBotonesCrear('servicios');

                        // Mostrar loading
                        resultsArea.innerHTML = '<div class="loading-message">' +
                            '<div class="spinner"></div>' +
                            '<p>Cargando servicios...</p>' +
                            '</div>';

                        // Cargar servicios desde el backend
                        const url = '<%= request.getContextPath() %>/LoadProductAssociations?type=servicios&productCode=new';
                        fetch(url)
                            .then(response => response.json())
                            .then(servicios => {
                                serviciosDisponiblesCrear = servicios;
                                mostrarServiciosParaSeleccionar(servicios);
                            })
                            .catch(error => {
                                console.error('Error cargando servicios:', error);
                                resultsArea.innerHTML = '<div class="no-association">' +
                                    '<i class="fas fa-exclamation-triangle"></i>' +
                                    '<p>Error cargando servicios. Intente nuevamente.</p>' +
                                    '</div>';
                            });
                    }

                    function actualizarBotonesCrear(tipoActivo) {
                        const conceptosBtn = document.querySelector('[onclick="cargarConceptosParaCrear()"]');
                        const serviciosBtn = document.querySelector('[onclick="cargarServiciosParaCrear()"]');

                        if (conceptosBtn && serviciosBtn) {
                            if (tipoActivo === 'conceptos') {
                                conceptosBtn.classList.remove('btn-secondary');
                                conceptosBtn.classList.add('btn-primary');
                                serviciosBtn.classList.remove('btn-primary');
                                serviciosBtn.classList.add('btn-secondary');
                            } else if (tipoActivo === 'servicios') {
                                serviciosBtn.classList.remove('btn-secondary');
                                serviciosBtn.classList.add('btn-primary');
                                conceptosBtn.classList.remove('btn-primary');
                                conceptosBtn.classList.add('btn-secondary');
                            }
                        }
                    }

                    function mostrarConceptosParaSeleccionar(conceptos) {
                        const resultsArea = document.getElementById('createAssociationResults');

                        if (conceptos.length === 0) {
                            resultsArea.innerHTML = '<div class="no-association">' +
                                '<i class="fas fa-exclamation-triangle"></i>' +
                                '<p>No se encontraron conceptos disponibles</p>' +
                                '</div>';
                            return;
                        }

                        let conceptosHtml = '<div class="concepts-list">';
                        for (let i = 0; i < conceptos.length; i++) {
                            const concepto = conceptos[i];
                            const isSelected = conceptosSeleccionados.some(c => c.id === concepto.id);
                            const buttonClass = isSelected ? 'btn-associated' : 'btn-associate';
                            const buttonText = isSelected ? 'Seleccionado' : 'Seleccionar';
                            const buttonIcon = isSelected ? 'fas fa-check' : 'fas fa-plus';

                            conceptosHtml += '<div class="concept-item">' +
                                '<div class="item-info">' +
                                '<div class="item-name">' + concepto.nombre + '</div>' +
                                '<div class="item-description">' + concepto.descripcion + '</div>' +
                                '</div>' +
                                '<div class="item-actions">' +
                                '<button type="button" class="' + buttonClass + '" onclick="toggleConceptoSeleccion(' + concepto.id + ', \'' + concepto.nombre + '\')">' +
                                '<i class="' + buttonIcon + '"></i>' +
                                buttonText +
                                '</button>' +
                                '</div>' +
                                '</div>';
                        }
                        conceptosHtml += '</div>';

                        resultsArea.innerHTML = conceptosHtml;
                    }

                    function mostrarServiciosParaSeleccionar(servicios) {
                        const resultsArea = document.getElementById('createAssociationResults');

                        if (servicios.length === 0) {
                            resultsArea.innerHTML = '<div class="no-association">' +
                                '<i class="fas fa-exclamation-triangle"></i>' +
                                '<p>No se encontraron servicios disponibles</p>' +
                                '</div>';
                            return;
                        }

                        let serviciosHtml = '<div class="services-list">';
                        for (let i = 0; i < servicios.length; i++) {
                            const servicio = servicios[i];
                            const isSelected = serviciosSeleccionados.some(s => s.id === servicio.id);
                            const buttonClass = isSelected ? 'btn-associated' : 'btn-associate';
                            const buttonText = isSelected ? 'Seleccionado' : 'Seleccionar';
                            const buttonIcon = isSelected ? 'fas fa-check' : 'fas fa-plus';

                            serviciosHtml += '<div class="service-item">' +
                                '<div class="item-info">' +
                                '<div class="item-name">' + servicio.nombre + '</div>' +
                                '<div class="item-description">' + servicio.descripcion + '</div>' +
                                '</div>' +
                                '<div class="item-actions">' +
                                '<button type="button" class="' + buttonClass + '" onclick="toggleServicioSeleccion(' + servicio.id + ', \'' + servicio.nombre + '\')">' +
                                '<i class="' + buttonIcon + '"></i>' +
                                buttonText +
                                '</button>' +
                                '</div>' +
                                '</div>';
                        }
                        serviciosHtml += '</div>';

                        resultsArea.innerHTML = serviciosHtml;
                    }

                    function toggleConceptoSeleccion(conceptoId, conceptoNombre) {
                        const index = conceptosSeleccionados.findIndex(c => c.id === conceptoId);

                        if (index === -1) {
                            // Agregar concepto
                            conceptosSeleccionados.push({ id: conceptoId, nombre: conceptoNombre });
                        } else {
                            // Remover concepto
                            conceptosSeleccionados.splice(index, 1);
                        }

                        // Actualizar vista
                        mostrarConceptosParaSeleccionar(conceptosDisponiblesCrear);
                        actualizarResumenSelecciones();
                    }

                    function toggleServicioSeleccion(servicioId, servicioNombre) {
                        const index = serviciosSeleccionados.findIndex(s => s.id === servicioId);

                        if (index === -1) {
                            // Agregar servicio
                            serviciosSeleccionados.push({ id: servicioId, nombre: servicioNombre });
                        } else {
                            // Remover servicio
                            serviciosSeleccionados.splice(index, 1);
                        }

                        // Actualizar vista
                        mostrarServiciosParaSeleccionar(serviciosDisponiblesCrear);
                        actualizarResumenSelecciones();
                    }

                    function actualizarResumenSelecciones() {
                        const summaryDiv = document.getElementById('selectionSummary');
                        const conceptosDiv = document.getElementById('selectedConceptos');
                        const serviciosDiv = document.getElementById('selectedServicios');

                        if (conceptosSeleccionados.length === 0 && serviciosSeleccionados.length === 0) {
                            summaryDiv.style.display = 'none';
                            return;
                        }

                        summaryDiv.style.display = 'block';

                        // Mostrar conceptos seleccionados
                        if (conceptosSeleccionados.length > 0) {
                            conceptosDiv.innerHTML = '<strong>Conceptos (' + conceptosSeleccionados.length + '):</strong> ' +
                                conceptosSeleccionados.map(c => c.nombre).join(', ');
                        } else {
                            conceptosDiv.innerHTML = '<strong>Conceptos:</strong> Ninguno seleccionado';
                        }

                        // Mostrar servicios seleccionados
                        if (serviciosSeleccionados.length > 0) {
                            serviciosDiv.innerHTML = '<strong>Servicios (' + serviciosSeleccionados.length + '):</strong> ' +
                                serviciosSeleccionados.map(s => s.nombre).join(', ');
                        } else {
                            serviciosDiv.innerHTML = '<strong>Servicios:</strong> Ninguno seleccionado';
                        }
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
                            showAlert('Por favor, ingrese el nombre del producto', 'warning');
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
                                    showAlert('Producto "' + productName + '" creado exitosamente', 'success');
                                    cerrarModalCrearProducto();

                                    // Recargar la página para mostrar el nuevo producto
                                    setTimeout(() => {
                                        window.location.reload();
                                    }, 1500);
                                } else {
                                    showAlert('Error al crear el producto: ' + (data.message || 'Error desconocido'), 'warning');
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                showAlert('Error al crear el producto. Intente nuevamente.', 'warning');
                            })
                            .finally(() => {
                                // Restaurar botón
                                saveBtn.innerHTML = originalText;
                                saveBtn.disabled = false;
                            });
                    }

                </script>
            </body>

            </html>