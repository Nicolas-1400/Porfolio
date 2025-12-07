const { Sequelize } = require("sequelize");

// Configuración de conexión a MySQL
const sequelize = new Sequelize("portfolio", "root", "", {
  host: "localhost",
  dialect: "mysql",
});

module.exports = sequelize;
