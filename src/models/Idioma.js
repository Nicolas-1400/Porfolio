const { DataTypes } = require('sequelize');
const sequelize = require('../database/conexion');

module.exports = sequelize.define('idiomas', {
  nombre: { type: DataTypes.STRING, allowNull: false },
}, { timestamps: false });
