// Function to set toggle menu
function toggleMenu() {
    const menu = document.getElementById('menu');
    menu.style.display = (menu.style.display === 'block' ? 'none' : 'block');
}

// Function to show section menu promotions modules
function showSection(sectionId) {
    const sections = document.querySelectorAll('.section');
    sections.forEach(section => section.classList.remove('active'));

    const selectedSection = document.getElementById(sectionId);
    selectedSection.classList.add('active');

    // Cierra el menú después de hacer la selección
    const menu = document.getElementById('menu');
    menu.style.display = 'none';
}
