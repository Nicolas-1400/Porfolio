const { DataTypes } = require('sequelize');
const sequelize = require('../database/conexion');

module.exports = sequelize.define('programadores_proyectos', {
  programadorId: DataTypes.INTEGER,
  proyectoId: DataTypes.INTEGER,
}, { timestamps: false });
