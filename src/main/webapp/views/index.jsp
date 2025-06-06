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
                        gap: 1rem;
                        justify-content: center;
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
                        font-size: 0.9rem;
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
                        padding: 1rem 0.75rem;
                        border-bottom: 1px solid var(--border-color);
                        vertical-align: middle;
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
                            min-width: 800px;
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
                    .product-management-container {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 2rem;
                        margin-bottom: 2rem;
                    }

                    .products-section,
                    .association-section {
                        background: var(--surface-color);
                        border-radius: var(--border-radius);
                        padding: 2rem;
                        border: 1px solid var(--border-color);
                    }

                    .products-header,
                    .association-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 2rem;
                        padding-bottom: 1rem;
                        border-bottom: 2px solid var(--border-color);
                    }

                    .products-header h3,
                    .association-header h3 {
                        font-size: 1.25rem;
                        font-weight: 700;
                        color: var(--primary-color);
                        display: flex;
                        align-items: center;
                        gap: 0.5rem;
                        margin: 0;
                    }

                    .products-navigation {
                        display: flex;
                        gap: 0.25rem;
                        align-items: center;
                        flex-wrap: wrap;
                    }

                    .nav-btn {
                        background: var(--primary-color);
                        color: white;
                        border: none;
                        padding: 0.5rem;
                        border-radius: 6px;
                        cursor: pointer;
                        transition: var(--transition);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        min-width: 36px;
                        height: 36px;
                        font-size: 0.875rem;
                    }

                    .nav-btn:hover {
                        background: var(--primary-dark);
                        transform: translateY(-1px);
                    }

                    .nav-btn:disabled {
                        opacity: 0.5;
                        cursor: not-allowed;
                        background: var(--border-color);
                    }

                    .nav-btn-special {
                        background: var(--success-color);
                        margin-left: 0.5rem;
                    }

                    .nav-btn-special:hover {
                        background: #059669;
                    }

                    .nav-info {
                        display: flex;
                        align-items: center;
                        gap: 0.25rem;
                        font-size: 0.875rem;
                        color: var(--text-secondary);
                        font-weight: 600;
                        margin: 0 0.5rem;
                        white-space: nowrap;
                    }

                    .product-details {
                        margin-top: 1.5rem;
                    }

                    .product-form {
                        width: 100%;
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

                    .product-actions {
                        grid-column: span 2;
                        display: flex;
                        justify-content: center;
                        gap: 1.5rem;
                        margin-top: 1rem;
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
                        display: grid;
                        grid-template-columns: 2fr 1fr;
                        gap: 2rem;
                        align-items: end;
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
                            grid-template-columns: 1fr;
                            gap: 1.5rem;
                        }

                        .input-with-clear {
                            flex-direction: column;
                            align-items: stretch;
                            gap: 0.75rem;
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
                                    <a href="#" class="nav-link ${showPromotions == 'true' ? 'active' : ''}"
                                        onclick="showSection('check_promotions')">
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
                                    <a href="#" class="nav-link" onclick="showSection('promotions_reports')">
                                        <i class="fas fa-chart-bar"></i>
                                        Reportes de Promociones
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link" onclick="showSection('product_management')">
                                        <i class="fas fa-box"></i>
                                        Gestión de Productos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link" onclick="showSection('assigned_promotions')">
                                        <i class="fas fa-link"></i>
                                        Promociones Asignadas
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
                                        <i class="fas fa-chart-bar"></i>
                                    </div>
                                    <h3>Reportes</h3>
                                    <p>Genera reportes detallados y análisis de promociones</p>
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
                                            <span class="required">*</span>
                                        </label>
                                        <input type="text" id="nombrePromocion" name="nombrePromocion"
                                            class="form-input" placeholder="Ej: Promo Navidad"
                                            value="${param.nombrePromocion}" required>
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
                                </div>
                            </form>

                            <div class="results-container" id="resultsContainer">
                                <c:choose>
                                    <c:when test="${recordCount > 0}">
                                        <div class="alert alert-success">
                                            <i class="fas fa-check-circle"></i>
                                            Se encontraron ${recordCount} promociones que coinciden con tu búsqueda
                                        </div>
                                        <div class="table-container">
                                            <table class="data-table">
                                                <thead>
                                                    <tr>
                                                        <th><i class="fas fa-hashtag"></i> Código</th>
                                                        <th><i class="fas fa-file-alt"></i> Descripción</th>
                                                        <th><i class="fas fa-building"></i> Departamento</th>
                                                        <th><i class="fas fa-map-marker-alt"></i> Localidad</th>
                                                        <th><i class="fas fa-layer-group"></i> Categoría</th>
                                                        <th><i class="fas fa-cogs"></i> Tipo Servicio</th>
                                                        <th><i class="fas fa-calendar"></i> Inicio</th>
                                                        <th><i class="fas fa-calendar"></i> Fin</th>
                                                        <th><i class="fas fa-toggle-on"></i> Estado</th>
                                                        <th><i class="fas fa-dollar-sign"></i> Valor</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${promotions}" var="promotion">
                                                        <tr>
                                                            <td><strong>${promotion.ticododi}</strong></td>
                                                            <td>${promotion.ticodesc}</td>
                                                            <td>${promotion.depadesc}</td>
                                                            <td>${promotion.locandmb}</td>
                                                            <td>${promotion.catedesc}</td>
                                                            <td>${promotion.pasedesc}</td>
                                                            <td>
                                                                <fmt:formatDate value="${promotion.cocofein}"
                                                                    pattern="dd/MM/yyyy" />
                                                            </td>
                                                            <td>
                                                                <fmt:formatDate value="${promotion.cocofefi}"
                                                                    pattern="dd/MM/yyyy" />
                                                            </td>
                                                            <td>
                                                                <span
                                                                    class="status-badge ${promotion.ticoactive == 'S' ? 'status-active' : 'status-inactive'}">
                                                                    ${promotion.ticoactive == 'S' ? 'Activo' :
                                                                    'Inactivo'}
                                                                </span>
                                                            </td>
                                                            <td><strong>$${promotion.cocoval}</strong></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:when>
                                    <c:when test="${param.nombrePromocion != null && recordCount == 0}">
                                        <div class="alert alert-warning">
                                            <i class="fas fa-exclamation-triangle"></i>
                                            No se encontraron promociones que coincidan con los criterios de búsqueda
                                            especificados
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="alert alert-info">
                                            <i class="fas fa-info-circle"></i>
                                            Ingresa el nombre de la promoción para comenzar la búsqueda
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

                    <!-- Promotions Reports Section -->
                    <div id="promotions_reports" class="section">
                        <div class="content-container">
                            <div class="section-header">
                                <i class="fas fa-chart-bar"></i>
                                <h2>Reportes de Promociones</h2>
                            </div>

                            <form class="reports-form" onsubmit="return submitReportsForm(event)">
                                <!-- Reports Filters -->
                                <div class="reports-filters">
                                    <div class="form-grid-reports">
                                        <div class="form-group">
                                            <label for="usuarioReporte" class="form-label">
                                                <i class="fas fa-user"></i>
                                                Usuario
                                            </label>
                                            <input type="text" id="usuarioReporte" name="usuarioReporte"
                                                class="form-input" placeholder="Código de usuario">
                                        </div>

                                        <div class="form-group">
                                            <label for="nombreUsuarioReporte" class="form-label">
                                                <i class="fas fa-user-tag"></i>
                                                Nombre Usuario
                                            </label>
                                            <input type="text" id="nombreUsuarioReporte" name="nombreUsuarioReporte"
                                                class="form-input" placeholder="Nombre completo del usuario">
                                        </div>

                                        <div class="form-group full-width-reports">
                                            <label for="nombrePromocionReporte" class="form-label">
                                                <i class="fas fa-tag"></i>
                                                Nombre Promoción
                                            </label>
                                            <input type="text" id="nombrePromocionReporte" name="nombrePromocionReporte"
                                                class="form-input" placeholder="Nombre de la promoción">
                                        </div>

                                        <div class="form-group">
                                            <label for="vigenciaInicioReporte" class="form-label">
                                                <i class="fas fa-calendar-alt"></i>
                                                Vigencia Promoción - Inicio
                                            </label>
                                            <div class="date-input-wrapper">
                                                <input type="date" id="vigenciaInicioReporte"
                                                    name="vigenciaInicioReporte" class="form-input">
                                                <i class="fas fa-calendar date-icon"></i>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="vigenciaFinReporte" class="form-label">
                                                <i class="fas fa-calendar-alt"></i>
                                                Fin
                                            </label>
                                            <div class="date-input-wrapper">
                                                <input type="date" id="vigenciaFinReporte" name="vigenciaFinReporte"
                                                    class="form-input">
                                                <i class="fas fa-calendar date-icon"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Action Buttons -->
                                <div class="reports-actions">
                                    <div class="primary-actions">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-search"></i>
                                            Consultar
                                        </button>
                                        <button type="button" class="btn btn-secondary" onclick="clearReportsForm()">
                                            <i class="fas fa-eraser"></i>
                                            Limpiar Campos
                                        </button>
                                    </div>
                                    <div class="export-actions">
                                        <button type="button" class="btn btn-success" onclick="exportToCSV()">
                                            <i class="fas fa-file-csv"></i>
                                            Exportar CSV
                                        </button>
                                        <button type="button" class="btn btn-warning" onclick="exportToPDF()">
                                            <i class="fas fa-file-pdf"></i>
                                            Exportar PDF / XLS
                                        </button>
                                    </div>
                                </div>
                            </form>

                            <!-- Reports Results -->
                            <div class="reports-results" id="reportsResults">
                                <div class="results-section">
                                    <div class="section-title">
                                        <h3><i class="fas fa-table"></i> Promociones</h3>
                                        <div class="pagination-info">
                                            <span id="recordsInfo">0 de 0</span>
                                            <div class="pagination-controls">
                                                <button type="button" class="pagination-btn" onclick="firstPage()"
                                                    title="Primera página">
                                                    <i class="fas fa-angle-double-left"></i>
                                                </button>
                                                <button type="button" class="pagination-btn" onclick="previousPage()"
                                                    title="Página anterior">
                                                    <i class="fas fa-angle-left"></i>
                                                </button>
                                                <span class="current-page">1</span>
                                                <button type="button" class="pagination-btn" onclick="nextPage()"
                                                    title="Página siguiente">
                                                    <i class="fas fa-angle-right"></i>
                                                </button>
                                                <button type="button" class="pagination-btn" onclick="lastPage()"
                                                    title="Última página">
                                                    <i class="fas fa-angle-double-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="reports-table-container">
                                        <table class="reports-table" id="reportsTable">
                                            <thead>
                                                <tr>
                                                    <th>Código Promoción</th>
                                                    <th>Nombre Promoción</th>
                                                    <th>Departamento</th>
                                                    <th>Localidad</th>
                                                    <th>Mercado</th>
                                                    <th>Estrato</th>
                                                    <th>Tipo Plan</th>
                                                </tr>
                                            </thead>
                                            <tbody id="reportsTableBody">
                                                <tr>
                                                    <td colspan="7" class="no-data">
                                                        <div class="no-data-message">
                                                            <i class="fas fa-search"></i>
                                                            <p>Realice una consulta para ver los resultados</p>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Management Section -->
                    <div id="product_management" class="section">
                        <div class="content-container">
                            <div class="section-header">
                                <i class="fas fa-box"></i>
                                <h2>Gestión de Productos</h2>
                            </div>

                            <div class="product-management-container">
                                <!-- Products List Section -->
                                <div class="products-section">
                                    <div class="products-header">
                                        <h3><i class="fas fa-boxes"></i> Productos</h3>
                                        <div class="products-navigation">
                                            <button type="button" class="nav-btn" onclick="firstProduct()"
                                                title="Primer producto">
                                                <i class="fas fa-angle-double-left"></i>
                                            </button>
                                            <button type="button" class="nav-btn" onclick="previousProduct()"
                                                title="Producto anterior">
                                                <i class="fas fa-angle-left"></i>
                                            </button>
                                            <span class="nav-info">
                                                <span id="currentProductIndex">1</span> de <span
                                                    id="totalProducts">0</span>
                                            </span>
                                            <button type="button" class="nav-btn" onclick="nextProduct()"
                                                title="Producto siguiente">
                                                <i class="fas fa-angle-right"></i>
                                            </button>
                                            <button type="button" class="nav-btn" onclick="lastProduct()"
                                                title="Último producto">
                                                <i class="fas fa-angle-double-right"></i>
                                            </button>
                                            <button type="button" class="nav-btn nav-btn-special"
                                                onclick="addNewProduct()" title="Agregar producto">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                            <button type="button" class="nav-btn nav-btn-special"
                                                onclick="saveProduct()" title="Guardar producto">
                                                <i class="fas fa-save"></i>
                                            </button>
                                        </div>
                                    </div>

                                    <!-- Product Details -->
                                    <div class="product-details">
                                        <div class="product-form">
                                            <div class="form-group">
                                                <label for="nombreProducto" class="form-label">
                                                    <i class="fas fa-tag"></i>
                                                    Nombre Producto
                                                    <span class="required">*</span>
                                                </label>
                                                <input type="text" id="nombreProducto" name="nombreProducto"
                                                    class="form-input" placeholder="Ej: Banda Ancha" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Association Section -->
                                <div class="association-section">
                                    <div class="association-header">
                                        <h3><i class="fas fa-link"></i> Asociar</h3>
                                    </div>

                                    <div class="association-buttons">
                                        <button type="button" class="btn btn-primary btn-association"
                                            onclick="manageConceptos()">
                                            <i class="fas fa-lightbulb"></i>
                                            Conceptos
                                        </button>
                                        <button type="button" class="btn btn-secondary btn-association"
                                            onclick="manageServicios()">
                                            <i class="fas fa-cogs"></i>
                                            Servicios
                                        </button>
                                    </div>

                                    <!-- Association Results -->
                                    <div class="association-results" id="associationResults">
                                        <div class="no-association">
                                            <i class="fas fa-info-circle"></i>
                                            <p>Seleccione "Conceptos" o "Servicios" para gestionar las asociaciones del
                                                producto actual</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Product Actions -->
                                <div class="product-actions">
                                    <button type="button" class="btn btn-success" onclick="loadProducts()">
                                        <i class="fas fa-refresh"></i>
                                        Cargar Productos
                                    </button>
                                    <button type="button" class="btn btn-warning" onclick="deleteProduct()">
                                        <i class="fas fa-trash"></i>
                                        Eliminar Producto
                                    </button>
                                    <button type="button" class="btn btn-info" onclick="clearProductForm()">
                                        <i class="fas fa-eraser"></i>
                                        Limpiar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Assigned Promotions Section -->
                    <div id="assigned_promotions" class="section">
                        <div class="content-container">
                            <div class="section-header">
                                <i class="fas fa-link"></i>
                                <h2>Promociones Asignadas</h2>
                            </div>

                            <div class="assigned-promotions-container">
                                <form class="assigned-form" onsubmit="return consultarPromocionesAsignadas(event)">
                                    <!-- Service and Client Info -->
                                    <div class="service-client-section">
                                        <div class="form-group">
                                            <label for="numeroServicioAsignado" class="form-label">
                                                <i class="fas fa-phone"></i>
                                                Número de Servicio o Suscripción
                                                <span class="required">*</span>
                                            </label>
                                            <input type="text" id="numeroServicioAsignado" name="numeroServicioAsignado"
                                                class="form-input"
                                                placeholder="Ingrese número de servicio o suscripción" required>
                                        </div>

                                        <div class="client-type-section">
                                            <label for="tipoClienteAsignado" class="form-label">
                                                <i class="fas fa-user-tag"></i>
                                                Tipo de Cliente
                                            </label>
                                            <div class="input-with-clear">
                                                <select id="tipoClienteAsignado" name="tipoClienteAsignado"
                                                    class="form-input">
                                                    <option value="">Seleccione tipo de cliente</option>
                                                    <option value="RESIDENCIAL">Residencial</option>
                                                    <option value="COMERCIAL">Comercial</option>
                                                    <option value="EMPRESARIAL">Empresarial</option>
                                                    <option value="CORPORATIVO">Corporativo</option>
                                                    <option value="GOBIERNO">Gobierno</option>
                                                </select>
                                                <button type="button" class="clear-btn" onclick="clearClientType()">
                                                    Limpiar
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Promotions Display Section -->
                                    <div class="promotions-display-section">
                                        <div class="promotions-header">
                                            <h3><i class="fas fa-tags"></i> Promociones</h3>
                                        </div>

                                        <div class="promotions-display-area" id="promocionesAsignadasArea">
                                            <div class="no-promotions-assigned">
                                                <i class="fas fa-search"></i>
                                                <p>Ingrese un número de servicio y presione "Consultar" para ver las
                                                    promociones asignadas</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Form Actions -->
                                    <div class="assigned-actions">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-search"></i>
                                            Consultar
                                        </button>
                                        <button type="button" class="btn btn-secondary" onclick="cancelarConsulta()">
                                            <i class="fas fa-times"></i>
                                            Cancelar
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>

                <footer
                    style="background: var(--text-primary); color: white; text-align: center; padding: 2rem; margin-top: 4rem;">
                    <p>&copy; 2025 Promociones - Todos los derechos reservados</p>
                </footer>

                <script>
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
                        event.target.classList.add('active');

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

                        const nombrePromocion = document.getElementById('nombrePromocion').value.trim();

                        if (nombrePromocion === '') {
                            showAlert('Por favor, ingrese el nombre de la promoción para realizar la búsqueda.', 'warning');
                            document.getElementById('nombrePromocion').focus();
                            return false;
                        }

                        // Show loading state
                        showLoadingState();

                        // Submit form via window location to stay in same tab
                        const form = event.target;
                        const formData = new FormData(form);
                        const params = new URLSearchParams(formData);

                        window.location.href = '<%= request.getContextPath() %>/LoadPromotions?' + params.toString();

                        return false;
                    }

                    function clearForm() {
                        document.getElementById('nombrePromocion').value = '';
                        document.getElementById('vigenciaInicio').value = '';
                        document.getElementById('vigenciaFin').value = '';

                        // Navigate to clean state
                        window.location.href = '<%= request.getContextPath() %>/views/index.jsp';
                    }

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

                    // Auto-show promotions section if there are search results
                    document.addEventListener('DOMContentLoaded', function () {
                        var showPromotions = '<c:out value="${showPromotions}" default="false"/>';
                        if (showPromotions === 'true') {
                            showSection('check_promotions');
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

                    function exportToCSV() {
                        if (reportsData.length === 0) {
                            showAlert('No hay datos para exportar. Realice una consulta primero.', 'warning');
                            return;
                        }

                        showAlert('Generando archivo CSV...', 'info');

                        // Simulate CSV export
                        setTimeout(() => {
                            let csvContent = 'Código Promoción,Nombre Promoción,Departamento,Localidad,Mercado,Estrato,Tipo Plan\n';

                            reportsData.forEach(item => {
                                csvContent += item.codigo + ',' +
                                    '"' + item.nombre + '",' +
                                    item.departamento + ',' +
                                    item.localidad + ',' +
                                    item.mercado + ',' +
                                    item.estrato + ',' +
                                    item.tipoPlan + '\n';
                            });

                            // Create and download file
                            const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
                            const link = document.createElement('a');
                            link.href = URL.createObjectURL(blob);
                            link.download = 'reporte_promociones_' + new Date().toISOString().split('T')[0] + '.csv';
                            link.click();

                            showAlert('Archivo CSV descargado exitosamente', 'success');
                        }, 1000);
                    }

                    function exportToPDF() {
                        if (reportsData.length === 0) {
                            showAlert('No hay datos para exportar. Realice una consulta primero.', 'warning');
                            return;
                        }

                        showAlert('Generando archivo PDF...', 'info');

                        // Simulate PDF export
                        setTimeout(() => {
                            showAlert('Funcionalidad de exportación PDF/XLS en desarrollo. Use la exportación CSV por el momento.', 'warning');
                        }, 1000);
                    }

                    // Product Management Functions
                    let products = [];
                    let currentProductIndex = 0;

                    function loadProducts() {
                        showAlert('Cargando productos...', 'info');

                        // Simulate API call - Replace with actual service call
                        setTimeout(() => {
                            products = [
                                { id: 1, nombre: 'Banda Ancha' },
                                { id: 2, nombre: 'Televisión Digital' },
                                { id: 3, nombre: 'Telefonía Fija' },
                                { id: 4, nombre: 'Combo Triple Play' },
                                { id: 5, nombre: 'Internet Empresarial' }
                            ];

                            currentProductIndex = 0;
                            updateProductNavigation();
                            displayCurrentProduct();

                            showAlert('Se cargaron ' + products.length + ' productos exitosamente', 'success');
                        }, 1000);
                    }

                    function updateProductNavigation() {
                        document.getElementById('currentProductIndex').textContent = products.length > 0 ? currentProductIndex + 1 : 0;
                        document.getElementById('totalProducts').textContent = products.length;

                        // Update navigation buttons state
                        const navBtns = document.querySelectorAll('.nav-btn');
                        navBtns[0].disabled = currentProductIndex === 0 || products.length === 0; // First
                        navBtns[1].disabled = currentProductIndex === 0 || products.length === 0; // Previous
                        navBtns[2].disabled = currentProductIndex >= products.length - 1 || products.length === 0; // Next
                        navBtns[3].disabled = currentProductIndex >= products.length - 1 || products.length === 0; // Last
                    }

                    function displayCurrentProduct() {
                        const nombreProducto = document.getElementById('nombreProducto');

                        if (products.length > 0 && currentProductIndex >= 0 && currentProductIndex < products.length) {
                            nombreProducto.value = products[currentProductIndex].nombre;
                        } else {
                            nombreProducto.value = '';
                        }

                        // Clear association results
                        clearAssociationResults();
                    }

                    function firstProduct() {
                        if (products.length > 0) {
                            currentProductIndex = 0;
                            updateProductNavigation();
                            displayCurrentProduct();
                        }
                    }

                    function previousProduct() {
                        if (currentProductIndex > 0) {
                            currentProductIndex--;
                            updateProductNavigation();
                            displayCurrentProduct();
                        }
                    }

                    function nextProduct() {
                        if (currentProductIndex < products.length - 1) {
                            currentProductIndex++;
                            updateProductNavigation();
                            displayCurrentProduct();
                        }
                    }

                    function lastProduct() {
                        if (products.length > 0) {
                            currentProductIndex = products.length - 1;
                            updateProductNavigation();
                            displayCurrentProduct();
                        }
                    }

                    function addNewProduct() {
                        const nombreProducto = document.getElementById('nombreProducto').value.trim();

                        if (nombreProducto === '') {
                            showAlert('Por favor, ingrese el nombre del producto antes de agregarlo.', 'warning');
                            document.getElementById('nombreProducto').focus();
                            return;
                        }

                        // Check if product already exists
                        const existingProduct = products.find(p => p.nombre.toLowerCase() === nombreProducto.toLowerCase());
                        if (existingProduct) {
                            showAlert('Ya existe un producto con ese nombre.', 'warning');
                            return;
                        }

                        const newProduct = {
                            id: products.length > 0 ? Math.max(...products.map(p => p.id)) + 1 : 1,
                            nombre: nombreProducto
                        };

                        products.push(newProduct);
                        currentProductIndex = products.length - 1;
                        updateProductNavigation();

                        showAlert('Producto "' + nombreProducto + '" agregado exitosamente', 'success');
                    }

                    function saveProduct() {
                        const nombreProducto = document.getElementById('nombreProducto').value.trim();

                        if (nombreProducto === '') {
                            showAlert('Por favor, ingrese el nombre del producto.', 'warning');
                            return;
                        }

                        if (products.length === 0 || currentProductIndex < 0) {
                            showAlert('No hay un producto seleccionado para guardar.', 'warning');
                            return;
                        }

                        // Update current product
                        products[currentProductIndex].nombre = nombreProducto;

                        showAlert('Producto guardado exitosamente', 'success');
                    }

                    function deleteProduct() {
                        if (products.length === 0 || currentProductIndex < 0) {
                            showAlert('No hay un producto seleccionado para eliminar.', 'warning');
                            return;
                        }

                        const productName = products[currentProductIndex].nombre;

                        if (confirm('¿Está seguro que desea eliminar el producto "' + productName + '"?')) {
                            products.splice(currentProductIndex, 1);

                            // Adjust current index
                            if (currentProductIndex >= products.length) {
                                currentProductIndex = products.length - 1;
                            }
                            if (currentProductIndex < 0) {
                                currentProductIndex = 0;
                            }

                            updateProductNavigation();
                            displayCurrentProduct();

                            showAlert('Producto "' + productName + '" eliminado exitosamente', 'success');
                        }
                    }

                    function clearProductForm() {
                        document.getElementById('nombreProducto').value = '';
                        clearAssociationResults();
                        showAlert('Formulario limpiado', 'info');
                    }

                    function clearAssociationResults() {
                        document.getElementById('associationResults').innerHTML = '<div class="no-association">' +
                            '<i class="fas fa-info-circle"></i>' +
                            '<p>Seleccione "Conceptos" o "Servicios" para gestionar las asociaciones del producto actual</p>' +
                            '</div>';
                    }

                    function manageConceptos() {
                        if (products.length === 0 || currentProductIndex < 0) {
                            showAlert('Seleccione un producto primero.', 'warning');
                            return;
                        }

                        const currentProduct = products[currentProductIndex];
                        showAlert('Cargando conceptos para el producto "' + currentProduct.nombre + '"...', 'info');

                        // Simulate API call for concepts
                        setTimeout(() => {
                            const mockConceptos = [
                                { id: 1, codigo: 'INTERNET_BASIC', descripcion: 'Internet Básico', activo: true },
                                { id: 2, codigo: 'INTERNET_PREMIUM', descripcion: 'Internet Premium', activo: true },
                                { id: 3, codigo: 'INSTALACION', descripcion: 'Instalación', activo: false },
                                { id: 4, codigo: 'MANTENIMIENTO', descripcion: 'Mantenimiento Técnico', activo: true }
                            ];

                            displayAssociations('Conceptos', mockConceptos, 'concepto');
                        }, 1000);
                    }

                    function manageServicios() {
                        if (products.length === 0 || currentProductIndex < 0) {
                            showAlert('Seleccione un producto primero.', 'warning');
                            return;
                        }

                        const currentProduct = products[currentProductIndex];
                        showAlert('Cargando servicios para el producto "' + currentProduct.nombre + '"...', 'info');

                        // Simulate API call for services
                        setTimeout(() => {
                            const mockServicios = [
                                { id: 1, codigo: 'SRV_001', descripcion: 'Soporte Técnico 24/7', activo: true },
                                { id: 2, codigo: 'SRV_002', descripcion: 'Instalación Domiciliaria', activo: true },
                                { id: 3, codigo: 'SRV_003', descripcion: 'Configuración WiFi', activo: false },
                                { id: 4, codigo: 'SRV_004', descripcion: 'Monitoreo de Red', activo: true }
                            ];

                            displayAssociations('Servicios', mockServicios, 'servicio');
                        }, 1000);
                    }

                    function displayAssociations(type, items, itemType) {
                        const resultsContainer = document.getElementById('associationResults');

                        if (items.length === 0) {
                            resultsContainer.innerHTML = '<div class="no-association">' +
                                '<i class="fas fa-exclamation-triangle"></i>' +
                                '<p>No se encontraron ' + type.toLowerCase() + ' para este producto</p>' +
                                '</div>';
                            return;
                        }

                        resultsContainer.innerHTML = '<h4><i class="fas fa-list"></i> ' + type + ' Asociados</h4>' +
                            '<div class="associations-table-container">' +
                            '<table class="associations-table">' +
                            '<thead>' +
                            '<tr>' +
                            '<th>Código</th>' +
                            '<th>Descripción</th>' +
                            '<th>Estado</th>' +
                            '<th>Acciones</th>' +
                            '</tr>' +
                            '</thead>' +
                            '<tbody>' +
                            items.map(item =>
                                '<tr>' +
                                '<td><strong>' + item.codigo + '</strong></td>' +
                                '<td>' + item.descripcion + '</td>' +
                                '<td>' +
                                '<span class="status-badge ' + (item.activo ? 'status-active' : 'status-inactive') + '">' +
                                (item.activo ? 'Activo' : 'Inactivo') +
                                '</span>' +
                                '</td>' +
                                '<td>' +
                                '<div class="action-buttons">' +
                                '<button type="button" class="btn-action btn-edit" onclick="editAssociation(' + item.id + ', \'' + itemType + '\')" title="Editar">' +
                                '<i class="fas fa-edit"></i>' +
                                '</button>' +
                                '<button type="button" class="btn-action btn-delete" onclick="removeAssociation(' + item.id + ', \'' + itemType + '\')" title="Eliminar asociación">' +
                                '<i class="fas fa-unlink"></i>' +
                                '</button>' +
                                '</div>' +
                                '</td>' +
                                '</tr>'
                            ).join('') +
                            '</tbody>' +
                            '</table>' +
                            '</div>' +
                            '<div style="margin-top: 1rem; text-align: center;">' +
                            '<button type="button" class="btn btn-primary" onclick="addAssociation(\'' + itemType + '\')">' +
                            '<i class="fas fa-plus"></i> Agregar ' + itemType +
                            '</button>' +
                            '</div>';
                    }

                    function editAssociation(id, type) {
                        showAlert('Funcionalidad de edición en desarrollo para ' + type + ' ID: ' + id, 'info');
                    }

                    function removeAssociation(id, type) {
                        if (confirm('¿Está seguro que desea eliminar esta asociación?')) {
                            showAlert('Asociación eliminada exitosamente', 'success');
                            // Here you would call the appropriate manage function to refresh the list
                            if (type === 'concepto') {
                                manageConceptos();
                            } else {
                                manageServicios();
                            }
                        }
                    }

                    function addAssociation(type) {
                        showAlert('Funcionalidad para agregar ' + type + ' en desarrollo', 'info');
                    }

                    // Initialize product management
                    document.addEventListener('DOMContentLoaded', function () {
                        // Auto-load products if on product management section
                        if (window.location.hash === '#product_management') {
                            loadProducts();
                        }
                    });

                    // Assigned Promotions Functions
                    function consultarPromocionesAsignadas(event) {
                        event.preventDefault();

                        const numeroServicio = document.getElementById('numeroServicioAsignado').value.trim();

                        if (numeroServicio === '') {
                            showAlert('Por favor, ingrese un número de servicio para consultar.', 'warning');
                            document.getElementById('numeroServicioAsignado').focus();
                            return false;
                        }

                        // Show loading state
                        showAssignedPromotionsLoading(true);

                        // Simulate API call for assigned promotions - Replace with actual service call
                        setTimeout(() => {
                            const mockServiceInfo = {
                                numeroServicio: numeroServicio,
                                cliente: 'María Elena González',
                                direccion: 'Carrera 15 #32-45, Bogotá',
                                tipoCliente: 'RESIDENCIAL',
                                planActual: 'Internet 200MB + TV HD'
                            };

                            const mockAssignedPromotions = [
                                {
                                    id: 1,
                                    nombre: 'Descuento Navidad 2025',
                                    codigo: 'PROMO-NAV-2025',
                                    descripcion: 'Descuento especial por temporada navideña',
                                    valor: 25000,
                                    fechaAsignacion: '2024-12-01',
                                    fechaInicio: '2024-12-01',
                                    fechaFin: '2025-01-31',
                                    estado: 'VIGENTE',
                                    tipoDescuento: 'Porcentual',
                                    porcentaje: 15,
                                    categoria: 'Internet'
                                },
                                {
                                    id: 2,
                                    nombre: 'Upgrade Gratis',
                                    codigo: 'UPGRADE-FREE',
                                    descripcion: 'Mejora de velocidad sin costo adicional',
                                    valor: 30000,
                                    fechaAsignacion: '2024-11-15',
                                    fechaInicio: '2024-12-01',
                                    fechaFin: '2025-05-31',
                                    estado: 'VIGENTE',
                                    tipoDescuento: 'Valor Fijo',
                                    porcentaje: 0,
                                    categoria: 'Internet'
                                },
                                {
                                    id: 3,
                                    nombre: 'Promo Estudiante',
                                    codigo: 'EST-2024',
                                    descripcion: 'Descuento especial para estudiantes',
                                    valor: 20000,
                                    fechaAsignacion: '2024-08-15',
                                    fechaInicio: '2024-08-15',
                                    fechaFin: '2024-12-15',
                                    estado: 'VENCIDA',
                                    tipoDescuento: 'Porcentual',
                                    porcentaje: 20,
                                    categoria: 'Combo'
                                }
                            ];

                            displayAssignedPromotions(mockServiceInfo, mockAssignedPromotions);
                            showAssignedPromotionsLoading(false);

                            showAlert('Consulta realizada exitosamente. Se encontraron ' + mockAssignedPromotions.length + ' promociones asignadas.', 'success');
                        }, 2000);

                        return false;
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

                    function clearClientType() {
                        document.getElementById('tipoClienteAsignado').value = '';
                        showAlert('Tipo de cliente limpiado', 'info');
                    }

                    function cancelarConsulta() {
                        if (confirm('¿Está seguro que desea cancelar la consulta? Se limpiarán todos los datos.')) {
                            // Reset form
                            document.querySelector('.assigned-form').reset();

                            // Reset display area
                            document.getElementById('promocionesAsignadasArea').innerHTML = '<div class="no-promotions-assigned">' +
                                '<i class="fas fa-search"></i>' +
                                '<p>Ingrese un número de servicio y presione "Consultar" para ver las promociones asignadas</p>' +
                                '</div>';

                            showAlert('Consulta cancelada y formulario limpiado', 'info');
                        }
                    }
                </script>
            </body>

            </html>