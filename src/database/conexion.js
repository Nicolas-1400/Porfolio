const { Sequelize } = require('sequelize');

// Configuración de conexión a MySQL
const sequelize = new Sequelize(
    'portfolio',
    'root',
    '',
    {
        host: 'localhost',
        dialect: 'mysql'
    }
);

// Verificar conexión
sequelize
    .authenticate()
    .then(() => {
        console.log('Conexión establecida correctamente.');
    })
    .catch((error) => {
        console.error('No se pudo conectar a la base de datos.', error);
    });

module.exports = sequelize;